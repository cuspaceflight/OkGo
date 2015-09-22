#include <stdbool.h>
#include <stdint.h>

#include <libopencm3/stm32/spi.h>
#include <libopencm3/stm32/gpio.h>

#include "utils.h"
#include "rfm95w.h"
#include "rfm95w_registers.h"

/************** Internal global variabls ******************/
static uint32_t rfm_spi;
static uint32_t rfm_nss_port;
static uint32_t rfm_nss;


/********** Internal function declarations ****************/
/* Send and receive 8 bits, blocking until completion */
uint8_t _rfm_spi_xfer8(uint8_t data);

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

    /* Wait for new mode to take effect */
    while((_rfm_readreg(RFM_RegOpMode) & 0b00000111) != mode);
}

/* Send and receive 8 bits, blocking until completion */
uint8_t _rfm_spi_xfer8(uint8_t data)
{
	spi_send8(rfm_spi, data);
	return spi_read8(rfm_spi);
}

/* Write the byte of data to the address */
void _rfm_writereg(uint8_t address, uint8_t data)
{
    gpio_clear(rfm_nss_port, rfm_nss);
    (void)_rfm_spi_xfer8(address | (1<<7));
    (void)_rfm_spi_xfer8(data);
    gpio_set(rfm_nss_port, rfm_nss);
}

/* Read a byte of data from the address */
uint8_t _rfm_readreg(uint8_t address)
{
    uint8_t data;
    gpio_clear(rfm_nss_port, rfm_nss);
    (void)_rfm_spi_xfer8(address & 0b01111111); /* Clear MSbit: read */
    data = _rfm_spi_xfer8(0x00);
    gpio_set(rfm_nss_port, rfm_nss);
    return data;
}

/* Bulk write to a register from a buffer */
void _rfm_bulkwrite(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    gpio_clear(rfm_nss_port, rfm_nss);
    (void)_rfm_spi_xfer8(address | 0b10000000); /* Set MSbit: write */
    for(i=0; i<len; i++)
        (void)_rfm_spi_xfer8(buffer[i]);
    gpio_set(rfm_nss_port, rfm_nss);
}

/* Bulk read from a register to a buffer */
void _rfm_bulkread(uint8_t address, uint8_t *buffer, uint8_t len)
{
    uint8_t i;
    gpio_clear(rfm_nss_port, rfm_nss);
    (void)_rfm_spi_xfer8(address & 0b01111111); /* Clear MSbit: read */
    for(i=0; i<len; i++)
        buffer[i] = _rfm_spi_xfer8(0x00);
    gpio_set(rfm_nss_port, rfm_nss);
}


/************* External function definitions ***************/
/* Initialise the RFM95W.  Well, mainly the SPI peripheral. */
void rfm_initialise(uint32_t spi_periph, uint32_t nss_port, uint32_t nss_pin)
{
	uint8_t RegOpMode, RegModemConfig1, RegModemConfig2;

	/* Store the boards specifics for later use */
    rfm_spi = spi_periph;
    rfm_nss_port = nss_port;
    rfm_nss = nss_pin;

    /* Pinmodes are setup in (ignition|control)_radio.c */

    /* Initialise SPI peripheral */
    spi_reset(rfm_spi);
    spi_disable_crc(rfm_spi);
    spi_init_master(rfm_spi,
                    SPI_CR1_BAUDRATE_FPCLK_DIV_64, /* Slightly under 1MHz */
                    SPI_CR1_CPOL_CLK_TO_0_WHEN_IDLE, /* ??? */
                    SPI_CR1_CPHA_CLK_TRANSITION_1,
                    SPI_CR1_CRCL_8BIT, /* DFF/CRC length */
                    SPI_CR1_MSBFIRST); /* MSB first */

    /* Manual NSS handling: */
    spi_enable_software_slave_management(rfm_spi);
    spi_set_nss_high(rfm_spi);
    gpio_set(rfm_nss_port, rfm_nss);

    spi_set_data_size(rfm_spi, 0x07); /* 8-bit mode = 0b0111 */
    spi_fifo_reception_threshold_8bit(rfm_spi); /* 8-bit rx-length */

    spi_enable(rfm_spi);

	/* Wait for chip to warm up */
    delay_ms(10);

    /* Check we're in sleep mode */
    _rfm_setmode(RFM_MODE_SLEEP);
    RegOpMode = _rfm_readreg(RFM_RegOpMode);
    /* Activate LoRa! */
    RegOpMode |= RFM_LongRangeMode; 
    _rfm_writereg(RFM_RegOpMode, RegOpMode);

    /* Set bandwidth to 125kHz -> 0111 */
    RegModemConfig1 = RFM_Bw2 | RFM_Bw1 | RFM_Bw0;
    /* Set coding rate to 4/8 -> 100 */
    RegModemConfig1 |= RFM_CodingRate2;
    /* Implicit header mode */
    RegModemConfig1 |= RFM_ImplicitHeaderModeOn;
    /* Write config: */
    _rfm_writereg(RFM_RegModemConfig1, RegModemConfig1);

    /* Set SF7 = 128 chips/symbol */
    RegModemConfig2 = RFM_SpreadingFactor2 | RFM_SpreadingFactor1 |
                      RFM_SpreadingFactor0;
    /* Enable CRCs: */
    RegModemConfig2 |= RFM_RxPayloadCrcOn;
    /* Write config: */
    _rfm_writereg(RFM_RegModemConfig2, RegModemConfig2);


}

/* Set the RFM95W centre frequency using an FRF register value */
void rfm_setfreq(uint32_t frf)
{
	/* Check the radio is sleeping to set the frequency */
    _rfm_setmode(RFM_MODE_SLEEP);

    /* Write 24 bits of frequency */
    _rfm_writereg(RFM_RegFrfMsb, (frf>>16) & 0xff);
    _rfm_writereg(RFM_RegFrfMid, (frf>>8) & 0xff);
    _rfm_writereg(RFM_RegFrfLsb, frf & 0xff);

    /* Wake up the radio, spin up the synthesizers! */
    _rfm_setmode(RFM_MODE_STANDBY);
}

/* Transmit a packet length len stored in buf, optional PA_BOOST to 100mW TX */
void rfm_transmit(uint8_t *buf, uint8_t len)
{
    /* Check we're in stand-by */
    _rfm_setmode(RFM_MODE_STANDBY);

	/* Set packet length */
	_rfm_writereg(RFM_RegPayloadLength, len);

    /* Move to the beginning of the TX FIFO */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoTxBaseAddr));

    /* Fill the FIFO */
    _rfm_bulkwrite(RFM_RegFifo, buf, len);

    /* Request TX mode to initiate send */
    _rfm_setmode(RFM_MODE_TX);

    /* TODO: For now, block on sending */
    while((_rfm_readreg(RFM_RegOpMode) & 0b00000111) == RFM_MODE_TX);

    /* Clear txdone interrupt flag */
    _rfm_writereg(RFM_RegOpMode, RFM_TxDone);
}

/* Retrieve a received packet, length len, into buf */
void rfm_receive(uint8_t *buf, uint8_t len)
{
    uint8_t RegIrqFlags;
    bool valid_received = false;

    /* Check we're in stand-by */
    _rfm_setmode(RFM_MODE_STANDBY);

   	/* Set packet length */
	_rfm_writereg(RFM_RegPayloadLength, len);

    do
    {
	    /* Set Fifo to beginning of RX buffer */
	    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoRxBaseAddr));

	    /* Initiate receive using mode change */
	    _rfm_setmode(RFM_MODE_RXSINGLE);

	    /* Block until receipt or timeout */
	    do
			RegIrqFlags = _rfm_readreg(RFM_RegIrqFlags);
		while(!(RegIrqFlags & (RFM_RxDone | RFM_RxTimeout)));

		/* Received if not timeout and CRC done and length correct */
		valid_received = (_rfm_readreg(RFM_RegRxNbBytes) == len) &&
                         (RegIrqFlags & RFM_RxDone) &&
					     !(RegIrqFlags & RFM_PayloadCrcError);

	    /* Clear RxDone, RxTimeout, and CRC fail interrupts */
	    _rfm_writereg(RFM_RegIrqFlags,
	    			  RFM_RxDone | RFM_PayloadCrcError | RFM_RxTimeout);
	}
	while(!valid_received);

    /* Move FIFO pointer to beginning of last packet received */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoRxCurrentAddr));

	/* Read packet out of FIFO into our buffer */
    _rfm_bulkread(RFM_RegFifo, buf, len);
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

/* Put module into receive mode then return */
void rfm_receive_async(uint8_t len)
{
    /* Check we're in stand-by */
    _rfm_setmode(RFM_MODE_STANDBY);

    /* Set packet length */
    _rfm_writereg(RFM_RegPayloadLength, len);

    /* Clear possible interrupts */
    _rfm_writereg(RFM_RegIrqFlags,
                  RFM_RxDone | RFM_PayloadCrcError | RFM_RxTimeout);

     /* Set Fifo to beginning of RX buffer */
    _rfm_writereg(RFM_RegFifoAddrPtr, _rfm_readreg(RFM_RegFifoRxBaseAddr));

    /* Initiate receive using mode change */
    _rfm_setmode(RFM_MODE_RXCONTINUOUS);
}

/* Attempt to retrieve a packet received in async mode.  Return success */
bool rfm_packet_retrieve(uint8_t *buf, uint8_t len)
{
    uint8_t rx_len, RegIrqFlags;

    RegIrqFlags = _rfm_readreg(RFM_RegIrqFlags);
    rx_len = _rfm_readreg(RFM_RegRxNbBytes);

    if((RegIrqFlags & RFM_RxDone) &&
       !(RegIrqFlags & RFM_PayloadCrcError) &&
       (rx_len == len))
    {
        /* Good receive. */
        /* Move FIFO pointer to beginning of last packet received */
        _rfm_writereg(RFM_RegFifoAddrPtr,
                      _rfm_readreg(RFM_RegFifoRxCurrentAddr));

        /* Read packet out of FIFO into our buffer */
        _rfm_bulkread(RFM_RegFifo, buf, len);

        /* Clear RxDone, RxTimeout, and CRC fail interrupts */
        _rfm_writereg(RFM_RegIrqFlags,
                      RFM_RxDone | RFM_PayloadCrcError | RFM_RxTimeout);

        return true; /* Success */
    }
    else
    {
        /* Bad receive */
        /* Clear RxDone, RxTimeout, and CRC fail interrupts */
        _rfm_writereg(RFM_RegIrqFlags,
                      RFM_RxDone | RFM_PayloadCrcError | RFM_RxTimeout);

        return false; /* Fail */
    }

}

/* Set transmit power to a dBm value from 2 to +17dBm */
void rfm_setpower(uint8_t power)
{
	uint8_t RegPaConfig = 0x00;

    /* Force boost mode for the HopeRF module, restricts power range to
     * 2 - 17dBm (without using extra boost to 20dBm) */
    if((power < 2) || (power > 17))
        power = 2; /* 2dBm sensible default */

    RegPaConfig |= RFM_PaSelect; /* Select boost PA */

    /* Actual Power = OutputPower + 2dBm, so set OutputPower=power-2 */
    RegPaConfig |= (power - 2);

	_rfm_writereg(RFM_RegPaConfig, RegPaConfig);
}

/* Retrieve RSSI/SNR of last packet received */
uint8_t rfm_getrssi(void)
{
#ifdef SIGNAL_DISPLAY_SNR
    int16_t signed_val;
    uint16_t snr;
    signed_val = (int16_t)_rfm_readreg(RFM_RegPktSnrValue);
    /* Shift it up by 128 to make all vals positive */
    signed_val += 128;
    /* Scale 0-255 to 0-99 */
    snr = (uint16_t)signed_val * 99 / 255;
    return snr;
#else
    /* Scale 0-155 (highest observed) to 0-99% */
    uint16_t rssi;
    rssi = (uint16_t)_rfm_readreg(RFM_RegPktRssiValue) * 99 / 155;
    if(rssi > 99)
        rssi = 99;
    return rssi;
#endif
}

