#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#define LED_PORT GPIOC
#define LED_PIN GPIO9
#define LED_RCC RCC_GPIOC

/* Private prototypes */
static void _delay_ms(const uint32_t delay);

int main(void)
{
    /* Clock the GPIOC peripheral */
    rcc_periph_clock_enable(LED_RCC);

    /* Configure the pin as an output */
    gpio_mode_setup(LED_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_PIN);

    /* Flash the LED forever */
    while(1)
    {
        gpio_set(LED_PORT, LED_PIN);
        _delay_ms(500);
        gpio_clear(LED_PORT, LED_PIN);
        _delay_ms(500);
    }
    
    return 0;
}

/**
 * Delay for a short period. This is totally uncalibrated and
 * should not be used for accurate timing.
 * @param delay Number of timing units to delay.
 */
static void _delay_ms(const uint32_t delay)
{
    uint32_t i, j;

    for( i = 0; i < delay; i++ )
        for( j = 0; j < 1000; j++)
            __asm__("nop");
}
