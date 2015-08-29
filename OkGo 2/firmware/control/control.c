#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

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
static uint16_t centre_freq; /* in kHz */
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

    /* Clock GPIOs, set pin modes */
    control_pins_init();

    /* Initialise radio state variables, read stored config*/
    control_radio_state_init();
    control_read_config();

    /* Initialise radio */
    rfm_initialise();
    rfm_setfreq(centre_freq);

    /* Setup ADC to scan-read battery voltage */
    control_adc_setup();
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
        gpio_set(LED_GREEN_PORT, LED_GREEN);
        gpio_clear(LED_YELLOW_PORT, LED_YELLOW);
        delay_ms(200);
        gpio_clear(LED_GREEN_PORT, LED_GREEN);
        gpio_set(LED_YELLOW_PORT, LED_YELLOW);
        delay_ms(200);
    }
    
    return 0;
}
