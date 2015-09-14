#include <libopencm3/stm32/adc.h>

#include "adc.h"

/* General purpose ADC initialisation and calibration */
void adc_init(void)
{
	/* Check ADC is asleep then setup clock*/
    adc_power_off(ADC1);
    adc_set_clk_source(ADC1, ADC_CLKSOURCE_ADC);

    /* Initiate calibration and block until completion */
    adc_calibrate_start(ADC1);
	adc_calibrate_wait_finish(ADC1);

	/* Settings... */
	adc_set_operation_mode(ADC1, ADC_MODE_SEQUENTIAL);
	adc_set_right_aligned(ADC1);
	adc_set_sample_time_on_all_channels(ADC1, ADC_SMPTIME_013DOT5);
	adc_set_resolution(ADC1, ADC_RESOLUTION_12BIT);

    /* Bring up the ADC and wait for stabilisation */
    adc_power_on(ADC1);
    while(!(ADC_ISR(ADC1) & ADC_ISR_ADRDY));
}

/* Read an ADC value, blocking and returning result */
uint16_t adc_read(uint8_t channel)
{
	/* Set appropriate channel in CHSEL */
	adc_set_regular_sequence(ADC1, 1, &channel);

	/* Start conversion and block until completion */
	adc_start_conversion_regular(ADC1);
	while(!adc_eoc(ADC1));

	return adc_read_regular(ADC1);
}

/* Convert an ADC-read value to a voltage in millivolts */
uint32_t adc_to_millivolts(uint16_t raw)
{
	/* From ref manual p253, V = VDD_A / FULL_SCALE * raw
	 * Our VDD is always 3.3V and FULL_SCALE is 2^12 - 1
	 * So V = 3.3/(2^12 - 1) * raw
	 * Multiplying by 1000 for millivolts gives:
	 * V*1000 = raw * 25 / 31
	 */
	 return (uint32_t)raw * 25 / 31;
}