#include <stdbool.h>
#include <stdint.h>

#include <libopencm3/stm32/spi.h>

#include "common.h"
#include "rfm95w.h"

/************** Exported Constants ************************/
const uint32_t FREQ_868 = 868000u, FREQ_915 = 915000u;

/************** Internal constants ************************/
/* RFM Modes, see datasheet p31 */
#define RFM_MODE_SLEEP 
#define RFM_MODE_STANDBY
#define RFM_MODE_TX
#define RFM_MODE_RXCONTINUOUS
#define RFM_MODE_RXSINGLE
#define RFM_MODE_CAD

/* RFM Registers, see datasheet p??? */
#define RFM_REG_MODE

/************** Internal global variabls ******************/
uint32_t rfm_spi;

/********** Internal function declarations ****************/
/* Set the RFM mode to one of the RFM_MODE_* options */
void _rfm_setmode(uint8_t mode);

/* Write the byte of data to the address */
void _rfm_writereg(uint8_t address, uint8_t data);

/* Read a byte of data from the address */
uint8_t _rfm_readreg(uint8_t address);

/* Bulk write to a register from a buffer */
void _rfm_bulkwrite(uint8_t address, uint8_t *buffer, uint8_t len);

/* Bulk read from a register to a buffer */
void _rfm_bulkread(uint8_t address, uint8_t *buffer, uint8_t len);

/********** Internal function definitions ******************/
/* Set the RFM mode to one of the RFM_MODE_* options */
void _rfm_setmode(uint8_t mode)
{
    /* TODO: sanity check */

    _rfm_writereg(RFM_REG_MODE, mode);
}

/* Write the byte of data to the address */
void _rfm_writereg(uint8_t address, uint8_t data)
{
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address | 0b10000000); /* Set MSB for write */
    spi_write(rfm_spi, data);
    spi_set_nss_high(rfm_spi);
}

/* Read a byte of data from the address */
uint8_t _rfm_readreg(uint8_t address)
{
    uint8_t data;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address & 0b01111111); /* Clear MSB for read */
    data = spi_read(rfm_spi);
    spi_set_nss_high(rfm_spi);
    return data;
}

/* Bulk write to a register from a buffer */
void _rfm_bulkwrite(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address | 0b10000000); /* Set MSB for write */
    for(i=0; i<len; i++)
        spi_write(rfm_spi, buffer[i]);
    spi_set_nss_high(rfm_spi);
}

/* Bulk read from a register to a buffer */
void _rfm_bulkread(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address & 0b01111111); /* Clear MSB for read */
    for(i=0; i<len; i++)
        buffer[i] = spi_read(rfm_spi);
    spi_set_nss_high(rfm_spi);
}


/************* External function definitions ***************/
/* Initialise the RFM95W.  Well, mainly the SPI peripheral. */
void rfm_initialise(uint32_t spi_periph)
{
    rfm_spi = spi_periph;

	/* Wait for chip to warm up */
    delay_ms(10);

    /* Setup pin multiplexing for appropriate SPI periph */
    /* TODO: Actually this is done in *_radio.c */

    /* Initialise SPI peripheral */
    spi_init_master(rfm_spi,
                    10000000, /* 1MHz */
                    SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE, /* ??? */
                    SPI_CR1_CPHA_CLK_TRANSITION_1,
                    SPI_CR1_DFF_8BIT, /* 8-bit words */
                    SPI_CR1_MSBFIRST); /* MSB first */
    
    /* Leave the radio in sleep mode to set the frequncy.
     * setfreq will bring the radio up to stand-by after doing this. */

}

/* Set the RFM95W centre frequency (in kHz).  You can use this to transition
 * between 868MHz and 915MHz */
void rfm_setfreq(uint16_t centrefreq)
{
	/* Check the radio is sleeping, set the frequency, then wake it up */
    _rfm_setmode(RFM_MODE_SLEEP);
    _rfm_writereg(RFM_REG_FREQ, centrefreq);
    _rfm_setmode(RFM_MODE_STANDBY);
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

