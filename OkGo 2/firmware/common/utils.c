#include <stdint.h>

#include <libopencm3/stm32/gpio.h>

#include "utils.h"

/**
 * Delay for approximately a millisecond.  Very roughly calibrated by eye to
 * within about 20% precision.
 * @param delay Number of milliseconds to delay.
 */
void delay_ms(const uint32_t delay)
{
	uint32_t i, j;

    for( i = 0; i < delay; i++ )
        for( j = 0; j < 5000; j++)
            __asm__("nop");
}

/**
 * Delay for approximately a microsecond.  Very roughly calibrated by eye to
 * within about 20% precision.
 * @param delay Number of microseconds to delay.
 */
void delay_us(const uint32_t delay)
{
	uint32_t i, j;

    for( i = 0; i < delay; i++ )
        for( j = 0; j < 9; j++)
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

/* Get a boolean value from a GPIO */
bool gpio_get_bool(uint32_t port, uint32_t pin)
{
    if(gpio_get(port, pin) != 0x00)
        return true;
    else
        return false;
}

