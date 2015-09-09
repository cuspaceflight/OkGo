#ifndef CONTROL_PINS_H
#define CONTROL_PINS_H

/* Clock GPIOs, set pin modes (except radio and display) */
void control_pins_init(void);

/* LEDs */
#define LED_GREEN       GPIO12
#define LED_GREEN_PORT  GPIOA
#define LED_YELLOW      GPIO11
#define LED_YELLOW_PORT GPIOA

#define LED_ARM         GPIO8
#define LED_ARM_PORT    GPIOA
#define LED_DISARM      GPIO9
#define LED_DISARM_PORT GPIOA

/* Keyswitch */
#define SW_KEY          GPIO10
#define SW_KEY_PORT     GPIOA

/* Channels - switches and LEDs */
#define LED_CH1         GPIO0
#define LED_CH1_PORT    GPIOB
#define LED_CH2         GPIO10
#define LED_CH2_PORT    GPIOB
#define LED_CH3         GPIO12
#define LED_CH3_PORT    GPIOB
#define LED_CH4         GPIO14
#define LED_CH4_PORT    GPIOB

#define SW_CH1          GPIO2
#define SW_CH1_PORT     GPIOB
#define SW_CH2          GPIO11
#define SW_CH2_PORT     GPIOB
#define SW_CH3          GPIO13
#define SW_CH3_PORT     GPIOB
#define SW_CH4          GPIO15
#define SW_CH4_PORT     GPIOB

/* LCD */
#define LCD_RS          GPIO15
#define LCD_RS_PORT     GPIOA
#define LCD_E           GPIO3
#define LCD_E_PORT      GPIOB
#define LCD_DB4         GPIO4
#define LCD_DB4_PORT    GPIOB
#define LCD_DB5         GPIO5
#define LCD_DB5_PORT    GPIOB
#define LCD_DB6         GPIO6
#define LCD_DB6_PORT    GPIOB
#define LCD_DB7         GPIO7
#define LCD_DB7_PORT    GPIOB

/* Radio */
#define RFM_NSS         GPIO4
#define RFM_NSS_PORT    GPIOA
#define RFM_SCK         GPIO5
#define RFM_SCK_PORT    GPIOA
#define RFM_MISO        GPIO6
#define RFM_MISO_PORT   GPIOA
#define RFM_MOSI        GPIO7
#define RFM_MOSI_PORT   GPIOA
#define RFM_RESET       GPIO3
#define RFM_RESET_PORT  GPIOA
#define RFM_DIO0        GPIO13
#define RFM_DIO0_PORT   GPIOC
#define RFM_DIO1        GPIO14
#define RFM_DIO1_PORT   GPIOC
#define RFM_DIO2        GPIO15
#define RFM_DIO2_PORT   GPIOC
#define RFM_DIO3        GPIO8
#define RFM_DIO3_PORT   GPIOB
#define RFM_DIO4        GPIO9
#define RFM_DIO4_PORT   GPIOB
#define RFM_DIO5        GPIO2
#define RFM_DIO5_PORT   GPIOA

#endif
