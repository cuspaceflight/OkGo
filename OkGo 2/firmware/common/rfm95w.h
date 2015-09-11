#ifndef RFM95W_H
#define RFM95W_H

#include <stdbool.h>
#include <stdint.h>

/************* Exported constants ****************/
/* http://stakeholders.ofcom.org.uk/binaries/spectrum/spectrum-policy-area/spectrum-management/research-guidelines-tech-info/interface-requirements/IR_2030-june2014.pdf
 * Limit 25mW = 14dBm ERP, no channel bw limit
 * Either limit duty cycle to 1% or implement Directive 1999/5/EC or equiv. */
#define FREQ_868 865913993u

/* http://www.digikey.com/en/articles/techzone/2011/may/unlicensed-915-mhz-band-fits-many-applications-and-allows-higher-transmit-power
 * Limit 4W = 36dBm, unsure of bw limit
 * DSSS required but not FHSS */
#define FREQ_915 925892009u


/************* Exported functions ****************/
/* Initialise the RFM95W.  Not sure what this might involve. */
void rfm_initialise(uint32_t spi_periph);

/* Set the RFM95W centre frequency (in kHz).  You can use this to transition
 * between 868MHz and 915MHz */
void rfm_setfreq(uint32_t centrefreq);

/* Check if a packet has been received and is waiting to be retrieved */
bool rfm_packet_waiting(void);

/* Transmit a packet length len stored in buf, optional PA_BOOST to 100mW TX */
void rfm_transmit(uint8_t *buf, uint8_t len, bool pa_boost);

/* Retrieve a received packet into buf, max length max_len */
void rfm_receive(uint8_t *buf, uint8_t max_len);

#endif

