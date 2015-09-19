#ifndef CONTROL_RADIO_H
#define CONTROL_RADIO_H

#include <stdbool.h>
#include <stdint.h>

/* Setup the SPI peripheral and call the RFM95W initialisation procedure.
 * Also initialise all the above state variables to sensible defaults */
void control_radio_init(void);

#endif
