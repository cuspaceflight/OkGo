#ifndef DISPLAY_H
#define DISPLAY_H

#include <stdint.h>
#include <stdbool.h>

/* This library contains three levels of functions:
 * hd44780_ functions consider comms to the HD44780 chip
 * lcd_ commands concern basic LCD manipulation
 * display_ commands handle overall information display logic */

/* Update the LCD based on state variables */
void display_update(void);

/* Initialise the LCD with appropriate initialisation */
void lcd_init(void);

/* Clear the LCD */
void lcd_clear(void);

/* A variety of common runtime config options */
void lcd_config(bool display_active, bool cursor_on, bool cursor_flash);

/* Move the LCD cursor to top-left */
void lcd_cursor_home(void);

/* Write a single character to the LCD */
void lcd_putc(char c);

/* Write a null-terminated string to the LCD */
void lcd_puts(char *s);

/* Write a fixed-length string to the LCD */
void lcd_putsn(char *s, uint8_t len);



#endif