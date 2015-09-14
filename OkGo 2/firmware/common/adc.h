#ifndef ADC_H
#define ADC_H

/* ADC channels */
/* These are ADC channel numbers, which libopencm3 handles nicely */
#define ADC_CH_CTRL_BATT 9

#define ADC_CH_IGTN_BATT 0
#define ADC_CH_IGTN_CONT1 8
#define ADC_CH_IGTN_CONT2 7
#define ADC_CH_IGTN_CONT3 6
#define ADC_CH_IGTN_CONT4 5
#define ADC_CH_IGTN_RELAY_SENSE 9

/* General purpose ADC initialisation and calibration */
void adc_init(void);

/* Read an ADC value, blocking and returning result */
uint16_t adc_read(uint8_t channel);

/* Convert an ADC-read value to a voltage in millivolts */
uint32_t adc_to_millivolts(uint16_t raw);

#endif