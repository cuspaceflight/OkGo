#ifndef UTILS_H
#define UTILS_H

#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/systick.h>

/**
 * Delay for approximately a millisecond. Very roughly calibrated by eye to
 * within about 20% precision.
 * @param delay Number of milliseconds to delay.
 */
void delay_ms(const uint32_t delay);


/**
 * Delay for approximately a microsecond. Very roughly calibrated by eye to
 * within about 20% precision.
 * @param delay Number of microseconds to delay.
 */
void delay_us(const uint32_t delay);

/* Set a GPIO to a boolean value */
void gpio_set_bool(uint32_t port, uint32_t pin, bool value);

/* Get a boolean value from a GPIO */
bool gpio_get_bool(uint32_t port, uint32_t pin);

/* Setup systick */
void systick_init(void);

/* Get current systick value */
uint32_t systick_get(void);

/* Get elapsed milliseconds since provided time */
uint32_t systick_ms_since(uint32_t begin);


#endif
