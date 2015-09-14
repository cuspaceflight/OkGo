#ifndef CONTROL_RADIO_H
#define CONTROL_RADIO_H

#include <stdbool.h>
#include <stdint.h>

#include "control.h"

/* Control radio state structure */
typedef struct
{
	/* Received packet datastore */
	bool valid_rx;
	uint8_t packet_rssi; /* RSSI *of* the incoming packet, filled by rx */
	uint8_t rx_rssi; /* RSSI *in* the incoming packet */
	uint8_t rx_voltage, rx_status;
	uint8_t rx_cont1, rx_cont2, rx_cont3, rx_cont4;
} control_radio_state;


/* Setup the SPI peripheral and call the RFM95W initialisation procedure.
 * Also initialise all the above state variables to sensible defaults */
void control_radio_init(control_radio_state *radio_state);

/* Transmit a packet to ignition based on the contents of state */
void control_radio_transmit(control_state *state,
							control_radio_state *radio_state);

/* Initiate packet reception and block until a packet is received */
void control_radio_receive_blocking(control_radio_state *radio_state);

/* Parse a received radio packet and fill in the received packet datastore */
void control_radio_parse_packet(control_radio_state *radio_state, uint8_t *buf,
								uint8_t len);

#endif
