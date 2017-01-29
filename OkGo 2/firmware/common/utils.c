#include <stdint.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/cm3/cortex.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/cm3/nvic.h>

#include "utils.h"

/* Millisecond timer driven by systick interrupt, read atomically by get_millis
 */
static uint32_t millis_timer;

/* Systick interrupt handler, drives millis_timer which is read atomically by
 * get_millis */
void sys_tick_handler(void)
{
    millis_timer++;
}

/**
 * Delay for a number of milliseconds, based off the systick timer
 * Delays around a small number of milliseconds may be inaccurate
 * @param delay Number of milliseconds to delay.
 */
void delay_ms(const uint32_t delay)
{
    uint32_t millis;

    millis = get_millis();
    while((get_millis() - millis) < delay);
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

/* Setup systick */
void systick_init(void)
{
    /* 48MHz / 8 => 6,000,000 counts per second */
    systick_set_clocksource(STK_CSR_CLKSOURCE_AHB);

    /* 6,000,000/6000 = 1000 overflows per second - every 1ms one interrupt */
    /* SysTick interrupt every N clock pulses: set reload to N-1 */
    systick_set_reload(47999);
    systick_interrupt_enable();
    systick_counter_enable();
}

/* Get current millisecond timer value */
uint32_t get_millis(void)
{
    uint32_t value;
    /* Atomically read the millis_timer value to protect against the weird
     * hypothetical case where a 32-bit read is non-atomic and the systick
     * interrupt updates the millis timer during it */
    CM_ATOMIC_BLOCK()
    {
        value = millis_timer;
    }
    return value;
}
