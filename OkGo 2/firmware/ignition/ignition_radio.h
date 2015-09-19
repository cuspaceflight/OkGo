#ifndef IGNITION_RADIO_H
#define IGNITION_RADIO_H

#include <stdbool.h>
#include <stdint.h>

/* Setup the SPI peripheral and call the RFM95W initialisation procedure.
 * Also initialise all the above state variables to sensible defaults */
void ignition_radio_init(void);

#endif
