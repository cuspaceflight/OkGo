#include <stdint.h>

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
