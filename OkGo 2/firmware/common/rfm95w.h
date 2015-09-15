#ifndef RFM95W_H
#define RFM95W_H

#include <stdbool.h>
#include <stdint.h>

/************* Exported constants ****************/
/* These frequency register values are found using:
 * Freq = FRF * 32,000,000 / 2^19
 * FRF = Freq / 32,000,000 * 2^19 */

/* http://stakeholders.ofcom.org.uk/binaries/spectrum/spectrum-policy-area/spectrum-management/research-guidelines-tech-info/interface-requirements/IR_2030-june2014.pdf
 * Limit 25mW = 14dBm ERP, no channel bw limit
 * Either limit duty cycle to 1% or implement Directive 1999/5/EC or equiv.
 * Freq = 865,913,993 Hz -> FRF = 14187134.8613 */
#define FRF_868 14187135u

/* http://www.digikey.com/en/articles/techzone/2011/may/unlicensed-915-mhz-band-fits-many-applications-and-allows-higher-transmit-power
 * Limit 4W = 36dBm, unsure of bw limit
 * DSSS required but not FHSS
 * Freq = 925,892,009 Hz -> FRF = 15169814.6755 */
#define FRF_915 15169815u


/************* Exported functions ****************/
/* Initialise the RFM95W. */
void rfm_initialise(uint32_t spi_periph, uint32_t nss_port, uint32_t nss_pin);

/* Set the RFM95W centre frequency using an FRF register value */
void rfm_setfreq(uint32_t frf);


/* Transmit a packet length len stored in buf, optional PA_BOOST to 100mW TX */
void rfm_transmit(uint8_t *buf, uint8_t len);

/* Retrieve a packet, length len, into buf */
void rfm_receive(uint8_t *buf, uint8_t len);

/* Put module into receive mode then return */
void rfm_receive_async(uint8_t len);

/* Check if a packet has been received and is waiting to be retrieved */
bool rfm_packet_waiting(void);

/* Attempt to retrieve a packet received in async mode.  Return success */
bool rfm_packet_retrieve(uint8_t *buf, uint8_t len);

/* Set transmit power to a dBm value from 0 to +17dBm */
void rfm_setpower(uint8_t power);

#endif

