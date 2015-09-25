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
const uint32_t PACKET_DROP_DELAY = 5000; /* Drop delay in ms */

/* Internal functions */
void ignition_init(ignition_state *state, ignition_radio_state *radio_state);

/* Do beeping */
void do_beep(ignition_state *state);

void ignition_init(ignition_state *state, ignition_radio_state *radio_state)
{
    /* Initialise local state variables */
    state->armed = false;
    state->fire_ch1 = false;
    state->fire_ch2 = false;
    state->fire_ch3 = false;
    state->fire_ch4 = false;
    state->centre_frf = FRF_915;
    state->beep_start = 0;

    /* Setup crystal oscillator and systick */
    rcc_clock_setup_in_hsi_out_48mhz();
    systick_init();

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

/* Do beeping */
void do_beep(ignition_state *state)
{
    uint32_t beep_period;
    uint32_t beep_len;

    if(state->fire_ch1 || state->fire_ch2 || state->fire_ch3 ||
       state->fire_ch4)
    {
        beep_period = 200; /* fire beep period */
        beep_len = 50; /* fire beep length */
    }
    else if(state->armed)
    {
        beep_period = 500; /* armed beep period */
        beep_len = 250; /* armed beep length */
    }
    else
    {
        beep_period = 1000; /* disarmed beep period */
        beep_len = 50; /* disarmed beep len */
    }

    if((get_millis() - state->beep_start) > beep_period)
    {
        /* Start a new beep with the high cycle */
        state->beep_start = get_millis();
        ignition_buzzer_set(94); /* low beep */
    }
    else if((get_millis() - state->beep_start) > beep_len)
        /* Do the low cycle of the beep */
        ignition_buzzer_set(0); /* off */
}

int main(void)
{
    ignition_state state;
    ignition_radio_state radio_state;
    uint32_t last_packet = 0;

    ignition_init(&state, &radio_state);
    
    gpio_set(LED_GREEN_PORT, LED_GREEN);
    gpio_clear(LED_YELLOW_PORT, LED_YELLOW);

    rfm_receive_async(11);

    while(1)
    {
        if(rfm_packet_waiting())
        {
            ignition_radio_receive_async(&radio_state);
            if(radio_state.valid_rx)
            {
                last_packet = get_millis();
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
            delay_ms(10);
            ignition_radio_transmit(&state, &radio_state);
            rfm_receive_async(11);
            gpio_toggle(LED_GREEN_PORT, LED_GREEN);
            gpio_toggle(LED_YELLOW_PORT, LED_YELLOW);
        }

        if(state.armed && !radio_state.lost_link)
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

        if((get_millis() - last_packet) > PACKET_DROP_DELAY)
            radio_state.lost_link = true;
        else
            radio_state.lost_link = false;

        if(radio_state.lost_link)
        {
            gpio_clear(LED_ARM_PORT, LED_ARM);
            gpio_set(LED_DISARM_PORT, LED_DISARM);
            gpio_clear(UPSTREAM_RELAY_PORT, UPSTREAM_RELAY);
            gpio_clear(FIRE_CH1_PORT, FIRE_CH1);
            gpio_clear(FIRE_CH2_PORT, FIRE_CH2);
            gpio_clear(FIRE_CH3_PORT, FIRE_CH3);
            gpio_clear(FIRE_CH4_PORT, FIRE_CH4);
        }

        do_beep(&state);
    }

    
    return 0;
}
