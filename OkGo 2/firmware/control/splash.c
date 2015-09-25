#include <libopencm3/stm32/iwdg.h>
#include <libopencm3/stm32/rcc.h>

#include "splash.h"
#include "display.h"
#include "utils.h"
#include "control_pins.h"

#ifndef FIRMWARE_VERSION
#define FIRMWARE_VERSION "UNKNOWN "
#endif

/* Display an appropriate splash screen depending on state */
void splash(void)
{
	/* If reset caused by windowed/independant watchdog: */
	if(RCC_CSR & (RCC_CSR_WWDGRSTF | RCC_CSR_IWDGRSTF))
	{
		RCC_CSR |= RCC_CSR_RMVF; /* Reset wdt signal */
		splash_wdt();
	}
	else if(!gpio_get_bool(SW_KEY_PORT, SW_KEY))
		splash_armed();
	else
		splash_normal();
}

/* Display the normal CUSF OkGo2 splash screen */
void splash_normal(void)
{
	lcd_cursor_pos(0, 0);
	lcd_puts("Cambridge    OKGO 2 ");
	lcd_cursor_pos(1, 0);
	lcd_puts("University  by dwt27");
	lcd_cursor_pos(2, 0);
	lcd_puts("Space       Sept '15");
	lcd_cursor_pos(3, 0);
	lcd_puts("Flight      ");
	lcd_puts(FIRMWARE_VERSION);
	delay_ms(2000);

	lcd_cursor_pos(0, 0);
	lcd_puts("Buzzer settings     ");
	lcd_cursor_pos(1, 0);
	lcd_puts("Hold on boot:       ");
	lcd_cursor_pos(2, 0);
	lcd_puts("CH1: off  CH2: low  ");
	lcd_cursor_pos(3, 0);
	lcd_puts("CH3: med  CH4: high ");
	delay_ms(2000);

}

/* Display the WDT reset splash */
void splash_wdt(void)
{
	lcd_cursor_pos(0, 0);
	lcd_puts("      WARNING!      ");
	lcd_cursor_pos(1, 0);
	lcd_puts("   INTERNAL ERROR   ");
	lcd_cursor_pos(2, 0);
	lcd_puts("WATCHDOG TIMER RESET");
	delay_ms(1000);
}

/* Hang in the turned-on-while-armed splash */
void splash_armed(void)
{
	lcd_cursor_pos(0, 0);
	lcd_puts("REFUSING TO POWER  ");
	lcd_cursor_pos(1, 0);
	lcd_puts("UP WHILE ARMED! TURN");
	lcd_cursor_pos(2, 0);
	lcd_puts("OFF, DISARM, THEN   ");
	lcd_cursor_pos(3, 0);
	lcd_puts("TURN BACK ON AGAIN! ");
	while(1)
		iwdg_reset();
}
