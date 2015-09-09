#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

#include "rfm95w.h"
#include "utils.h"

#include "control_radio.h"
#include "control_pins.h"
#include "display.h"

/* Configuration constants */
const uint16_t SLOW_PACKET_DELAY = 2000; /* delay in ms */
const uint16_t FAST_PACKET_DELAY = 100; /* delay in ms */
const bool PA_BOOST = false;

/* State variables */
static bool armed;
static uint32_t centre_freq; /* in kHz */
static uint16_t packet_delay;
static uint32_t last_tx_time;

/* Internal functions */
void control_init(void);
void control_adc_setup(void);
void control_read_config(void);

void control_init(void)
{
    /* Initialise local state variables */
    armed = false;
    centre_freq = FREQ_868;
    packet_delay = SLOW_PACKET_DELAY;

    /* Setup crystal oscillator */
    rcc_clock_setup_in_hsi_out_48mhz();

    /* Clock GPIOs, set pin modes */
    control_pins_init();

    /* Read stored config including centre frequency*/
    control_read_config();

    /* Initialise radio and radio state */
    control_radio_init();
    rfm_setfreq(centre_freq);

    /* Setup ADC to scan-read battery voltage */
    control_adc_setup();

    /* Initialise display */
    lcd_init();
}

void control_adc_setup(void)
{
    // TODO
}

void control_read_config(void)
{
    // TODO
}

int main(void)
{
    uint16_t thetime=0; /* TODO! */
    control_init();

    lcd_puts("Hello, world!");
    lcd_cursor_pos(1, 0);
    lcd_puts("Second line!");
    lcd_cursor_pos(2, 0);
    lcd_puts("Third line!");
    lcd_cursor_pos(3, 1);
    lcd_puts("Indent! :o");

    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    while(1)
    {
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

        if(last_tx_time - thetime > packet_delay)
        {
            uint8_t packet_len, command;
            command = 0;TODO bitfield
            packet_len = control_radio_make_packet(command, tx_buf, TX_BUF_LEN);
            rfm_transmit(tx_buf, packet_len, PA_BOOST);
        }*/
        /*bool key_armed = !gpio_get_bool(SW_KEY_PORT, SW_KEY);
        gpio_set_bool(LED_ARM_PORT, LED_ARM, key_armed);
        gpio_set_bool(LED_DISARM_PORT, LED_DISARM, !key_armed);
        
        if(key_armed)
        {
            gpio_set_bool(LED_CH1_PORT, LED_CH1,
                gpio_get_bool(SW_CH1_PORT, SW_CH1));
            gpio_set_bool(LED_CH2_PORT, LED_CH2,
                gpio_get_bool(SW_CH2_PORT, SW_CH2));
            gpio_set_bool(LED_CH3_PORT, LED_CH3,
                gpio_get_bool(SW_CH3_PORT, SW_CH3));
            gpio_set_bool(LED_CH4_PORT, LED_CH4,
                gpio_get_bool(SW_CH4_PORT, SW_CH4));
        }
        else
        {
            gpio_clear(LED_CH1_PORT, LED_CH1);
            gpio_clear(LED_CH2_PORT, LED_CH2);
            gpio_clear(LED_CH3_PORT, LED_CH3);
            gpio_clear(LED_CH4_PORT, LED_CH4);
        }*/

        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
        gpio_toggle(LED_YELLOW_PORT, LED_YELLOW);
        delay_us(1000000u);
        
    }
    
    return 0;
}
