#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

#include "rfm95w.h"
#include "utils.h"

#include "ignition_pins.h"
#include "ignition_radio.h"

/* Internal functions */
void ignition_init(void);

void ignition_init(void)
{
    /* Setup crystal oscillator and systick */
    rcc_clock_setup_in_hsi_out_48mhz();
    systick_init();

    /* Clock GPIOs, set pin modes */
    ignition_pins_init();

    /* Initialise radio and local state variables, read stored config*/
    ignition_radio_init();
}

int main(void)
{
    ignition_init();
    gpio_clear(LED_ARM_PORT, LED_ARM);
    gpio_set(LED_DISARM_PORT, LED_DISARM);
    while(1)
    {
        delay_ms(1000);
        gpio_toggle(LED_DISARM_PORT, LED_DISARM);
    }
    
    return 0;
}
