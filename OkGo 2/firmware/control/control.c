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

/* Configuration constants */
const uint16_t SLOW_PACKET_DELAY = 2000; /* delay in ms */
const uint16_t FAST_PACKET_DELAY = 100; /* delay in ms */
const uint8_t RADIO_POWER_DBM = 0; /* Radio tx power in dBm */

/* Internal functions */

/* Initialisation including clocks, pins, radio, state, ADCs */
void control_init(control_state *state, control_radio_state *radio_state);

/* Setup ADC pins and strobed reading */
void control_adc_setup(void);

/* Convert a channel status enum into a string and print to LCD */
void control_display_ch_status(uint8_t ch_status);

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
    state->batt_voltage = 0;

    /* Setup crystal oscillator */
    rcc_clock_setup_in_hsi_out_48mhz();

    /* Clock GPIOs, set pin modes */
    control_pins_init();

    /* Initialise radio and radio state */
    control_radio_init(radio_state);
    rfm_setfreq(state->centre_frf);
    rfm_setpower(RADIO_POWER_DBM);


    /* Setup ADC to scan-read battery voltage */
    control_adc_setup();

    /* Initialise display */
    lcd_init();
}

void control_adc_setup(void)
{
    // TODO
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
/* Update display from local state */
void control_display_update(control_state *state,
                            control_radio_state *radio_state)
{
    /* Control battery voltage */
    lcd_puts("CBAT:");
    lcd_putc('0' + state->batt_voltage / 10);
    lcd_putc('.');
    lcd_putc('0' + state->batt_voltage % 10);
    lcd_putc('V');
    if(radio_state->rx_packet_id == 0)
    {
        lcd_puts(" IBAT:??.?V");

        lcd_cursor_pos(1, 6);
        lcd_puts("NO LINK");
    }
    else
    {
        lcd_putc(' ');
        lcd_puts("IBAT:");
        lcd_putc('0' + radio_state->rx_voltage / 100);
        lcd_putc('0' + (radio_state->rx_voltage / 10) % 10);
        lcd_putc('.');
        lcd_putc('0' + radio_state->rx_voltage % 10);
        lcd_putc('V');

        lcd_cursor_pos(1, 6);
        lcd_puts("       ");
    }

    /* Control and ignition arm status */
    lcd_cursor_pos(2, 0);
    if(state->armed)
        lcd_puts(" C:ARMED  ");
    else
        lcd_puts(" C:DISARM ");
    if(radio_state->rx_packet_id == 0)
    {
        lcd_puts("          ");
    }
    else
        switch(radio_state->rx_status)
        {
            case RX_STATUS_ARM:
                lcd_puts("I:ARMED  ");
                break;
            case RX_STATUS_DISARM:
                lcd_puts("I:DISARM ");
                break;
            default:
                lcd_puts("I:ERROR  ");
        }

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

    control_init(&state, &radio_state);

    /*lcd_puts("Hello, world!");
    lcd_cursor_pos(1, 0);
    lcd_puts("Second line!");
    lcd_cursor_pos(2, 0);
    lcd_puts("Third line!");
    lcd_cursor_pos(3, 1);
    lcd_puts("Indent! :o");*/

    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    while(1)
    {
        uint8_t tx_buf_byte;
        /*
        if(rfm_packet_waiting())
        {
            rfm_receive(rx_buf, RX_BUF_LEN);
            control_radio_parse_packet(rx_buf, RX_BUF_LEN);
             TODO temporary: boop the receive registers 
            (void)rx_packet_id;
            (void)rx_rssi;
            (void)rx_voltage;
            (void)rx_status;
            (void)rx_cont1; (void)rx_cont2; (void)rx_cont3; (void)rx_cont4;
            (void)rx_checksum;
        }
         TODO: Consider Ignition status and error / stuckness 
         TODO: armed state, arm LED, channel LEDs 
        display_update();
        uint8_t packet_len, command;
        command = 0;TODO bitfield
        packet_len = control_radio_make_packet(command, tx_buf, TX_BUF_LEN);
        rfm_transmit(tx_buf, packet_len, PA_BOOST);
        */
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

            tx_buf_byte = 0x10; /* armed */
            /* Load firing status into tx byte */
            tx_buf_byte |= (state.ch1_status == CH_STATUS_FIRE)<<0;
            tx_buf_byte |= (state.ch2_status == CH_STATUS_FIRE)<<1;
            tx_buf_byte |= (state.ch3_status == CH_STATUS_FIRE)<<2;
            tx_buf_byte |= (state.ch4_status == CH_STATUS_FIRE)<<3;
        }
        else
        {
            /* Un-fire all channels */
            state.ch1_status = CH_STATUS_OK;
            state.ch2_status = CH_STATUS_OK;
            state.ch3_status = CH_STATUS_OK;
            state.ch4_status = CH_STATUS_OK;
            /* Clear tx byte */
            tx_buf_byte = 0x00;
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

        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
        gpio_set(LED_YELLOW_PORT, LED_YELLOW);
        rfm_transmit(&tx_buf_byte, 1);
        gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

        control_display_update(&state, &radio_state);

        delay_ms(FAST_PACKET_DELAY);
    }
    
    return 0;
}
