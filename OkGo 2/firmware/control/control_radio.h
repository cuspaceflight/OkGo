#ifndef CONTROL_RADIO_H
#define CONTROL_RADIO_H

#include <stdbool.h>
#include <stdint.h>

/* Transmit and receive packet buffer lengths */
#define TX_BUF_LEN 255
#define RX_BUF_LEN 255

#define RX_STATUS_DISARM 0
#define RX_STATUS_ARM 1

/* Control radio state structure */
typedef struct
{
	/* Received packet datastore */
	uint32_t rx_packet_id;
	uint8_t rx_rssi, rx_voltage, rx_status;
	uint8_t rx_cont1, rx_cont2, rx_cont3, rx_cont4;
} control_radio_state;


/* Setup the SPI peripheral and call the RFM95W initialisation procedure.
 * Also initialise all the above state variables to sensible defaults */
void control_radio_init(control_radio_state *radio_state);

/* Parse a received radio packet and fill in the received packet datastore */
void control_radio_parse_packet(uint8_t *buf, uint8_t len);

/* Make a packet with the supplied command byte (arm status, fire status, buzzer
 * control into the supplied buffer.  Returns packet length. */
uint8_t control_radio_make_packet(uint8_t command, uint8_t *buf, uint8_t len);

#endif
