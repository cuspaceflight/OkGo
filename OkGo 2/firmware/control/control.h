#ifndef CONTROL_H
#define CONTROL_H

#define CH_STATUS_OK 0
#define CH_STATUS_CONT_ERR 1
#define CH_STATUS_FIRE 2

typedef struct
{
	bool armed;
	uint32_t centre_frf;
	uint8_t batt_voltage; /* as tenths of a volt */
	uint8_t ch1_status, ch2_status, ch3_status, ch4_status;
} control_state;

#endif