#ifndef UTILS_H
#define UTILS_H

#include <stdint.h>

/**
 * Delay for a short period. This is totally uncalibrated and
 * should not be used for accurate timing.
 * @param delay Number of timing units to delay.
 */
void delay_ms(const uint32_t delay);

#endif