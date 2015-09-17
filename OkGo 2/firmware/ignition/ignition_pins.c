#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/dac.h>

#include "ignition_pins.h"

void ignition_pins_init()
{
    /* Clock all GPIO peripherals */
    rcc_periph_clock_enable(RCC_GPIOA);
    rcc_periph_clock_enable(RCC_GPIOB);
    rcc_periph_clock_enable(RCC_GPIOC);

    /* Debug LEDs.  Default off. */
    gpio_clear(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);
    gpio_mode_setup(LED_GREEN_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_GREEN);
    gpio_mode_setup(LED_YELLOW_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_YELLOW);

    /* Arm/disarm LED.  Default off. */
    gpio_clear(LED_ARM_PORT, LED_ARM);
    gpio_clear(LED_DISARM_PORT, LED_DISARM);
    gpio_mode_setup(LED_ARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LED_ARM);
    gpio_mode_setup(LED_DISARM_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    LED_DISARM);

    /* Piezo buzzer.  Default off */
    gpio_clear(BUZZER_PORT, BUZZER);
    gpio_mode_setup(BUZZER_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, BUZZER);

    /* Upstream relay and firing channels, default all off */
    gpio_clear(UPSTREAM_RELAY_PORT, UPSTREAM_RELAY);
    gpio_clear(FIRE_CH1_PORT, FIRE_CH1);
    gpio_clear(FIRE_CH2_PORT, FIRE_CH2);
    gpio_clear(FIRE_CH3_PORT, FIRE_CH3);
    gpio_clear(FIRE_CH4_PORT, FIRE_CH4);
    gpio_mode_setup(UPSTREAM_RELAY_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE,
                    UPSTREAM_RELAY);
    gpio_mode_setup(FIRE_CH1_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH1);
    gpio_mode_setup(FIRE_CH2_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH2);
    gpio_mode_setup(FIRE_CH3_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH3);
    gpio_mode_setup(FIRE_CH4_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, FIRE_CH4);

    /* Analog inputs */
    gpio_mode_setup(BATT_MON_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, BATT_MON);
    gpio_mode_setup(RELAY_SENSE_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE,
                    RELAY_SENSE);
    gpio_mode_setup(CONT_CH1_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, CONT_CH1);
    gpio_mode_setup(CONT_CH2_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, CONT_CH2);
    gpio_mode_setup(CONT_CH3_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, CONT_CH3);
    gpio_mode_setup(CONT_CH4_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, CONT_CH4);

    /* Buzzer DAC output */
    /* First set GPIO to analog to disable the digital stuff attached */
    gpio_mode_setup(BUZZER_PORT, GPIO_MODE_ANALOG, GPIO_PUPD_NONE, BUZZER);
    /* Now setup the DAC.  Load in 0 before enabling to turn off buzzer */
    dac_load_data_buffer_single(0, RIGHT8, CHANNEL_1);
    dac_trigger_disable(CHANNEL_1);
    dac_enable(CHANNEL_1);
}

void ignition_buzzer_set(uint8_t value)
{
    dac_load_data_buffer_single(value, RIGHT8, CHANNEL_1);
}

