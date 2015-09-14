#ifndef IGNITION_RADIO_H
#define IGNITION_RADIO_H

#include <stdbool.h>
#include <stdint.h>

/* Ignition radio state structure */
typedef struct
{
	/* Received packet datastore */
	bool valid_rx;
	uint8_t packet_rssi; /* RSSI of the incoming packet */
	uint8_t command;
} ignition_radio_state;

/* Setup the SPI peripheral and call the RFM95W initialisation procedure.
 * Also initialise all the above state variables to sensible defaults */
void ignition_radio_init(ignition_radio_state *radio_state);

/* Transmit a packet to control based on the contents of state */
void ignition_radio_transmit(ignition_state *state,
							 ignition_radio_state *radio_state);

/* Initiate packet reception and block until a packet is received */
void ignition_radio_receive_blocking(ignition_radio_state *radio_state);

/* Parse a received radio packet and fill in the received packet datastore */
void ignition_radio_parse_packet(ignition_radio_state *radio_state,
							     uint8_t *buf, uint8_t len);


#endif
