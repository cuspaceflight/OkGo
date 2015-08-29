#include <stdint.h>
#include <stdbool.h>

#include "display.h"
#include "utils.h"

/* Internal functions */
/* Write a command or data to the HD44780 */
void _hd44780_write(uint8_t content, bool command);
/* Write half a command or data byte */
void _hd44780_write_nibble(uint8_t content, bool command);

/* Update the LCD based on state variables */
void display_update(void)
{
	// TODO
}

/* Initialise the LCD with appropriate initialisation */
void lcd_init(void)
{
	/* TODO: Setup GPIOs */
	/* TODO: Set GPIOs to idle state and wait a bit */

	delay_ms(50); /* wait for things to warm up */

	/* Set 4-bit mode */
	_hd44780_write_nibble(0x03, true);
	delay_ms(5);
	_hd44780_write_nibble(0x03, true);
	delay_ms(1);
	_hd44780_write_nibble(0x03, true);

	/* Set small font (F=0), 2-line mode (N=1) */
	_hd44780_write((1<<5) | (1<<3), true);

	/* Display... off?? Datasheet says so. */
	_hd44780_write((1<<3), true);

	lcd_clear();

	/* Entry point: I/D=1 (?????), SH=0 (???) */
	_hd44780_write((1<<2) | (1<<1), true);

	lcd_config(true, false, false);
}

/* Clear the LCD */
void lcd_clear(void)
{
	_hd44780_write(0x01, true);
}

/* A variety of common runtime config options */
void lcd_config(bool display_active, bool cursor_on, bool cursor_blink)
{
	uint8_t content = 0x08;
	if(display_active)
		content |= (1<<2);
	if(cursor_on)
		content |= (1<<1);
	if(cursor_blink)
		content |= 1;
	_hd44780_write(content, true);
}

/* Move the LCD cursor to top-left */
void lcd_cursor_home(void)
{
	_hd44780_write(0x02, true);
}

/* Write a single character to the LCD */
void lcd_putc(char c)
{
	_hd44780_write((uint8_t)c, false);
}

/* Write a null-terminated string to the LCD */
void lcd_puts(char *s)
{
	char *pos = s;
	while(*pos != 0)
	{
		_hd44780_write((uint8_t)*pos, false);
		pos++;
	}
}

/* Write a fixed-length string to the LCD */
void lcd_putsn(char *s, uint8_t len)
{
	uint8_t i;
	for(i=0; i<len; i++)
	{
		char c = *(s + i);
		_hd44780_write((uint8_t)c, false);
	}
}

/* Write a command or data to the HD44780 */
void _hd44780_write(uint8_t content, bool command)
{
	_hd44780_write_nibble((content<<4) & 0x0F, command);
	_hd44780_write_nibble(content & 0x0F, command);
}

void _hd44780_write_nibble(uint8_t content, bool command)
{
	// TODO
	(void)content;
	(void)command;
}
