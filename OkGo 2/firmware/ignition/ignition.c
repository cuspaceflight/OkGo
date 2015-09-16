#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>

#include "rfm95w.h"
#include "utils.h"
#include "adc.h"

#include "ignition.h"
#include "ignition_pins.h"
#include "ignition_radio.h"

const uint8_t RADIO_POWER_DBM = 10; /* Radio tx power in dBm */

/* Internal functions */
void ignition_init(ignition_state *state, ignition_radio_state *radio_state);

void ignition_init(ignition_state *state, ignition_radio_state *radio_state)
{
    /* Initialise local state variables */
    state->armed = false;
    state->fire_ch1 = false;
    state->fire_ch2 = false;
    state->fire_ch3 = false;
    state->fire_ch4 = false;
    state->centre_frf = FRF_868;

    /* Setup crystal oscillator */
    rcc_clock_setup_in_hsi_out_48mhz();

    /* Clock GPIOs, set pin modes */
    ignition_pins_init();

    /* Initialise radio and local state variables, read stored config*/
    ignition_radio_init(radio_state);
    rfm_setfreq(state->centre_frf);
    rfm_setpower(RADIO_POWER_DBM);
    
    /* ADC Setup: Clock periph, run init. Pins done in ignition_pins */
    rcc_periph_clock_enable(RCC_ADC);
    adc_init();
}

int main(void)
{
    ignition_state state;
    ignition_radio_state radio_state;

    ignition_init(&state, &radio_state);
    
    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    while(1)
    {
        ignition_radio_receive_blocking(&radio_state);
        if(radio_state.valid_rx)
        {
            state.armed = radio_state.command & (1<<4);
            if(state.armed)
            {
                state.fire_ch1 = radio_state.command & (1<<0);
                state.fire_ch2 = radio_state.command & (1<<1);
                state.fire_ch3 = radio_state.command & (1<<2);
                state.fire_ch4 = radio_state.command & (1<<3);
            }
            else
            {
                state.fire_ch1 = false;
                state.fire_ch2 = false;
                state.fire_ch3 = false;
                state.fire_ch4 = false;
            }
        }
        ignition_radio_transmit(&state, &radio_state);

        if(state.armed)
        {
            gpio_set(LED_ARM_PORT, LED_ARM);
            gpio_clear(LED_DISARM_PORT, LED_DISARM);
            gpio_set(UPSTREAM_RELAY_PORT, UPSTREAM_RELAY);
            gpio_set_bool(FIRE_CH1_PORT, FIRE_CH1, state.fire_ch1);
            gpio_set_bool(FIRE_CH2_PORT, FIRE_CH2, state.fire_ch2);
            gpio_set_bool(FIRE_CH3_PORT, FIRE_CH3, state.fire_ch3);
            gpio_set_bool(FIRE_CH4_PORT, FIRE_CH4, state.fire_ch4);
        }
        else
        {
            gpio_clear(LED_ARM_PORT, LED_ARM);
            gpio_set(LED_DISARM_PORT, LED_DISARM);
            gpio_clear(UPSTREAM_RELAY_PORT, UPSTREAM_RELAY);
            gpio_clear(FIRE_CH1_PORT, FIRE_CH1);
            gpio_clear(FIRE_CH2_PORT, FIRE_CH2);
            gpio_clear(FIRE_CH3_PORT, FIRE_CH3);
            gpio_clear(FIRE_CH4_PORT, FIRE_CH4);
        }

        gpio_toggle(LED_GREEN_PORT, LED_GREEN);
        gpio_toggle(LED_YELLOW_PORT, LED_YELLOW);
    }
    
    return 0;
}
