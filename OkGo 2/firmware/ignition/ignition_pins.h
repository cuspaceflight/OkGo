#ifndef CONTROL_PINS_H
#define CONTROL_PINS_H

/* Clock GPIOs, set pin modes (except radio) */
void ignition_pins_init(void);

/* Set buzzer DAC output value */
void ignition_buzzer_set(uint8_t value);

/* LEDs */
#define LED_GREEN           GPIO13
#define LED_GREEN_PORT      GPIOB
#define LED_YELLOW          GPIO12
#define LED_YELLOW_PORT     GPIOB

#define LED_ARM             GPIO8
#define LED_ARM_PORT        GPIOB
#define LED_DISARM          GPIO9
#define LED_DISARM_PORT     GPIOB

/* Piezo buzzer */
#define BUZZER              GPIO4
#define BUZZER_PORT         GPIOA

/* Upstream relay and firing channels */
#define UPSTREAM_RELAY      GPIO10
#define UPSTREAM_RELAY_PORT GPIOA
#define FIRE_CH1            GPIO9
#define FIRE_CH1_PORT       GPIOA
#define FIRE_CH2            GPIO8
#define FIRE_CH2_PORT       GPIOA
#define FIRE_CH3            GPIO15
#define FIRE_CH3_PORT       GPIOB
#define FIRE_CH4            GPIO14
#define FIRE_CH4_PORT       GPIOB

/* Radio */
#define RFM_NSS             GPIO15
#define RFM_NSS_PORT        GPIOA
#define RFM_RESET           GPIO12
#define RFM_RESET_PORT      GPIOA
#define RFM_DIO0            GPIO15
#define RFM_DIO0_PORT       GPIOC
#define RFM_DIO1            GPIO14
#define RFM_DIO1_PORT       GPIOC
#define RFM_DIO2            GPIO13
#define RFM_DIO2_PORT       GPIOC
#define RFM_DIO3            GPIO6
#define RFM_DIO3_PORT       GPIOB
#define RFM_DIO4            GPIO7
#define RFM_DIO4_PORT       GPIOB
#define RFM_DIO5            GPIO11
#define RFM_DIO5_PORT       GPIOA
#define RFM_NSS 			GPIO15
#define RFM_NSS_PORT 		GPIOA
#define RFM_SCK 			GPIO3
#define RFM_SCK_PORT 		GPIOB
#define RFM_MISO 			GPIO4
#define RFM_MISO_PORT 		GPIOB
#define RFM_MOSI 			GPIO5
#define RFM_MOSI_PORT 		GPIOB

/* Analog pins */
#define BATT_MON 			GPIO0
#define BATT_MON_PORT		GPIOA
#define RELAY_SENSE 		GPIO1
#define RELAY_SENSE_PORT	GPIOB
#define CONT_CH1			GPIO0
#define CONT_CH1_PORT		GPIOB
#define CONT_CH2			GPIO7
#define CONT_CH2_PORT		GPIOA
#define CONT_CH3			GPIO6
#define CONT_CH3_PORT		GPIOA
#define CONT_CH4			GPIO5
#define CONT_CH4_PORT		GPIOA

#endif
