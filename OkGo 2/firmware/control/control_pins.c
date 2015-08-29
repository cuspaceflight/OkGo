#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#include "control_pins.h"

void control_pins_init()
{
    /* Radio and display pinmodes are set in radio.h and display.h */
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);

    gpio_mode_setup(LED_GREEN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_GREEN);
    gpio_mode_setup(LED_YELLOW_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_YELLOW);
}
