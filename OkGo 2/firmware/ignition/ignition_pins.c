#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#include "ignition_pins.h"

void ignition_pins_init()
{
    /* Clock all GPIO peripherals */
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);

    /* Debug LEDs */
    gpio_mode_setup(LED_GREEN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_GREEN);
    gpio_mode_setup(LED_YELLOW_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_YELLOW);

    /* Arm/disarm LED */
    gpio_mode_setup(LED_ARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_ARM);
    gpio_mode_setup(LED_DISARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_DISARM);

    /* Piezo buzzer */
    gpio_mode_setup(BUZZER_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, BUZZER);

    /* Upstream relay and firing channels */
    gpio_mode_setup(UPSTREAM_RELAY_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    UPSTREAM_RELAY);
    gpio_mode_setup(FIRE_CH1_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH1);
    gpio_mode_setup(FIRE_CH2_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH2);
    gpio_mode_setup(FIRE_CH3_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH3);
    gpio_mode_setup(FIRE_CH4_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH4);
    /* TODO FIXME: Find a safe way to set pin initial states! */
}

