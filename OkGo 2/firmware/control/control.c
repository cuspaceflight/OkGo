#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

/* Common includes */
#include "rfm95w.h"
#include "utils.h"
#include "adc.h"

/* control-specific includes */
#include "control_radio.h"
#include "control_pins.h"
#include "display.h"

#ifndef FIRMWARE_VERSION
#define FIRMWARE_VERSION "UNKNOWN "
#endif


/* Internal functions */
/* Initialisation including clocks, pins, radio, state, ADCs */
void control_init(void);

void control_init()
{
    /* Setup crystal oscillator and systick */
    rcc_clock_setup_in_hsi_out_48mhz();
    systick_init();

    /* Clock GPIOs, set pin modes */
    control_pins_init();

    /* Initialise radio to sleep mode */
    control_radio_init();

    /* Initialise ADC */
    rcc_periph_clock_enable(RCC_ADC);
    adc_init();

    /* Initialise display */
    lcd_init();
}



int main(void)
{
    uint32_t adc_val;
    uint32_t control_batt_voltage;

    control_init();

    adc_val = adc_read(ADC_CH_CTRL_BATT); /* Read raw value */
    adc_val = adc_to_millivolts(adc_val); /* Convert to millivolts */
    /* Batt voltage comes via a 3k3 over 10k potential divider such that
     * V = Vbatt * 10/13.3
     * Vbatt = V * 133/100 */
    control_batt_voltage = adc_val * 133 / 100;
    /* We will round to tenths of a volt, AKA 100 millivolts
     * This bodge means the later implicit truncation acts like a proper round
     * Ignition is sent over pre-rounded so we don't need to do this for it */
    if((control_batt_voltage) % 10 >= 5)
        control_batt_voltage += 1;

    lcd_cursor_pos(0, 0);
    lcd_puts("   Airplane mode:   ");
    lcd_cursor_pos(1, 0);
    lcd_puts("   Radio disabled   ");
    lcd_cursor_pos(2, 0);
    lcd_puts("Batt voltage:  ");
    lcd_putc('0' + control_batt_voltage / 1000);
    lcd_putc('.');
    lcd_putc('0' + (control_batt_voltage / 100) % 10);
    lcd_putc('0' + (control_batt_voltage / 10) % 10);
    lcd_putc('V');
    lcd_cursor_pos(3, 0);
    lcd_puts("FW Version: ");
    lcd_puts(FIRMWARE_VERSION);

    gpio_set(LED_DISARM_PORT, LED_DISARM);
    gpio_clear(LED_ARM_PORT, LED_ARM);

    while(1)
    {
        delay_ms(1000);    
        gpio_toggle(LED_DISARM_PORT, LED_DISARM);
    }
    
    return 0;
}
