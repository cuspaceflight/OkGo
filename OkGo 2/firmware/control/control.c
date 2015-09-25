#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

/* Common includes */
#include "rfm95w.h"
#include "utils.h"

/* control-specific includes */
#include "control.h"
#include "control_radio.h"
#include "control_pins.h"
#include "display.h"
#include "adc.h"
#include "splash.h"

/* Configuration constants */
const uint16_t SLOW_PACKET_DELAY = 1000; /* delay in ms */
const uint16_t FAST_PACKET_DELAY = 250; /* delay in ms */
const uint32_t PACKET_DROP_DELAY = 2000;
const uint8_t RADIO_POWER_DBM = 10; /* Radio tx power in dBm */
const uint8_t MAX_RESISTANCE = 50; /* Max R in ohms of device otherwise CERR */

/* Internal functions */

/* Initialisation including clocks, pins, radio, state, ADCs */
void control_init(control_state *state, control_radio_state *radio_state);

/* Convert a channel status enum into a string and print to LCD */
void control_display_ch_status(uint8_t ch_status, bool remote_fire);

/* Display a continuity resistance to the LCD */
void control_display_ch_cont(uint8_t cont, uint8_t ch_status);

/* Update display from local state */
void control_display_update(control_state *state,
                            control_radio_state *radio_state);

void control_init(control_state *state, control_radio_state *radio_state)
{
    /* Initialise local state variables */
    state->armed = false;
    state->centre_frf = FRF_915;
    state->ch1_status = CH_STATUS_OK;
    state->ch2_status = CH_STATUS_OK;
    state->ch3_status = CH_STATUS_OK;
    state->ch4_status = CH_STATUS_OK;

    /* Setup crystal oscillator and systick */
    rcc_clock_setup_in_hsi_out_48mhz();
    systick_init();

    /* Clock GPIOs, set pin modes */
    control_pins_init();

    /* Initialise radio and radio state */
    control_radio_init(radio_state);
    rfm_setfreq(state->centre_frf);
    rfm_setpower(RADIO_POWER_DBM);

    /* ADC Setup: Clock periph, run init. Pins done in control_pins */
    rcc_periph_clock_enable(RCC_ADC);
    adc_init();

    /* Initialise display */
    lcd_init();
}

/* Display a continuity resistance to the LCD */
void control_display_ch_status(uint8_t ch_status, bool remote_fire)
{
    if(remote_fire)
    {
        lcd_puts("FIRE ");
        return;
    }

    switch(ch_status)
    {
        case CH_STATUS_OK:
            lcd_puts(" OK  ");
            break;
        case CH_STATUS_CONT_ERR:
            lcd_puts(" ERR ");
            break;
        case CH_STATUS_FIRE:
            /* We are requesting fire but remote refuses/ignores */
            lcd_puts(" NO  ");
            break;
        default:
            lcd_puts("     ");
    }
}

/* Display a continuity resistance to the LCD */
void control_display_ch_cont(uint8_t cont, uint8_t ch_status)
{
    /* Don't display invalid continuities for firing channels */
    if(ch_status == CH_STATUS_FIRE)
    {
        lcd_puts("     ");
        return;
    }
        
    if(cont == 255)
    {
        /* 255 is a magic value meaning open */
        lcd_puts("  ");
        lcd_putc(0b11110011);
    }
    else if(cont == 254)
        /* 254 is a magic value meaning >255 but not open */
        lcd_puts(" hi");
    else
    {
        lcd_putc('0' + cont / 100);
        lcd_putc('0' + (cont / 10) % 10);
        lcd_putc('0' + cont % 10);
    }
    lcd_putc(0b11110100); /* Character code for ohms */
    lcd_putc(' ');
}

/* Update display from local state */
void control_display_update(control_state *state,
                            control_radio_state *radio_state)
{
    /* Display format (link):
     * ######################
     * #3.7V  DISARM SIG:99%#
     * #12.2V DISARM SIG:80%#
     * #002R      255R 000R #
     * # OK  FIRE ERR   OK  #
     * ######################
     *
     * Display format (no link):
     * ######################
     * #3.7V  DISARM SIG:0%V#
     * #      NO LINK!      #
     * #002R      255R 000R #
     * # OK  FIRE ERR   OK  #
     * ######################
     */
    uint32_t adc_val;
    uint32_t control_batt_voltage;
    adc_val = adc_read(ADC_CH_CTRL_BATT); /* Read raw value */
    adc_val = adc_to_millivolts(adc_val); /* Convert to millivolts */
    /* Batt voltage comes via a 3k3 over 10k potential divider such that
     * V = Vbatt * 10/13.3
     * Vbatt = V * 133/100 */
    control_batt_voltage = adc_val * 133 / 100;
    /* We will round to tenths of a volt, AKA 100 millivolts
     * This bodge means the later implicit truncation acts like a proper round
     * Ignition is sent over pre-rounded so we don't need to do this for it */
    if((control_batt_voltage / 10) % 10 >= 5)
        control_batt_voltage += 10;

    /* Control battery voltage */
    lcd_cursor_pos(0, 0);
    lcd_putc('0' + control_batt_voltage / 1000);
    lcd_putc('.');
    lcd_putc('0' + (control_batt_voltage / 100) % 10);
    lcd_puts("V  ");

    /* Control state */
    lcd_cursor_pos(0, 6);
    if(state->armed)
        lcd_puts("ARMED  ");
    else
        lcd_puts("DISARM ");

    /* Control signal level */
    lcd_cursor_pos(0, 13);
    lcd_puts("SIG:");
    lcd_putc('0' + radio_state->packet_rssi / 10);
    lcd_putc('0' + radio_state->packet_rssi % 10);
    lcd_putc('%');

    /* Ignition's row: */
    lcd_cursor_pos(1, 0);
    if(!radio_state->lost_link)
    {
        /* Battery voltage */
        lcd_putc('0' + radio_state->rx_voltage / 100);
        lcd_putc('0' + (radio_state->rx_voltage / 10) % 10);
        lcd_putc('.');
        lcd_putc('0' + radio_state->rx_voltage % 10);
        lcd_puts("V ");

        /* State: */
        if(radio_state->rx_status & (0b11100000))
            lcd_puts("ERROR  ");
        else
            if(radio_state->rx_status & (1<<4))
                lcd_puts("ARMED  ");
            else
                lcd_puts("DISARM ");
        
        /* Signal level */
        lcd_puts("SIG:");
        lcd_putc('0' + radio_state->rx_rssi / 10);
        lcd_putc('0' + radio_state->rx_rssi % 10);
        lcd_putc('%');
    }
    else
        lcd_puts("      NO LINK!      ");


    /* Channel continuities */
    lcd_cursor_pos(2, 0);
    if(!radio_state->lost_link)
    {
        control_display_ch_cont(radio_state->rx_cont1, state->ch1_status);
        control_display_ch_cont(radio_state->rx_cont2, state->ch2_status);
        control_display_ch_cont(radio_state->rx_cont3, state->ch3_status);
        control_display_ch_cont(radio_state->rx_cont4, state->ch4_status);
    }
    else
        lcd_puts("                    ");

    /* Control channel status */
    lcd_cursor_pos(3, 0);
    control_display_ch_status(state->ch1_status, radio_state->rx_status&0x01);
    control_display_ch_status(state->ch2_status, radio_state->rx_status&0x02);
    control_display_ch_status(state->ch3_status, radio_state->rx_status&0x04);
    control_display_ch_status(state->ch4_status, radio_state->rx_status&0x08);

}

int main(void)
{
    control_state state;
    control_radio_state radio_state;
    uint32_t loop_timer;
    uint32_t last_packet = 0;

    control_init(&state, &radio_state);

    splash();

    /* Default: deafen */
    state.beep_volume = 3;
    if(!gpio_get_bool(SW_CH1_PORT, SW_CH1))
        state.beep_volume = 0; /* off */
    if(!gpio_get_bool(SW_CH2_PORT, SW_CH2))
        state.beep_volume = 1; /* low */
    if(!gpio_get_bool(SW_CH3_PORT, SW_CH3))
        state.beep_volume = 2; /* med */
    if(!gpio_get_bool(SW_CH4_PORT, SW_CH4))
        state.beep_volume = 3; /* high */

    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    loop_timer = get_millis();
    while(1)
    {
        /* Arming status */
        state.armed = !gpio_get_bool(SW_KEY_PORT, SW_KEY);
        gpio_set_bool(LED_ARM_PORT, LED_ARM, state.armed);
        gpio_set_bool(LED_DISARM_PORT, LED_DISARM, !(state.armed));
 
        /* Start with channels okay and un-firing */       
        state.ch1_status = CH_STATUS_OK;
        state.ch2_status = CH_STATUS_OK;
        state.ch3_status = CH_STATUS_OK;
        state.ch4_status = CH_STATUS_OK;
        
        /* Detect continuity errors */
        if(!radio_state.lost_link)
        {
            if(radio_state.rx_cont1 > MAX_RESISTANCE)
                state.ch1_status = CH_STATUS_CONT_ERR;
            if(radio_state.rx_cont2 > MAX_RESISTANCE)
                state.ch2_status = CH_STATUS_CONT_ERR;
            if(radio_state.rx_cont3 > MAX_RESISTANCE)
                state.ch3_status = CH_STATUS_CONT_ERR;
            if(radio_state.rx_cont4 > MAX_RESISTANCE)
                state.ch4_status = CH_STATUS_CONT_ERR;
        }

        /* Detect firing state */
        if(state.armed)
        {
            if(!gpio_get_bool(SW_CH1_PORT, SW_CH1))
                state.ch1_status = CH_STATUS_FIRE;
            if(!gpio_get_bool(SW_CH2_PORT, SW_CH2))
                state.ch2_status = CH_STATUS_FIRE;
            if(!gpio_get_bool(SW_CH3_PORT, SW_CH3))
                state.ch3_status = CH_STATUS_FIRE;
            if(!gpio_get_bool(SW_CH4_PORT, SW_CH4))
                state.ch4_status = CH_STATUS_FIRE;
        }

        /* Set channel LEDs based on firing/cont and armed status */
        gpio_set_bool(LED_CH1_PORT, LED_CH1,
                      state.armed && (state.ch1_status == CH_STATUS_OK));
        gpio_set_bool(LED_CH1_PORT, LED_CH2,
                      state.armed && (state.ch2_status == CH_STATUS_OK));
        gpio_set_bool(LED_CH1_PORT, LED_CH3,
                      state.armed && (state.ch3_status == CH_STATUS_OK));
        gpio_set_bool(LED_CH1_PORT, LED_CH4,
                      state.armed && (state.ch4_status == CH_STATUS_OK));

        /* Do TX */
        gpio_set(LED_YELLOW_PORT, LED_YELLOW);
        control_radio_transmit(&state, &radio_state);
        gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

        /* Setup receiver */
        rfm_receive_async(17);

        /* Update display */
        control_display_update(&state, &radio_state);

        /* Delay to correctly set loop timing */
        if(state.armed)
            while((get_millis() - loop_timer) < FAST_PACKET_DELAY);
        else
            while((get_millis() - loop_timer) < SLOW_PACKET_DELAY);
        loop_timer = get_millis();

        /* Attempt receive (used in next cycle before delay) */
        control_radio_receive_async(&radio_state);

        if(radio_state.valid_rx)
            last_packet = get_millis();
        if((get_millis() - last_packet) > PACKET_DROP_DELAY)
            radio_state.lost_link = true;
        else
            radio_state.lost_link = false;

        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
    }
    
    return 0;
}
