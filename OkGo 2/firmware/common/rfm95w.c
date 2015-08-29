#include <stdbool.h>
#include <stdint.h>

#include "rfm95w.h"

const uint32_t FREQ_868 = 868000u, FREQ_915 = 915000u;

/* Initialise the RFM95W.  Not sure what this might involve. */
void rfm_initialise(void)
{
	// TODO
}

/* Set the RFM95W centre frequency (in kHz).  You can use this to transition
 * between 868MHz and 915MHz */
void rfm_setfreq(uint16_t centrefreq)
{
	// TODO
	(void)centrefreq;
}

/* Check if a packet has been received and is waiting to be retrieved */
bool rfm_packet_waiting(void)
{
	// TODO
	return false;
}

/* Transmit a packet length len stored in buf, optional PA_BOOST to 100mW TX */
void rfm_transmit(uint8_t *buf, uint8_t len, bool pa_boost)
{
	// TODO
	(void)buf;
	(void)len;
	(void)pa_boost;
}

/* Retrieve a received packet into buf, max length max_len */
void rfm_receive(uint8_t *buf, uint8_t max_len)
{
	// TODO
	(void)buf;
	(void)max_len;
}
