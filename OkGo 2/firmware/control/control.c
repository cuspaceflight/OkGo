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

/* Configuration constants */
const uint16_t SLOW_PACKET_DELAY = 1000; /* delay in ms */
const uint16_t FAST_PACKET_DELAY = 100; /* delay in ms */
const uint8_t RADIO_POWER_DBM = 10; /* Radio tx power in dBm */

/* Internal functions */

/* Initialisation including clocks, pins, radio, state, ADCs */
void control_init(control_state *state, control_radio_state *radio_state);

/* Convert a channel status enum into a string and print to LCD */
void control_display_ch_status(uint8_t ch_status);

/* Display a continuity resistance to the LCD */
void control_display_ch_cont(uint8_t cont);

/* Update display from local state */
void control_display_update(control_state *state,
                            control_radio_state *radio_state);

void control_init(control_state *state, control_radio_state *radio_state)
{
    /* Initialise local state variables */
    state->armed = false;
    state->centre_frf = FRF_868;
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

void control_display_ch_status(uint8_t ch_status)
{
    switch(ch_status)
    {
        case CH_STATUS_OK:
            lcd_puts("OK   ");
            break;
        case CH_STATUS_CONT_ERR:
            lcd_puts("ERR  ");
            break;
        case CH_STATUS_FIRE:
            lcd_puts("FIRE ");
            break;
        default:
            lcd_puts("     ");
    }
}

/* Display a continuity resistance to the LCD */
void control_display_ch_cont(uint8_t cont)
{
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
    /* Display format (no link): 
     * ######################
     * #CBAT:3.7V IBAT:??.?V#
     * # C:ARMED  NO LINK!  #
     * #                    #
     * #OK   OK   FIRE OK   #
     * ######################
     *
     * Display format (link):
     * ######################
     * #CBAT:3.7V IBAT:12.2V#
     * # C:ARMED  I:ARMED   #
     * #002R 255R 255R 000R #
     * #OK   ERR  ERR  ERR  #
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

    /* Control battery voltage */
    lcd_cursor_pos(0, 0);
    lcd_puts("CBAT:");
    lcd_putc('0' + control_batt_voltage / 1000);
    lcd_putc('.');
    if((control_batt_voltage / 10) % 10 >= 5)
        lcd_putc('0' + (control_batt_voltage / 100) % 10 + 1);
    else
        lcd_putc('0' + (control_batt_voltage / 100) % 10);
    lcd_putc('V');

    /* Ignition battery voltage */
    if(radio_state->valid_rx)
    {
        lcd_putc(' ');
        lcd_puts("IBAT:");
        lcd_putc('0' + radio_state->rx_voltage / 100);
        lcd_putc('0' + (radio_state->rx_voltage / 10) % 10);
        lcd_putc('.');
        lcd_putc('0' + radio_state->rx_voltage % 10);
        lcd_putc('V');
    }
    else
        lcd_puts(" IBAT:??.?V");

    /* Control and ignition arm status */
    lcd_cursor_pos(1, 0);
    if(state->armed)
        lcd_puts(" C:ARMED  ");
    else
        lcd_puts(" C:DISARM ");
    if(!(radio_state->valid_rx))
    {
        lcd_puts("NO LINK!  ");
    }
    else
        if(radio_state->rx_status & (0b11100000))
            lcd_puts("I:ERROR  ");
        else
            if(radio_state->rx_status & (1<<4))
                lcd_puts("I:ARMED  ");
            else
                lcd_puts("I:DISARM ");

    /* Channel continuities */
    lcd_cursor_pos(2, 0);
    if(radio_state->valid_rx)
    {
        control_display_ch_cont(radio_state->rx_cont1);
        control_display_ch_cont(radio_state->rx_cont2);
        control_display_ch_cont(radio_state->rx_cont3);
        control_display_ch_cont(radio_state->rx_cont4);
    }
    else
        lcd_puts("                    ");

    /* Control channel status */
    lcd_cursor_pos(3, 0);
    control_display_ch_status(state->ch1_status);
    control_display_ch_status(state->ch2_status);
    control_display_ch_status(state->ch3_status);
    control_display_ch_status(state->ch4_status);
}

int main(void)
{
    control_state state;
    control_radio_state radio_state;
    uint32_t loop_timer;

    control_init(&state, &radio_state);

    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    loop_timer = get_millis();
    while(1)
    {
        /* Arming status */
        state.armed = !gpio_get_bool(SW_KEY_PORT, SW_KEY);
        gpio_set_bool(LED_ARM_PORT, LED_ARM, state.armed);
        gpio_set_bool(LED_DISARM_PORT, LED_DISARM, !(state.armed));
        
        if(state.armed)
        {
            /* Set channel statuses to OK or FIRE depending on buttons */
            state.ch1_status = gpio_get_bool(SW_CH1_PORT, SW_CH1)?
                                CH_STATUS_OK:CH_STATUS_FIRE;
            state.ch2_status = gpio_get_bool(SW_CH2_PORT, SW_CH2)?
                                CH_STATUS_OK:CH_STATUS_FIRE;
            state.ch3_status = gpio_get_bool(SW_CH3_PORT, SW_CH3)?
                                CH_STATUS_OK:CH_STATUS_FIRE;
            state.ch4_status = gpio_get_bool(SW_CH4_PORT, SW_CH4)?
                                CH_STATUS_OK:CH_STATUS_FIRE;
        }
        else
        {
            /* Un-fire all channels */
            state.ch1_status = CH_STATUS_OK;
            state.ch2_status = CH_STATUS_OK;
            state.ch3_status = CH_STATUS_OK;
            state.ch4_status = CH_STATUS_OK;
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

        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
    }
    
    return 0;
}
