#include <stdint.h>

#include <libopencm3/stm32/gpio.h>

#include "utils.h"

/**
 * Delay for a short period. This is totally uncalibrated and
 * should not be used for accurate timing.
 * @param delay Number of timing units to delay.
 */
void delay_ms(const uint32_t delay)
{
	uint32_t i, j;

    for( i = 0; i < delay; i++ )
        for( j = 0; j < 1000; j++)
            __asm__("nop");
}

/* Set a GPIO to a boolean value */
void gpio_set_bool(uint32_t port, uint32_t pin, bool value)
{
    if(value)
        gpio_set(port, pin);
    else
        gpio_clear(port, pin);
}
