#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>

#include "control_pins.h"

void control_pins_init()
{
    /* Clock all GPIO peripherals */
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);

    /* Debug LEDs.  Default off */
    gpio_clear(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);
    gpio_mode_setup(LED_GREEN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_GREEN);
    gpio_mode_setup(LED_YELLOW_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_YELLOW);

    /* Keyswitch */
    gpio_mode_setup(SW_KEY_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SW_KEY);

    /* Arm/disarm LED.  Default off */
    gpio_clear(LED_ARM_PORT, LED_ARM);
    gpio_clear(LED_DISARM_PORT, LED_DISARM);
    gpio_mode_setup(LED_ARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_ARM);
    gpio_mode_setup(LED_DISARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_DISARM);

    /* Channel switches and LEDs.  Default LEDs off */
    gpio_clear(LED_CH1_PORT, LED_CH1);
    gpio_clear(LED_CH2_PORT, LED_CH2);
    gpio_clear(LED_CH3_PORT, LED_CH3);
    gpio_clear(LED_CH4_PORT, LED_CH4);
    gpio_mode_setup(SW_CH1_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SW_CH1);
    gpio_mode_setup(LED_CH1_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_CH1);
    gpio_mode_setup(SW_CH2_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SW_CH2);
    gpio_mode_setup(LED_CH2_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_CH2);
    gpio_mode_setup(SW_CH3_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SW_CH3);
    gpio_mode_setup(LED_CH3_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_CH3);
    gpio_mode_setup(SW_CH4_PORT, GPIO_MODE_INPUT, GPIO_PUPD_NONE, SW_CH4);
    gpio_mode_setup(LED_CH4_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_CH4);

    /* Analog inputs */
    gpio_mode_setup(BATT_MON_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, BATT_MON);
}
