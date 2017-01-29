#include <stdint.h>
#include <stdbool.h>

#include <libopencm3/stm32/gpio.h>

#include "control_pins.h"
#include "display.h"
#include "utils.h"

/* Internal functions */
/* Write a command or data to the HD44780 */
void _hd44780_write(uint8_t content, bool command);
/* Write half a command or data byte */
void _hd44780_write_nibble(uint8_t content, bool command);

/* Initialise the LCD with appropriate initialisation */
void lcd_init(void)
{
    /* Display pin modes */
    gpio_mode_setup(LCD_RS_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_RS);
    gpio_mode_setup(LCD_E_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_E);
    gpio_mode_setup(LCD_DB4_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_DB4);
    gpio_mode_setup(LCD_DB5_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_DB5);
    gpio_mode_setup(LCD_DB6_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_DB6);
    gpio_mode_setup(LCD_DB7_PORT, GPIO_MODE_OUTPUT, GPIO_PUPD_NONE, LCD_DB7);

    /* Set LCD pins to idle state */
    gpio_clear(LCD_RS_PORT, LCD_RS);
    gpio_clear(LCD_E_PORT, LCD_E);

    /* Wait for things to warm up: LCD wants 40ms guaranteed from 5V startup */
    delay_ms(60);

    /* Set 4-bit mode */
    _hd44780_write_nibble(0x03, true);
    delay_ms(6);
    _hd44780_write_nibble(0x03, true);
    delay_us(200);
    _hd44780_write_nibble(0x03, true); /* yes, really. */
    delay_us(50);
    _hd44780_write_nibble(0x02, true);

    /* Set small font (F=0), 2-line mode (N=1) */
    _hd44780_write((1<<5) | (1<<3), true);
    delay_us(50);

    /* Display on*/
    _hd44780_write((1<<3), true);
    delay_us(50);

    lcd_clear();

    /* Entry point: I/D=1 (left-to-right script), SH=0 (no scroll) */
    _hd44780_write((1<<2) | (1<<1), true);
    delay_us(50);

    /* Display on, cursor off, cursor blink off */
    lcd_config(true, false, false);
    delay_us(50);
    lcd_cursor_pos(0, 0);
    delay_us(50);
}

/* Clear the LCD */
void lcd_clear(void)
{
    _hd44780_write(0x01, true);
    delay_ms(2);
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

/* Move the LCD cursor to specified row and col, counting from top left 0,0 */
void lcd_cursor_pos(uint8_t row, uint8_t col)
{
    const uint8_t row_offsets[] = { 0x00, 0x40, 0x14, 0x54 };
    uint8_t address;

    if(row > 3)
        row = 0;
    if(col > 39)
        col = 0;
    address = row_offsets[row] + col;
    _hd44780_write((1<<7) | address, true);
    delay_us(50);
}

/* Write a single character to the LCD */
void lcd_putc(char c)
{
    _hd44780_write((uint8_t)c, false);
    delay_us(50);
}

/* Write a null-terminated string to the LCD */
void lcd_puts(char *s)
{
    char *pos = s;
    while(*pos != 0)
    {
        _hd44780_write((uint8_t)*pos, false);
        delay_us(50);
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
        delay_us(50);
    }
}

/* Write a command or data byte to the HD44780 */
void _hd44780_write(uint8_t content, bool command)
{
    _hd44780_write_nibble((content>>4) & 0x0F, command);
    delay_us(10);
    _hd44780_write_nibble(content & 0x0F, command);
    delay_us(10);
}

/* Write half of command or data byte to the HD44780 */
void _hd44780_write_nibble(uint8_t content, bool command)
{
    gpio_set_bool(LCD_RS_PORT, LCD_RS, !command);
    delay_us(1);
    gpio_set(LCD_E_PORT, LCD_E);
    delay_us(1);
    gpio_set_bool(LCD_DB4_PORT, LCD_DB4, (content & 0x01) != 0);
    gpio_set_bool(LCD_DB5_PORT, LCD_DB5, (content & 0x02) != 0);
    gpio_set_bool(LCD_DB6_PORT, LCD_DB6, (content & 0x04) != 0);
    gpio_set_bool(LCD_DB7_PORT, LCD_DB7, (content & 0x08) != 0);

    /* This delay should only need to be 1us or so, but this doesn't work.
     * The display goes crazy and displays weird characters.
     * Trial and error suggests 3us doesn't work but 4us delay here does work,
     * so using 8us to give some wiggle room. */
    delay_us(8);

    gpio_clear(LCD_E_PORT, LCD_E);
    delay_us(5);
}

