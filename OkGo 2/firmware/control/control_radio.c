#include <stdbool.h>
#include <stdint.h>
#include <string.h>

#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/spi.h>

#include "control_pins.h"
#include "control_radio.h"
#include "rfm95w.h"

/* Setup the SPI peripheral and call the RGM95W initialization procedure.
 * Also initialise all the state variables to sensible defaults */
void control_radio_init()
{
    /* Clock SPI1 peripheral and setup GPIOs appropriately: 
     * NSS, SCK, MOSI, RESET are outputs,
     * MISO is input.
     * SPI setup is done in rfm95w.c */
    rcc_periph_clock_enable(RCC_SPI1);

    /* Make sure NSS doesn't blip when we enable it: */
    gpio_set(RFM_NSS_PORT, RFM_NSS);
    gpio_mode_setup(RFM_NSS_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, RFM_NSS);
    gpio_mode_setup(RFM_SCK_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_SCK);
    gpio_mode_setup(RFM_MOSI_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_MOSI);
    gpio_mode_setup(RFM_MISO_PORT, GPIO_MODE_AF, GPIO_PUPD_NONE, RFM_MISO);
    gpio_set_af(RFM_SCK_PORT, GPIO_AF0, RFM_SCK);
    gpio_set_af(RFM_MOSI_PORT, GPIO_AF0, RFM_MOSI);
    gpio_set_af(RFM_MISO_PORT, GPIO_AF0, RFM_MISO);

    /* Run RFM95W initialization */
    rfm_initialise(SPI1, RFM_NSS_PORT, RFM_NSS);
}
