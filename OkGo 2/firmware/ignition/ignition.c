#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>

#include "rfm95w.h"
#include "utils.h"

#include "ignition_pins.h"

/* State variables */
static bool armed;
static uint16_t centre_freq; /* in kHz */

/* Internal functions */
void ignition_init(void);

void ignition_init(void)
{
    /* Initialise local state variables */
    armed = false;
    centre_freq = FREQ_868;

    /* Clock GPIOs, set pin modes */
    ignition_pins_init();

    /* Initialise radio and local state variables, read stored config*/
    /* TODO */

    /* Initialise radio */
    rfm_initialise();
    rfm_setfreq(centre_freq);

    /* Setup ADC to scan-read battery voltage */
    /*adc_setup();*/
}

int main(void)
{
    ignition_init();
    
    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);
    gpio_set(LED_ARM_PORT, LED_ARM);
    gpio_clear(LED_DISARM_PORT, LED_DISARM);
    gpio_set(UPSTREAM_RELAY_PORT, UPSTREAM_RELAY);

    while(1)
    {
        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
        gpio_toggle(LED_YELLOW_PORT, LED_YELLOW);
        gpio_toggle(LED_ARM_PORT, LED_ARM);
        gpio_toggle(LED_DISARM_PORT, LED_DISARM);

        /* Deafen mode: */
        gpio_set(BUZZER_PORT, BUZZER);
        delay_ms(50);
        gpio_clear(BUZZER_PORT, BUZZER);

        gpio_set(FIRE_CH1_PORT, FIRE_CH1);
        delay_ms(1000);
        gpio_set(FIRE_CH2_PORT, FIRE_CH2);
        delay_ms(1000);
        gpio_set(FIRE_CH3_PORT, FIRE_CH3);
        delay_ms(1000);
        gpio_set(FIRE_CH4_PORT, FIRE_CH4);
        delay_ms(1000);
        gpio_clear(FIRE_CH1_PORT, FIRE_CH1);
        gpio_clear(FIRE_CH2_PORT, FIRE_CH2);
        gpio_clear(FIRE_CH3_PORT, FIRE_CH3);
        gpio_clear(FIRE_CH4_PORT, FIRE_CH4);
        delay_ms(1000);

    }
    
    return 0;
}
