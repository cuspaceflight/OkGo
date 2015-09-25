#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>

#include "control_pins.h"
#include "control_radio.h"
#include "rfm95w.h"
#include "control.h"
#include "hmac.h"
#include "key.h"

/* Setup the SPI peripheral and call the RGM95W initialization procedure.
 * Also initialise all the state variables to sensible defaults */
void control_radio_init(control_radio_state *radio_state)
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

    /* Bring the radio out of reset: rfm_init will wait for it to warm up */
    /*gpio_mode_setup(RFM_RESET_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    RFM_RESET);*/
    /*gpio_set(RFM_RESET_PORT, RFM_RESET);*/
    /* By default leave RFM_RESET high-Z as requested by datasheet */

    /* Run RFM95W initialization */
    rfm_initialise(SPI1, RFM_NSS_PORT, RFM_NSS);

    /* Setup state variables to sensible defaults */
	radio_state->valid_rx = false;
    radio_state->lost_link = true;
    radio_state->rx_rssi = 0;
    radio_state->rx_voltage = 0;
    radio_state->rx_status = 0;
	radio_state->rx_cont1 = 0;
    radio_state->rx_cont2 = 0;
    radio_state->rx_cont3 = 0;
    radio_state->rx_cont4 = 0;
    radio_state->packet_rssi = 0;
}

/* Transmit a packet to ignition based on the contents of state */
void control_radio_transmit(control_state *state, control_radio_state *radio_state)
{
    uint8_t buf[11];
    uint8_t command = 0;

    (void)radio_state; /* Might use this later for a tx ID */

    command |= state->armed << 4;
    command |= (state->ch4_status == CH_STATUS_FIRE) << 3;
    command |= (state->ch3_status == CH_STATUS_FIRE) << 2;
    command |= (state->ch2_status == CH_STATUS_FIRE) << 1;
    command |= (state->ch1_status == CH_STATUS_FIRE);
    buf[0] = command;

    /* Generate message HMAC signature */
    hmac_md5_80(buf, 1, key, key_len, buf + 1);

    rfm_transmit(buf, 11);
}

/* Initiate packet reception and block until a packet is received */
void control_radio_receive_blocking(control_radio_state *radio_state)
{
    uint8_t rx_buf[17];

    rfm_receive(rx_buf, 17);
    control_radio_parse_packet(radio_state, rx_buf, 17);
    radio_state->packet_rssi = rfm_getrssi();
}

/* Retrieve and parse a packet received in async receive */
void control_radio_receive_async(control_radio_state *radio_state)
{
    uint8_t rx_buf[17];

    if(rfm_packet_retrieve(rx_buf, 17))
        control_radio_parse_packet(radio_state, rx_buf, 17);
    else
        radio_state->valid_rx = false;
    radio_state->packet_rssi = rfm_getrssi();
}

/* Parse a received radio packet and fill in the received packet datastore */
void control_radio_parse_packet(control_radio_state *radio_state, uint8_t *buf,
                                uint8_t len)
{
    uint8_t hmac[10];

    if(len != 17)
    {
        /* Invalid packet! */
        radio_state->valid_rx = false;
        return;
    }

    /* Check message HMAC signature.  Do this before unloading the rest of the
     * buffer so that we can still display the old data after dumping an
     * invalid packet */

    hmac_md5_80(buf, 7, key, key_len, hmac);
    if(memcmp(hmac, buf + 7, 10) == 0)
        radio_state->valid_rx = true; /* Good HMAC */
    else
    {
        radio_state->valid_rx = false; /* Invalid HMAC */
        return;
    }

    radio_state->rx_rssi = buf[0];
    radio_state->rx_voltage = buf[1];
    radio_state->rx_status = buf[2];
    radio_state->rx_cont1 = buf[3];
    radio_state->rx_cont2 = buf[4];
    radio_state->rx_cont3 = buf[5];
    radio_state->rx_cont4 = buf[6];

}
