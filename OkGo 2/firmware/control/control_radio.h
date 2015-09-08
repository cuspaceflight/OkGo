#ifndef CONTROL_RADIO_H
#define CONTROL_RADIO_H

#include <stdbool.h>
#include <stdint.h>

/* Transmit and receive packet buffers */
/* Constants as defines not consts so we can use as static array length */
#define TX_BUF_LEN 255
#define RX_BUF_LEN 255
extern uint8_t tx_buf[TX_BUF_LEN], rx_buf[RX_BUF_LEN];

/* Received packet datastore: */
extern uint32_t rx_packet_id;
extern uint8_t rx_rssi, rx_voltage, rx_status;
extern uint8_t rx_cont1, rx_cont2, rx_cont3, rx_cont4;
extern uint16_t rx_checksum;

/* Initialise all the above state variables to sensible defaults */
void control_radio_state_init(void);

/* Parse a received radio packet and fill in the received packet datastore */
void control_radio_parse_packet(uint8_t *buf, uint8_t len);

/* Make a packet with the supplied command byte (arm status, fire status, buzzer
 * control into the supplied buffer.  Returns packet length. */
uint8_t control_radio_make_packet(uint8_t command, uint8_t *buf, uint8_t len);

#endif