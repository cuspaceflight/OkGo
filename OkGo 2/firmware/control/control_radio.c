#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>

#include "control_pins.h"
#include "control_radio.h"
#include "rfm95w.h"

/* Local radio state: */
uint32_t packet_id;

/* Transmit and receive packet buffers */
uint8_t tx_buf[TX_BUF_LEN], rx_buf[RX_BUF_LEN];

/* Received packet datastore: */
uint32_t rx_packet_id;
uint8_t rx_rssi, rx_voltage, rx_status;
uint8_t rx_cont1, rx_cont2, rx_cont3, rx_cont4;
uint16_t rx_checksum;

/* Setup the SPI peripheral and call the RGM95W initialization procedure.
 * Also initialise all the state variables to sensible defaults */
void control_radio_init(void)
{
    /* Clock SPI1 peripheral and setup GPIOs appropriately: 
     * NSS, SCK, MOSI, RESET are outputs,
     * MISO is input.
     * SPI setup is done in rfm95w.c */
    rcc_periph_clock_enable(RCC_SPI1);
    gpio_mode_setup(RFM_NSS_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RFM_NSS);
    gpio_mode_setup(RFM_SCK_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RFM_SCK);
    gpio_mode_setup(RFM_MOSI_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RFM_MOSI);
    /*gpio_mode_setup(RFM_RESET_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    RFM_RESET);*/
    gpio_mode_setup(RFM_MISO_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, RFM_MISO);

    /* Bring the radio out of reset: rfm_init will wait for it to warm up */
    /*gpio_set(RFM_RESET_PORT, RFM_RESET);*/
    /* By default leave RFM_RESET high-Z as requested by datasheet */

    /* Run RFM95W initialization */
    rfm_initialise(SPI1);

    /* Setup state variables to sensible defaults */
	memset(tx_buf, 0, TX_BUF_LEN);
	memset(rx_buf, 0, RX_BUF_LEN);
	packet_id = 0;
	rx_packet_id = rx_rssi = rx_voltage = rx_status = 0;
	rx_cont1 = rx_cont2 = rx_cont3 = rx_cont4 = 0;
	rx_checksum = 0;
}

/* Parse a received radio packet and fill in the received packet datastore */
void control_radio_parse_packet(uint8_t *buf, uint8_t len)
{
	// TODO
	(void)buf;
	(void)len;
}

/* Make a packet with the supplied command byte (arm status, fire status, buzzer
 * control into the supplied buffer.  Returns packet length. */
uint8_t control_radio_make_packet(uint8_t command, uint8_t *buf, uint8_t len)
{
	// TODO
	(void)command;
	(void)buf;
	(void)len;
	return 0;
}
