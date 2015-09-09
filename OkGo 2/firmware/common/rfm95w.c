#include <stdbool.h>
#include <stdint.h>

#include <libopencm3/stm32/spi.h>

#include "utils.h"
#include "rfm95w.h"
#include "rfm95w_registers.h"

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
    /* We read the old value, set the mode bits as appropriate then rewrite the
     * register, so we don't stomp all over the other register bits */
    uint8_t RegOpMode;

    if(mode > 0b00000111) /* Invalid mode */
        mode = RFM_MODE_STANDBY; /* Default to standby mode */

    RegOpMode = _rfm_readreg(RFM_RegOpMode);
    RegOpMode &= 0b11111000; /* Clear old mode */
    RegOpMode |= mode; /* Set new mode */
    _rfm_writereg(RFM_RegOpMode, RegOpMode);
}

/* Write the byte of data to the address */
void _rfm_writereg(uint8_t address, uint8_t data)
{
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address | 0b10000000); /* Set MSbit for write */
    spi_write(rfm_spi, data);
    spi_set_nss_high(rfm_spi);
}

/* Read a byte of data from the address */
uint8_t _rfm_readreg(uint8_t address)
{
    uint8_t data;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address & 0b01111111); /* Clear MSbit for read */
    data = spi_read(rfm_spi);
    spi_set_nss_high(rfm_spi);
    return data;
}

/* Bulk write to a register from a buffer */
void _rfm_bulkwrite(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address | 0b10000000); /* Set MSbit for write */
    for(i=0; i<len; i++)
        spi_write(rfm_spi, buffer[i]);
    spi_set_nss_high(rfm_spi);
}

/* Bulk read from a register to a buffer */
void _rfm_bulkread(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    spi_set_nss_low(rfm_spi);
    spi_write(rfm_spi, address & 0b01111111); /* Clear MSbit for read */
    for(i=0; i<len; i++)
        buffer[i] = spi_read(rfm_spi);
    spi_set_nss_high(rfm_spi);
}


/************* External function definitions ***************/
/* Initialise the RFM95W.  Well, mainly the SPI peripheral. */
void rfm_initialise(uint32_t spi_periph)
{
    rfm_spi = spi_periph;

    /* Pinmodes are setup in (ignition|control)_radio.c */

    /* Initialise SPI peripheral */
    spi_reset(rfm_spi);
    spi_init_master(rfm_spi,
                    SPI_CR1_BAUDRATE_FPCLK_DIV_64, /* Slightly under 1MHz */
                    SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE, /* ??? */
                    SPI_CR1_CPHA_CLK_TRANSITION_1,
                    SPI_CR1_CRCL_8BIT, /* DFF/CRC length */
                    SPI_CR1_MSBFIRST); /* MSB first */

    /* Manual NSS handling: */
    spi_enable_software_slave_management(SPI1);
    spi_set_nss_high(rfm_spi);

	/* Wait for chip to warm up */
    delay_ms(10);
}

/* Set the RFM95W centre frequency (in Hz).  You can use this to transition
 * between 868MHz and 915MHz */
void rfm_setfreq(uint32_t centrefreq)
{
    /* The RFM95W uses RegFrf such that:
     * F_RF = F_STEP x RegFrf[0:24], and,
     * F_STEP = F_XOSC / 2^19 = 61.0 Hz
     * So we calculate RegFrf = F_RF / 61.0 */

    uint32_t RegFrf = 0;
    const uint32_t F_STEP = 61;
    RegFrf = centrefreq / F_STEP; /* Truncation is probably fine here */

	/* Check the radio is sleeping to set the frequency */
    _rfm_setmode(RFM_MODE_SLEEP);

    /* Write 24 bits of frequency */
    _rfm_writereg(RFM_RegFrfMsb, (RegFrf>>16) & 0xff);
    _rfm_writereg(RFM_RegFrfMid, (RegFrf>>8) & 0xff);
    _rfm_writereg(RFM_RegFrfLsb, RegFrf & 0xff);

    /* Wake up the radio, spin up the synthesizers! */
    _rfm_setmode(RFM_MODE_STANDBY);
}

/* Check if a packet has been received and is waiting to be retrieved */
bool rfm_packet_waiting(void)
{
    uint8_t RegIrqFlags;

    RegIrqFlags = _rfm_readreg(RFM_RegIrqFlags);
    if(RegIrqFlags & RFM_RxDone)
    {
        /* Clear the interrupt */
        _rfm_writereg(RFM_RegIrqFlags, RFM_RxDone);
        return true;
    }
    else
    	return false;
}

/* Transmit a packet length len stored in buf, optional PA_BOOST to 100mW TX */
void rfm_transmit(uint8_t *buf, uint8_t len, bool pa_boost)
{
	/* TODO: For now, ignore pa_boost */
	(void)pa_boost;

    /* Move to the beginning of the TX FIFO */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoTxBaseAddr));

    /* Fill the FIFO */
    _rfm_bulkwrite(RFM_RegFifo, buf, len);

    /* Request TX mode to initiate send */
    _rfm_setmode(RFM_MODE_TX);

    /* TODO: For now, block on sending */
    while((_rfm_readreg(RFM_RegOpMode) & 0b00000111) == RFM_MODE_TX);
}

/* Retrieve a received packet into buf, max length max_len */
void rfm_receive(uint8_t *buf, uint8_t max_len)
{
    uint8_t rx_len;

    /* Set Fifo to beginning of RX buffer */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoRxBaseAddr));

    /* Initiate receive using mode change */
    _rfm_setmode(RFM_MODE_RXCONTINUOUS);

    /* Block until receipt. Hoping continuous rx doesn't timeout. */
    while(!(_rfm_readreg(RFM_RegIrqFlags) & RFM_RxDone));

    /* Clear rxdone interrupt */
    _rfm_writereg(RFM_RegIrqFlags, RFM_RxDone);

    /* TODO: CRC handling. Add crc bool flag and ignore receipt if bad crc */

    /* Move FIFO pointer to beginning of last packet received */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoRxCurrentAddr));

    /* Read packet out of FIFO into our buffer */
    rx_len = _rfm_readreg(RFM_RegRxNbBytes);
    if(rx_len <= max_len)
        _rfm_bulkread(RFM_RegFifo, buf, rx_len);
    else /* Cap length if it exceeds our buffer size */
        _rfm_bulkread(RFM_RegFifo, buf, max_len);
}

