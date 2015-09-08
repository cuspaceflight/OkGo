#include <stdbool.h>
#include <stdint.h>

#include <libopencm3/stm32/spi.h>

#include "utils.h"
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

/* Selected RFM registers, all LoRa mode
 * Use Semtech datasheet:
 * http://www.semtech.com/images/datasheet/sx1276_77_78_79.pdf
 * Compact list pp.90-92, details pp.108-115. */
#define RFM_RegFifo         0x00 /* RX+TX FIFO access register */
#define RFM_RegOpMode       0x01 /* Operation mode */
#define RFM_RegFrfMsb       0x06 /* Carrier frequency, most significant byte */
#define RFM_RegFrfMid       0x07 /* Carrier frequency, middle byte */
#define RFM_RegFrfLsb       0x08 /* Carrier freq., least significant byte */
#define RFM_RegPaConfig     0x09 /* PA and power control */
#define RFM_RegOcp          0x0b /* PA current limit config, for boost */
#define RFM_RegFifoAddrPtr  0x0d /* RX+TX FIFO access pointer */
#define RFM_RegFifoTxBaseAddr 0x0e /* TX FIFO base addr in buffer */
#define RFM_RegFifoRxBaseAddr 0x0f /* RX FIFO base addr in buffer */
#define RFM_FifoRxCurrentAddt 0x10 /* Start address of last packet received */
#define RFM_RegIrqFlags     0x12 /* Interrupt indicator flags */
#define RFM_RegNbRxBytes    0x13 /* Number of bytes received */
#define RFM_RegPktSnrValue  0x19 /* Estimated last packet SNR */
#define RFM_RegPktRssiValue 0x1a /* RSSI of last packet */
#define RFM_RegHopChannel   0x1c /* FHSS start channel */
#define RFM_RegModemConfig1 0x1d /* Modem PHY config 1 */
#define RFM_RegModemConfig2 0x1e /* Modem PHY config 2 */
#define RFM_RegSymbTimeoutLsb 0x1f /* RX timeout, only byte */
#define RFM_RegPreambleMsb  0x20 /* Preamble length, most significant byte */
#define RFM_RegPreambleLsb  0x21 /* Preamble length, least significant byte */
#define RFM_RegPayloadLength 0x22 /* payload length */
#define RFM_RegMaxPayloadLength 0x23 /* maximum payload length */
#define RFM_RegHopPeriod    0x24 /* FHSS hop period */
#define RFM_RegFifoRxByteAddr 0x25 /* Address in FIFO of last byte received */
#define RFM_RegModemConfig2 0x26 /* Modem PHY config 3 */
#define RFM_RegDetectOptimize 0x31 /* LoRa detection settings */
#define RFM_RegDetectionThreshold 0x37 /* 0x0a for SF7-12 0x0c for SF 6 */
#define RFM_RegDioMapping1  0x40 /* DIO0-3 mapping */
#define RFM_RegDioMapping2  0x41 /* DIO4-5 mapping */
#define RFM_RegVersion      0x42 /* RFM silicon version/revision */
#define RFM_RegPaDac        0x4d /* High power PA settings */

/* Selected contents of selected bitfield registers above */
/* 0x01 RegOpMode */
#define RFM_LongRangeMode   (1<<7) /* 1=LoRa, 0=FSK/OOK, only in sleep */
#define RFM_AccessSharedReg (1<<6) /* Access FSK regs 0d:3f in LoRa mode */
#define RFM_Mode2           (1<<2) /* Transceiver modes: 0=sleep,1=stby */
#define RFM_Mode1           (1<<1) /* 2=FSTx, 3=Tx, 4=FSRx, 5=Rx */
#define RFM_Mode0           (1<<0) /* Others reserved */

/* 0x09 RegPaConfig */
#define RFM_PaSelect        (1<<7) /* 1=PA_BOOST-20dBm 0=RFO-14dBm */
#define RFM_MaxPower2       (1<<6) /* Max Power */
#define RFM_MaxPower1       (1<<5) /* Pmax = 10.8 + 0.6*MaxPower [dBm] */
#define RFM_MaxPower0       (1<<4)
#define RFM_OutputPower3    (1<<3) /* Output power */
#define RFM_OutputPower2    (1<<2) /* RFO: Pout = Pmax - 15 + OutputPower */
#define RFM_OutputPower1    (1<<1) /* PA_BOOST: Pout = 2 + OutputPower */
#define RFM_OutputPower0    (1<<0)

/* 0x12 RegIrqFlags */
#define RFM_RxTimeout       (1<<7) /* RX timeout */
#define RFM_RxDone          (1<<6) /* Packet received */
#define RFM_PayloadCrcError (1<<5) /* Payload CRC fail */
#define RFM_ValidHeader     (1<<4) /* Valid header received */
#define RFM_TxDone          (1<<3) /* Finished transmitting */
#define RFM_CadDone         (1<<2) /* CAD timed out */
#define RFM_FhssChangeChannel (1<<1) /* FHSS hop time! */
#define RFM_CadDetected     (1<<0) /* Signal detected during CAD */

/* 0x1d RegModemConfig1 */
#define RFM_Bw3             (1<<7) /* Signal bandwidth */
#define RFM_Bw2             (1<<6) /* 0000 - 1001 */
#define RFM_Bw1             (1<<5) /* See Semtech datasheet p112 */
#define RFM_Bw0             (1<<4)
#define RFM_CodingRate2     (1<<3) /* Coding rate */
#define RFM_CodingRate1     (1<<2) /* 001 - 100 */
#define RFM_CodingRate0     (1<<1) /* See Semtech datasheet p112 */
#define RFM_ImplicitHeaderModeOn (1<<0) /* Implicit header mode, 1=on 0=off */

/* 0x1e RegModemConfig2 */
#define RFM_SpreadingFactor3 (1<<7) /* Spreading factor */
#define RFM_SpreadingFactor2 (1<<6) /* 6-12 */
#define RFM_SpreadingFactor1 (1<<5) /* See Semtech datasheet p113 */
#define RFM_SpreadingFactor0 (1<<4)
#define RFM_TxContinuousMode (1<<3) /* 0=single packet 1=continuous */
#define RFM_RxPayloadCrcOn  (1<<2) /* Payload CRC checking on receive */
#define RFM_SymbTimeout9    (1<<1) /* RX timeout most significant bit */
#define RFM_SymbTimeout8    (1<<0)

/* 0x26 RegModemConfig3 */
#define RFM_LowDataRateOptimize (1<<3) /* Enable when symbol length >16ms */
#define RFM_AgcAutoOn       (1<<2) /* Enable AGC or manual LnaGain */

/* 0x31 RegDetectOptimize */
#define RFM_DetectionOptimize2 (1<<2) /* LoRa detection optimize */
#define RFM_DetectionOptimize2 (1<<1) /* Set to 0x03 for SF 7-12 */
#define RFM_DetectionOptimize1 (1<<0) /* or 0x05 for SF6 */



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

