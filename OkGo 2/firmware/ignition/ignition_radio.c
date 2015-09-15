#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>

#include "ignition.h"
#include "ignition_pins.h"
#include "ignition_radio.h"
#include "rfm95w.h"
#include "adc.h"

/* Setup the SPI peripheral and call the RGM95W initialization procedure.
 * Also initialise all the state variables to sensible defaults */
void ignition_radio_init(ignition_radio_state *radio_state)
{
    /* Clock SPI1 peripheral and setup GPIOs appropriately: 
     * NSS, SCK, MOSI, RESET are outputs,
     * MISO is input.
     * SPI setup is done in rfm95w.c */
    rcc_periph_clock_enable(RCC_SPI1);

    /* Make sure NSS doesn't blip when we enable it: */
    gpio_set(RFM_NSS_PORT, RFM_NSS);
    gpio_mode_setup(RFM_NSS_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RFM_NSS);
    gpio_mode_setup(RFM_SCK_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_SCK);
    gpio_mode_setup(RFM_MOSI_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_MOSI);
    gpio_mode_setup(RFM_MISO_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_MISO);
    gpio_set_af(RFM_SCK_PORT, GPIO_AF0, RFM_SCK);
    gpio_set_af(RFM_MOSI_PORT, GPIO_AF0, RFM_MOSI);
    gpio_set_af(RFM_MISO_PORT, GPIO_AF0, RFM_MISO);

    /* Run RFM95W initialization */
    rfm_initialise(SPI1, RFM_NSS_PORT, RFM_NSS);

	radio_state->valid_rx = false;
}

/* Transmit a packet to control based on the contents of state */
void ignition_radio_transmit(ignition_state *state,
                             ignition_radio_state *radio_state)
{
    uint8_t buf[17];
    uint32_t adc_val;
    uint8_t status;

    buf[0] = radio_state->packet_rssi;

    /* Read battery voltage */
    adc_val = adc_to_millivolts(adc_read(ADC_CH_IGTN_BATT));
    /* Pot divider of 10k over 3k3 s.t. V = Vbatt * 3.3/13.3
     * Vbatt = V * 13.3/3.3 = V * 133/33 */
    adc_val = adc_val * 133 / 33;
    if((adc_val / 10) % 10 >= 5) /* Round instead of truncate */
        buf[1] = adc_val / 100 + 1;
    else
        buf[1] = adc_val / 100;

    /* Status byte */
    status = (state->armed << 4) |
             (state->fire_ch4 << 3) |
             (state->fire_ch3 << 2) |
             (state->fire_ch2 << 1) |
             (state->fire_ch1);
    buf[2] = status;

    /* Channel continuities */
    /* Convert these from 12bit to 8bit, dumping the 4 least significant bits */
    buf[3] = adc_read(ADC_CH_IGTN_CONT1) >> 4;
    buf[4] = adc_read(ADC_CH_IGTN_CONT2) >> 4;
    buf[5] = adc_read(ADC_CH_IGTN_CONT3) >> 4;
    buf[6] = adc_read(ADC_CH_IGTN_CONT4) >> 4;

    /* TODO: Generate HMAC-MD5-80 in buf[7:17] */

    rfm_transmit(buf, 17);
}

/* Initiate packet reception and block until a packet is received */
void ignition_radio_receive_blocking(ignition_radio_state *radio_state)
{
    uint8_t rx_buf[11];

    rfm_receive(rx_buf, 11);
    ignition_radio_parse_packet(radio_state, rx_buf, 11);
}

/* Retrieve and parse a packet received in async receive */
void ignition_radio_receive_async(ignition_radio_state *radio_state)
{
    uint8_t rx_buf[11];

    if(rfm_packet_retrieve(rx_buf, 11))
        ignition_radio_parse_packet(radio_state, rx_buf, 11);
    else
        radio_state->valid_rx = false;
}

/* Parse a received radio packet and fill in the received packet datastore */
void ignition_radio_parse_packet(ignition_radio_state *radio_state,
                                 uint8_t *buf, uint8_t len)
{
    if(len != 11)
    {
        /* Invalid packet length! */
        radio_state->valid_rx = false;
        return;
    }

    radio_state->command = buf[0];
    radio_state->valid_rx = true;

    /* TODO: Check HMAC-MD5-80 at buf[1:10] */
}