EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:swd
LIBS:lcd_hd44780
LIBS:stm32f071cbt6
LIBS:tvs_small
LIBS:testpoint
LIBS:adp3335
LIBS:sma
LIBS:part
LIBS:lipo_1s
LIBS:spst_small
LIBS:push_illum
LIBS:push_illum_straight
LIBS:mej2s0305sc
LIBS:led_bicolour
LIBS:control-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L GND #PWR01
U 1 1 556214DE
P 6875 1800
F 0 "#PWR01" H 6875 1550 50  0001 C CNN
F 1 "GND" H 6875 1650 50  0000 C CNN
F 2 "" H 6875 1800 60  0000 C CNN
F 3 "" H 6875 1800 60  0000 C CNN
	1    6875 1800
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR02
U 1 1 556214F3
P 6875 1600
F 0 "#PWR02" H 6875 1450 50  0001 C CNN
F 1 "+BATT" H 6875 1740 50  0000 C CNN
F 2 "" H 6875 1600 60  0000 C CNN
F 3 "" H 6875 1600 60  0000 C CNN
	1    6875 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR03
U 1 1 556215CB
P 9500 1600
F 0 "#PWR03" H 9500 1350 50  0001 C CNN
F 1 "GND" H 9500 1450 50  0000 C CNN
F 2 "" H 9500 1600 60  0000 C CNN
F 3 "" H 9500 1600 60  0000 C CNN
	1    9500 1600
	1    0    0    -1  
$EndComp
$Comp
L C C113
U 1 1 556215E1
P 8500 1300
F 0 "C113" H 8525 1400 50  0000 L CNN
F 1 "2u2" H 8525 1200 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 8538 1150 30  0001 C CNN
F 3 "" H 8500 1300 60  0000 C CNN
F 4 "2362106" H 8500 1300 60  0001 C CNN "Farnell"
	1    8500 1300
	1    0    0    -1  
$EndComp
$Comp
L C C114
U 1 1 55621639
P 10250 1250
F 0 "C114" H 10275 1350 50  0000 L CNN
F 1 "2u2" H 10275 1150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 10288 1100 30  0001 C CNN
F 3 "" H 10250 1250 60  0000 C CNN
F 4 "2362106" H 10250 1250 60  0001 C CNN "Farnell"
	1    10250 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 556216C5
P 8500 1500
F 0 "#PWR04" H 8500 1250 50  0001 C CNN
F 1 "GND" H 8500 1350 50  0000 C CNN
F 2 "" H 8500 1500 60  0000 C CNN
F 3 "" H 8500 1500 60  0000 C CNN
	1    8500 1500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 556216DE
P 10250 1450
F 0 "#PWR05" H 10250 1200 50  0001 C CNN
F 1 "GND" H 10250 1300 50  0000 C CNN
F 2 "" H 10250 1450 60  0000 C CNN
F 3 "" H 10250 1450 60  0000 C CNN
	1    10250 1450
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG06
U 1 1 556217FC
P 5725 1600
F 0 "#FLG06" H 5725 1695 50  0001 C CNN
F 1 "PWR_FLAG" H 5725 1780 50  0001 C CNN
F 2 "" H 5725 1600 60  0000 C CNN
F 3 "" H 5725 1600 60  0000 C CNN
	1    5725 1600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG07
U 1 1 55621881
P 5725 1800
F 0 "#FLG07" H 5725 1895 50  0001 C CNN
F 1 "PWR_FLAG" H 5725 1980 50  0001 C CNN
F 2 "" H 5725 1800 60  0000 C CNN
F 3 "" H 5725 1800 60  0000 C CNN
	1    5725 1800
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR08
U 1 1 55629E65
P 9000 6300
F 0 "#PWR08" H 9000 6050 50  0001 C CNN
F 1 "GND" H 9000 6150 50  0001 C CNN
F 2 "" H 9000 6300 60  0000 C CNN
F 3 "" H 9000 6300 60  0000 C CNN
	1    9000 6300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5562B214
P 7200 5350
F 0 "#PWR09" H 7200 5100 50  0001 C CNN
F 1 "GND" H 7200 5200 50  0000 C CNN
F 2 "" H 7200 5350 60  0000 C CNN
F 3 "" H 7200 5350 60  0000 C CNN
	1    7200 5350
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR010
U 1 1 5562B35A
P 7250 4900
F 0 "#PWR010" H 7250 4750 50  0001 C CNN
F 1 "+3V3" H 7250 5040 50  0000 C CNN
F 2 "" H 7250 4900 60  0000 C CNN
F 3 "" H 7250 4900 60  0000 C CNN
	1    7250 4900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR011
U 1 1 55624CAA
P 10650 850
F 0 "#PWR011" H 10650 700 50  0001 C CNN
F 1 "+3V3" H 10650 990 50  0000 C CNN
F 2 "" H 10650 850 60  0000 C CNN
F 3 "" H 10650 850 60  0000 C CNN
	1    10650 850 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR012
U 1 1 5562C6B7
P 1200 2575
F 0 "#PWR012" H 1200 2425 50  0001 C CNN
F 1 "+3V3" H 1200 2715 50  0000 C CNN
F 2 "" H 1200 2575 60  0000 C CNN
F 3 "" H 1200 2575 60  0000 C CNN
	1    1200 2575
	1    0    0    -1  
$EndComp
$Comp
L C C107
U 1 1 5562D332
P 1050 3925
F 0 "C107" V 1100 3975 50  0000 L CNN
F 1 "1u" V 1100 3775 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 3775 30  0001 C CNN
F 3 "" H 1050 3925 60  0000 C CNN
F 4 "9227792" H 1050 3925 60  0001 C CNN "Farnell"
	1    1050 3925
	0    1    1    0   
$EndComp
$Comp
L C C106
U 1 1 5562D381
P 1050 3725
F 0 "C106" V 1100 3775 50  0000 L CNN
F 1 "10n" V 1100 3525 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 3575 30  0001 C CNN
F 3 "" H 1050 3725 60  0000 C CNN
F 4 "2407341" H 1050 3725 60  0001 C CNN "Farnell"
	1    1050 3725
	0    1    1    0   
$EndComp
$Comp
L C C105
U 1 1 5562D3B3
P 1050 3525
F 0 "C105" V 1100 3575 50  0000 L CNN
F 1 "4u7" V 1100 3325 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 3375 30  0001 C CNN
F 3 "" H 1050 3525 60  0000 C CNN
F 4 "1845742" H 1050 3525 60  0001 C CNN "Farnell"
	1    1050 3525
	0    1    1    0   
$EndComp
$Comp
L GND #PWR013
U 1 1 5562DCAE
P 1200 4275
F 0 "#PWR013" H 1200 4025 50  0001 C CNN
F 1 "GND" H 1200 4125 50  0000 C CNN
F 2 "" H 1200 4275 60  0000 C CNN
F 3 "" H 1200 4275 60  0000 C CNN
	1    1200 4275
	1    0    0    -1  
$EndComp
$Comp
L C C108
U 1 1 5562E486
P 3650 3225
F 0 "C108" H 3675 3325 50  0000 L CNN
F 1 "100n" H 3675 3125 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 3688 3075 30  0001 C CNN
F 3 "" H 3650 3225 60  0000 C CNN
F 4 "2407344" H 3650 3225 60  0001 C CNN "Farnell"
	1    3650 3225
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5562E73A
P 3600 3425
F 0 "#PWR014" H 3600 3175 50  0001 C CNN
F 1 "GND" H 3600 3275 50  0000 C CNN
F 2 "" H 3600 3425 60  0000 C CNN
F 3 "" H 3600 3425 60  0000 C CNN
	1    3600 3425
	-1   0    0    -1  
$EndComp
$Comp
L Crystal Y101
U 1 1 55631E06
P 4150 4025
F 0 "Y101" V 3950 4025 50  0000 C CNN
F 1 "8MHz" V 4375 4025 50  0000 C CNN
F 2 "common:XTAL50x32" H 4150 4025 60  0001 C CNN
F 3 "" H 4150 4025 60  0000 C CNN
F 4 "2101329" H 4150 4025 60  0001 C CNN "Farnell"
	1    4150 4025
	0    -1   1    0   
$EndComp
$Comp
L R R102
U 1 1 5563219C
P 3700 4075
F 0 "R102" V 3800 4175 50  0000 C CNN
F 1 "100R" V 3800 3950 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 3630 4075 30  0001 C CNN
F 3 "" H 3700 4075 30  0000 C CNN
F 4 "2331783" H 3700 4075 60  0001 C CNN "Farnell"
	1    3700 4075
	0    -1   1    0   
$EndComp
$Comp
L C C109
U 1 1 5563246F
P 4525 4175
F 0 "C109" V 4675 4100 50  0000 L CNN
F 1 "15p" V 4575 4250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4563 4025 30  0001 C CNN
F 3 "" H 4525 4175 60  0000 C CNN
F 4 "1414668" H 4525 4175 60  0001 C CNN "Farnell"
	1    4525 4175
	0    -1   1    0   
$EndComp
$Comp
L C C110
U 1 1 55632519
P 4525 3875
F 0 "C110" V 4375 3800 50  0000 L CNN
F 1 "15p" V 4475 3950 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 4563 3725 30  0001 C CNN
F 3 "" H 4525 3875 60  0000 C CNN
F 4 "1414668" H 4525 3875 60  0001 C CNN "Farnell"
	1    4525 3875
	0    -1   1    0   
$EndComp
$Comp
L SWD U101
U 1 1 55647D4E
P 1575 7000
F 0 "U101" V 1575 7000 60  0000 C CNN
F 1 "SWD" V 1475 7000 60  0000 C CNN
F 2 "common:FTSH-105-01-F-D-K" H 1475 7300 60  0001 C CNN
F 3 "" H 1475 7300 60  0000 C CNN
	1    1575 7000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR015
U 1 1 556484DA
P 925 6750
F 0 "#PWR015" H 925 6600 50  0001 C CNN
F 1 "+3V3" H 925 6890 50  0000 C CNN
F 2 "" H 925 6750 60  0000 C CNN
F 3 "" H 925 6750 60  0000 C CNN
	1    925  6750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5564860C
P 875 7250
F 0 "#PWR016" H 875 7000 50  0001 C CNN
F 1 "GND" H 875 7100 50  0000 C CNN
F 2 "" H 875 7250 60  0000 C CNN
F 3 "" H 875 7250 60  0000 C CNN
	1    875  7250
	1    0    0    -1  
$EndComp
NoConn ~ 2175 7000
NoConn ~ 2175 7100
$Comp
L C C103
U 1 1 5564FCE8
P 1050 3125
F 0 "C103" V 1100 3175 50  0000 L CNN
F 1 "4u7" V 1100 2925 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 2975 30  0001 C CNN
F 3 "" H 1050 3125 60  0000 C CNN
F 4 "1845742" H 1050 3125 60  0001 C CNN "Farnell"
	1    1050 3125
	0    1    1    0   
$EndComp
$Comp
L R R105
U 1 1 5565208A
P 7125 1850
F 0 "R105" V 7205 1850 50  0000 C CNN
F 1 "3k3" V 7025 1850 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 7055 1850 30  0001 C CNN
F 3 "" H 7125 1850 30  0000 C CNN
F 4 "9237682" H 7125 1850 60  0001 C CNN "Farnell"
	1    7125 1850
	1    0    0    -1  
$EndComp
$Comp
L R R106
U 1 1 55652110
P 7125 2250
F 0 "R106" V 7205 2250 50  0000 C CNN
F 1 "10k" V 7025 2250 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805" V 7055 2250 30  0001 C CNN
F 3 "" H 7125 2250 30  0000 C CNN
F 4 "9237755" H 7125 2250 60  0001 C CNN "Farnell"
	1    7125 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 556523AF
P 7125 2450
F 0 "#PWR017" H 7125 2200 50  0001 C CNN
F 1 "GND" H 7125 2300 50  0000 C CNN
F 2 "" H 7125 2450 60  0000 C CNN
F 3 "" H 7125 2450 60  0000 C CNN
	1    7125 2450
	1    0    0    -1  
$EndComp
$Comp
L LCD_HD44780 U106
U 1 1 55638A7C
P 8200 3750
F 0 "U106" V 8250 3750 60  0000 C CNN
F 1 "LCD_HD44780" V 8150 3750 60  0000 C CNN
F 2 "control:LCD_MC42004A6W" H 7450 4400 60  0001 C CNN
F 3 "" H 7450 4400 60  0000 C CNN
F 4 "2342651" H 8200 3750 60  0001 C CNN "Farnell"
	1    8200 3750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR018
U 1 1 5563E071
P 7500 3250
F 0 "#PWR018" H 7500 3100 50  0001 C CNN
F 1 "+3V3" H 7500 3390 50  0000 C CNN
F 2 "" H 7500 3250 60  0000 C CNN
F 3 "" H 7500 3250 60  0000 C CNN
	1    7500 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5563E174
P 7500 3350
F 0 "#PWR019" H 7500 3100 50  0001 C CNN
F 1 "GND" H 7500 3200 50  0000 C CNN
F 2 "" H 7500 3350 60  0000 C CNN
F 3 "" H 7500 3350 60  0000 C CNN
	1    7500 3350
	1    0    0    -1  
$EndComp
$Comp
L POT RV101
U 1 1 5563E702
P 6800 3850
F 0 "RV101" H 6800 3750 50  0000 C CNN
F 1 "20k LIN" H 6800 3850 50  0000 C CNN
F 2 "control:bourns3386G" H 6800 3850 60  0001 C CNN
F 3 "" H 6800 3850 60  0000 C CNN
F 4 "9354824" H 6800 3850 60  0001 C CNN "Farnell"
	1    6800 3850
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR020
U 1 1 5563E7A7
P 6800 3550
F 0 "#PWR020" H 6800 3400 50  0001 C CNN
F 1 "+3V3" H 6800 3690 50  0000 C CNN
F 2 "" H 6800 3550 60  0000 C CNN
F 3 "" H 6800 3550 60  0000 C CNN
	1    6800 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 5563E8D6
P 6800 4150
F 0 "#PWR021" H 6800 3900 50  0001 C CNN
F 1 "GND" H 6800 4000 50  0000 C CNN
F 2 "" H 6800 4150 60  0000 C CNN
F 3 "" H 6800 4150 60  0000 C CNN
	1    6800 4150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR022
U 1 1 55643E77
P 7150 3650
F 0 "#PWR022" H 7150 3400 50  0001 C CNN
F 1 "GND" H 7150 3500 50  0000 C CNN
F 2 "" H 7150 3650 60  0000 C CNN
F 3 "" H 7150 3650 60  0000 C CNN
	1    7150 3650
	1    0    0    -1  
$EndComp
$Comp
L RFM95W U105
U 1 1 55635406
P 8100 5550
F 0 "U105" V 8150 5550 60  0000 C CNN
F 1 "RFM95W" V 8050 5550 60  0000 C CNN
F 2 "common:RFM95W" H 8100 5600 60  0001 C CNN
F 3 "" H 8100 5600 60  0000 C CNN
	1    8100 5550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 55638AFF
P 7100 4150
F 0 "#PWR023" H 7100 3900 50  0001 C CNN
F 1 "GND" H 7100 4000 50  0000 C CNN
F 2 "" H 7100 4150 60  0000 C CNN
F 3 "" H 7100 4150 60  0000 C CNN
	1    7100 4150
	1    0    0    -1  
$EndComp
$Comp
L STM32F071CBT6 U102
U 1 1 559BF2FD
P 2400 4825
F 0 "U102" V 2450 4975 60  0000 C CNN
F 1 "STM32F071CBT6" V 2350 4975 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 2400 5025 60  0001 C CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00098745.pdf" H 2400 5025 60  0001 C CNN
F 4 "2432093" H 2400 4825 60  0001 C CNN "Farnell"
	1    2400 4825
	1    0    0    -1  
$EndComp
$Comp
L TVS_small D101
U 1 1 559DC9F3
P 4800 1700
F 0 "D101" V 5000 1700 50  0000 C CNN
F 1 "TVS_small" H 4800 1625 50  0001 C CNN
F 2 "Resistors_SMD:R_0603" H 4800 1700 60  0001 C CNN
F 3 "" H 4800 1700 60  0000 C CNN
F 4 "2368174" H 4800 1700 60  0001 C CNN "Farnell"
	1    4800 1700
	0    1    1    0   
$EndComp
$Comp
L TVS_small D103
U 1 1 559DD518
P 8800 6175
F 0 "D103" H 8800 6250 50  0000 C CNN
F 1 "TVS_small" H 8800 6100 50  0001 C CNN
F 2 "Resistors_SMD:R_0603" H 8800 6175 60  0001 C CNN
F 3 "" H 8800 6175 60  0000 C CNN
F 4 "2368174" H 8800 6175 60  0001 C CNN "Farnell"
	1    8800 6175
	0    -1   -1   0   
$EndComp
Text Label 3800 3025 0    60   ~ 0
nRST
Text Label 3150 4275 0    60   ~ 0
SWDIO
Text Label 3150 4375 0    60   ~ 0
SWDCLK
Text Label 2175 6800 0    60   ~ 0
SWDIO
Text Label 2175 6900 0    60   ~ 0
SWDCLK
Text Label 2175 7200 0    60   ~ 0
nRST
Text Label 8700 5150 0    60   ~ 0
RFM_DIO0
Text Label 8700 5250 0    60   ~ 0
RFM_DIO1
Text Label 8700 5350 0    60   ~ 0
RFM_DIO2
Text Label 8700 5450 0    60   ~ 0
RFM_DIO3
Text Label 8700 5550 0    60   ~ 0
RFM_DIO4
Text Label 8700 5650 0    60   ~ 0
RFM_DIO5
Text Label 7500 5650 2    60   ~ 0
RFM_MISO
Text Label 7500 5750 2    60   ~ 0
RFM_MOSI
Text Label 7500 5850 2    60   ~ 0
RFM_SCK
Text Label 7500 5950 2    60   ~ 0
RFM_NSS
Text Label 7500 6050 2    60   ~ 0
RFM_RESET
Text Label 3050 3575 0    60   ~ 0
RFM_DIO0
Text Label 3050 3675 0    60   ~ 0
RFM_DIO1
Text Label 3050 3775 0    60   ~ 0
RFM_DIO2
Text Label 1700 5425 2    60   ~ 0
RFM_DIO3
Text Label 1700 5525 2    60   ~ 0
RFM_DIO4
Text Label 3050 4775 0    60   ~ 0
RFM_DIO5
Text Label 3050 4975 0    60   ~ 0
RFM_NSS
Text Label 3050 5075 0    60   ~ 0
RFM_SCK
Text Label 3050 5175 0    60   ~ 0
RFM_MISO
Text Label 3050 5275 0    60   ~ 0
RFM_MOSI
Text Label 8750 3800 0    60   ~ 0
LCD_DB4
Text Label 8750 3900 0    60   ~ 0
LCD_DB5
Text Label 8750 4000 0    60   ~ 0
LCD_DB6
Text Label 8750 4100 0    60   ~ 0
LCD_DB7
Text Label 7600 4050 2    60   ~ 0
LCD_RS
Text Label 7600 4250 2    60   ~ 0
LCD_E
Text Label 7275 2050 0    60   ~ 0
BATT_MON
Text Label 1700 4825 2    60   ~ 0
CH1_SW
Text Label 1700 5725 2    60   ~ 0
CH2_SW
Text Label 1700 5925 2    60   ~ 0
CH3_SW
Text Label 1700 6125 2    60   ~ 0
CH4_SW
Text Label 1700 4625 2    60   ~ 0
CH1_LED
Text Label 1700 5625 2    60   ~ 0
CH2_LED
Text Label 1700 5825 2    60   ~ 0
CH3_LED
Text Label 1700 6025 2    60   ~ 0
CH4_LED
Text Label 3050 4875 0    60   ~ 0
RFM_RESET
Text Label 1700 5025 2    60   ~ 0
LCD_DB4
Text Label 1700 5125 2    60   ~ 0
LCD_DB5
Text Label 1700 5225 2    60   ~ 0
LCD_DB6
Text Label 1700 5325 2    60   ~ 0
LCD_DB7
Text Label 3050 5975 0    60   ~ 0
LCD_RS
Text Label 1700 4925 2    60   ~ 0
LCD_E
Text Label 1700 4725 2    60   ~ 0
BATT_MON
$Comp
L TestPoint TP102
U 1 1 559DAAF9
P 10425 950
F 0 "TP102" H 10425 875 60  0000 C CNN
F 1 "3v3" H 10400 775 60  0000 C CNN
F 2 "common:TESTPOINT" H 10425 950 60  0001 C CNN
F 3 "" H 10425 950 60  0000 C CNN
	1    10425 950 
	-1   0    0    1   
$EndComp
$Comp
L TestPoint TP101
U 1 1 559DB26A
P 3500 3025
F 0 "TP101" H 3500 2950 60  0000 C CNN
F 1 "nRST" H 3500 2850 60  0000 C CNN
F 2 "common:TESTPOINT" H 3500 3025 60  0001 C CNN
F 3 "" H 3500 3025 60  0000 C CNN
	1    3500 3025
	-1   0    0    1   
$EndComp
$Comp
L C C104
U 1 1 559DAEBF
P 1050 3325
F 0 "C104" V 1000 3375 50  0000 L CNN
F 1 "100n" V 1000 3075 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 3175 30  0001 C CNN
F 3 "" H 1050 3325 60  0000 C CNN
F 4 "2407344" H 1050 3325 60  0001 C CNN "Farnell"
	1    1050 3325
	0    1    -1   0   
$EndComp
$Comp
L C C102
U 1 1 559DB222
P 1050 2925
F 0 "C102" V 1000 2975 50  0000 L CNN
F 1 "100n" V 1000 2675 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 2775 30  0001 C CNN
F 3 "" H 1050 2925 60  0000 C CNN
F 4 "2407344" H 1050 2925 60  0001 C CNN "Farnell"
	1    1050 2925
	0    1    -1   0   
$EndComp
$Comp
L C C101
U 1 1 559DB2C5
P 1050 2725
F 0 "C101" V 1000 2775 50  0000 L CNN
F 1 "100n" V 1000 2475 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 1088 2575 30  0001 C CNN
F 3 "" H 1050 2725 60  0000 C CNN
F 4 "2407344" H 1050 2725 60  0001 C CNN "Farnell"
	1    1050 2725
	0    1    -1   0   
$EndComp
$Comp
L C C112
U 1 1 559DBA6F
P 7250 5150
F 0 "C112" H 7050 5250 50  0000 L CNN
F 1 "100n" H 7050 5050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805" H 7288 5000 30  0001 C CNN
F 3 "" H 7250 5150 60  0000 C CNN
F 4 "2407344" H 7250 5150 60  0001 C CNN "Farnell"
	1    7250 5150
	1    0    0    1   
$EndComp
$Comp
L C C111
U 1 1 559DBFDA
P 6950 5150
F 0 "C111" H 6750 5250 50  0000 L CNN
F 1 "100u" H 6750 5050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206" H 6988 5000 30  0001 C CNN
F 3 "" H 6950 5150 60  0000 C CNN
F 4 "2362115" H 6950 5150 60  0001 C CNN "Farnell"
	1    6950 5150
	1    0    0    1   
$EndComp
$Comp
L ADP3335 U107
U 1 1 559E0082
P 9400 950
F 0 "U107" V 9500 950 60  0000 C CNN
F 1 "ADP3335" V 9400 950 60  0000 C CNN
F 2 "Housings_SSOP:MSOP-8_3x3mm_Pitch0.65mm" H 9400 1100 60  0001 C CNN
F 3 "" H 9400 1100 60  0000 C CNN
F 4 "2067775" H 9400 950 60  0001 C CNN "Farnell"
	1    9400 950 
	1    0    0    -1  
$EndComp
$Comp
L SMA P108
U 1 1 559E45E1
P 9150 6050
F 0 "P108" H 9300 5950 60  0000 C CNN
F 1 "SMA" H 9250 6150 60  0000 C CNN
F 2 "common:SMA-142-0701-801" H 9150 6050 60  0001 C CNN
F 3 "" H 9150 6050 60  0000 C CNN
F 4 "1608592" H 9150 6050 60  0001 C CNN "Farnell"
	1    9150 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR024
U 1 1 559E503C
P 9000 5850
F 0 "#PWR024" H 9000 5600 50  0001 C CNN
F 1 "GND" H 9000 5700 50  0001 C CNN
F 2 "" H 9000 5850 60  0000 C CNN
F 3 "" H 9000 5850 60  0000 C CNN
	1    9000 5850
	-1   0    0    1   
$EndComp
$Comp
L +3V3 #PWR025
U 1 1 559EA6BB
P 3150 7050
F 0 "#PWR025" H 3150 6900 50  0001 C CNN
F 1 "+3V3" H 3150 7190 50  0000 C CNN
F 2 "" H 3150 7050 60  0000 C CNN
F 3 "" H 3150 7050 60  0000 C CNN
	1    3150 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 559EA828
P 3150 7250
F 0 "#PWR026" H 3150 7000 50  0001 C CNN
F 1 "GND" H 3150 7100 50  0000 C CNN
F 2 "" H 3150 7250 60  0000 C CNN
F 3 "" H 3150 7250 60  0000 C CNN
	1    3150 7250
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR027
U 1 1 559EAA6F
P 4350 7050
F 0 "#PWR027" H 4350 6900 50  0001 C CNN
F 1 "+5V" H 4350 7190 50  0000 C CNN
F 2 "" H 4350 7050 60  0000 C CNN
F 3 "" H 4350 7050 60  0000 C CNN
	1    4350 7050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 559EABE0
P 4350 7250
F 0 "#PWR028" H 4350 7000 50  0001 C CNN
F 1 "GND" H 4350 7100 50  0000 C CNN
F 2 "" H 4350 7250 60  0000 C CNN
F 3 "" H 4350 7250 60  0000 C CNN
	1    4350 7250
	1    0    0    -1  
$EndComp
$Sheet
S 10200 4100 550  1050
U 559ED680
F0 "controls" 60
F1 "controls.sch" 60
F2 "CH1_LED" I L 10200 4200 60 
F3 "CH1_SW" O L 10200 4300 60 
F4 "CH2_LED" I L 10200 4450 60 
F5 "CH2_SW" O L 10200 4550 60 
F6 "CH3_LED" I L 10200 4700 60 
F7 "CH3_SW" O L 10200 4800 60 
F8 "CH4_LED" I L 10200 4950 60 
F9 "CH4_SW" O L 10200 5050 60 
$EndSheet
Text Label 10200 4200 2    60   ~ 0
CH1_LED
Text Label 10200 4300 2    60   ~ 0
CH1_SW
Text Label 10200 4450 2    60   ~ 0
CH2_LED
Text Label 10200 4550 2    60   ~ 0
CH2_SW
Text Label 10200 4700 2    60   ~ 0
CH3_LED
Text Label 10200 4800 2    60   ~ 0
CH3_SW
Text Label 10200 4950 2    60   ~ 0
CH4_LED
Text Label 10200 5050 2    60   ~ 0
CH4_SW
$Comp
L LiPO_1S BT101
U 1 1 55A20375
P 3800 1700
F 0 "BT101" H 3500 1750 50  0000 L CNN
F 1 "LiPO_1S" H 3400 1650 50  0000 L CNN
F 2 "" V 3800 1740 60  0000 C CNN
F 3 "" V 3800 1740 60  0000 C CNN
F 4 "https://www.coolcomponents.co.uk/lithium-polymer-battery-2000mah.html" H 3800 1700 60  0001 C CNN "URL"
	1    3800 1700
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P103
U 1 1 55A20420
P 4000 2150
F 0 "P103" V 4000 2350 50  0000 C CNN
F 1 "BATT_CASE" V 4000 1850 50  0000 C CNN
F 2 "" H 4000 2150 60  0001 C CNN
F 3 "" H 4000 2150 60  0000 C CNN
F 4 "1830747" H 4000 2150 60  0001 C CNN "Farnell"
	1    4000 2150
	0    -1   1    0   
$EndComp
$Comp
L FUSE F101
U 1 1 55A241B6
P 6125 1650
F 0 "F101" H 6225 1700 50  0000 C CNN
F 1 "PTC" H 5975 1600 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" H 6125 1650 60  0001 C CNN
F 3 "" H 6125 1650 60  0000 C CNN
F 4 "1294879" H 6125 1650 60  0001 C CNN "Farnell"
	1    6125 1650
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR029
U 1 1 55A7EBCE
P 8300 900
F 0 "#PWR029" H 8300 750 50  0001 C CNN
F 1 "+BATT" H 8300 1040 50  0000 C CNN
F 2 "" H 8300 900 60  0000 C CNN
F 3 "" H 8300 900 60  0000 C CNN
	1    8300 900 
	1    0    0    -1  
$EndComp
$Comp
L SPST_small SW101
U 1 1 55A7F874
P 9375 2600
F 0 "SW101" H 9375 2700 50  0000 C CNN
F 1 "KEYSWITCH" H 9375 2800 50  0000 C CNN
F 2 "" H 9375 2600 60  0000 C CNN
F 3 "" H 9375 2600 60  0000 C CNN
	1    9375 2600
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P101
U 1 1 55A7FC01
P 9875 2650
F 0 "P101" H 9850 2800 50  0000 C CNN
F 1 "KEYSW" H 9825 2500 50  0000 C CNN
F 2 "" H 9875 2650 60  0000 C CNN
F 3 "" H 9875 2650 60  0000 C CNN
F 4 "1830726" H 9875 2650 60  0001 C CNN "Farnell"
	1    9875 2650
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 P102
U 1 1 55A7FE33
P 10025 2650
F 0 "P102" H 10000 2800 50  0000 C CNN
F 1 "KEYSW" H 9975 2500 50  0000 C CNN
F 2 "common:JST-PA-2" H 10025 2650 60  0001 C CNN
F 3 "" H 10025 2650 60  0000 C CNN
F 4 "1830747" H 10025 2650 60  0001 C CNN "Farnell"
	1    10025 2650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR030
U 1 1 55A805A4
P 10275 2750
F 0 "#PWR030" H 10275 2500 50  0001 C CNN
F 1 "GND" H 10275 2600 50  0000 C CNN
F 2 "" H 10275 2750 60  0000 C CNN
F 3 "" H 10275 2750 60  0000 C CNN
	1    10275 2750
	1    0    0    -1  
$EndComp
$Comp
L R R101
U 1 1 55A80750
P 10325 2400
F 0 "R101" V 10405 2400 50  0000 C CNN
F 1 "10k" V 10325 2400 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 10255 2400 30  0001 C CNN
F 3 "" H 10325 2400 30  0000 C CNN
F 4 "2331808" H 10325 2400 60  0001 C CNN "Farnell"
	1    10325 2400
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR031
U 1 1 55A80891
P 10325 2200
F 0 "#PWR031" H 10325 2050 50  0001 C CNN
F 1 "+3.3V" H 10325 2340 50  0000 C CNN
F 2 "" H 10325 2200 60  0000 C CNN
F 3 "" H 10325 2200 60  0000 C CNN
	1    10325 2200
	1    0    0    -1  
$EndComp
Text Label 10475 2600 0    60   ~ 0
ARM_SW
$Comp
L CONN_01X02 P105
U 1 1 55A9232C
P 4550 1700
F 0 "P105" H 4500 1850 50  0000 C CNN
F 1 "BATT" H 4500 1550 50  0000 C CNN
F 2 "common:JST-PA-2" H 4550 1700 60  0001 C CNN
F 3 "" H 4550 1700 60  0000 C CNN
F 4 "1830747" H 4550 1700 60  0001 C CNN "Farnell"
	1    4550 1700
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P104
U 1 1 55A92786
P 4400 1700
F 0 "P104" H 4350 1850 50  0000 C CNN
F 1 "BATT" H 4350 1550 50  0000 C CNN
F 2 "" H 4400 1700 60  0000 C CNN
F 3 "" H 4400 1700 60  0000 C CNN
F 4 "1830726" H 4400 1700 60  0001 C CNN "Farnell"
	1    4400 1700
	1    0    0    1   
$EndComp
$Comp
L SPST_small SW102
U 1 1 55A87CDE
P 5050 975
F 0 "SW102" H 5050 1075 50  0000 C CNN
F 1 "LATCHING PUSH" H 5050 1150 50  0000 C CNN
F 2 "" H 5050 975 60  0000 C CNN
F 3 "" H 5050 975 60  0000 C CNN
F 4 "SW02719" H 5050 975 60  0001 C CNN "Farnell"
	1    5050 975 
	1    0    0    -1  
$EndComp
Text Label 1325 1250 2    60   ~ 0
ARM_LED
Text Label 1325 1350 2    60   ~ 0
DISARM_LED
$Comp
L R R103
U 1 1 55A89898
P 1475 1250
F 0 "R103" V 1400 1250 50  0000 C CNN
F 1 "75R" V 1475 1250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 1405 1250 30  0001 C CNN
F 3 "http://www.farnell.com/datasheets/1755795.pdf" H 1475 1250 30  0001 C CNN
F 4 "2331781" H 1475 1250 60  0001 C CNN "Farnell"
	1    1475 1250
	0    1    1    0   
$EndComp
Text Label 3050 5575 0    60   ~ 0
ARM_SW
Text Label 3050 5475 0    60   ~ 0
DISARM_LED
Text Label 3050 5375 0    60   ~ 0
ARM_LED
$Comp
L PART U104
U 1 1 55A91744
P 2375 1600
F 0 "U104" H 2475 1600 60  0000 C CNN
F 1 "BEZEL" H 2475 1700 60  0000 C CNN
F 2 "" H 2375 1600 60  0000 C CNN
F 3 "" H 2375 1600 60  0000 C CNN
F 4 "SC11628" H 2375 1600 60  0001 C CNN "Farnell"
	1    2375 1600
	1    0    0    -1  
$EndComp
Text Notes 825  1075 0    60   ~ 0
RED: 1.8V 20mA
Text Notes 775  1500 0    60   ~ 0
GREEN: 2.1V 20mA
$Comp
L +5V #PWR032
U 1 1 55AC453D
P 7150 3550
F 0 "#PWR032" H 7150 3400 50  0001 C CNN
F 1 "+5V" H 7150 3690 50  0000 C CNN
F 2 "" H 7150 3550 60  0000 C CNN
F 3 "" H 7150 3550 60  0000 C CNN
	1    7150 3550
	1    0    0    -1  
$EndComp
$Comp
L MEJ2S0305SC U103
U 1 1 55ACC85A
P 3700 6950
F 0 "U103" H 3700 6600 60  0000 C CNN
F 1 "MEJ2S0305SC" H 3750 6900 60  0000 C CNN
F 2 "control:MEJ2S0305SC" H 3700 6950 60  0001 C CNN
F 3 "" H 3700 6950 60  0000 C CNN
F 4 "2429476" H 3700 6950 60  0001 C CNN "Farnell"
	1    3700 6950
	1    0    0    -1  
$EndComp
$Comp
L R R107
U 1 1 55B7F40D
P 9250 3900
F 0 "R107" V 9300 4100 50  0000 C CNN
F 1 "10k" V 9250 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9180 3900 30  0001 C CNN
F 3 "" H 9250 3900 30  0000 C CNN
F 4 "2331808" H 9250 3900 60  0001 C CNN "Farnell"
	1    9250 3900
	1    0    0    -1  
$EndComp
$Comp
L R R108
U 1 1 55B7F4BC
P 9350 3900
F 0 "R108" V 9400 4100 50  0000 C CNN
F 1 "10k" V 9350 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9280 3900 30  0001 C CNN
F 3 "" H 9350 3900 30  0000 C CNN
F 4 "2331808" H 9350 3900 60  0001 C CNN "Farnell"
	1    9350 3900
	1    0    0    -1  
$EndComp
$Comp
L R R109
U 1 1 55B7F8B9
P 9450 3900
F 0 "R109" V 9500 4100 50  0000 C CNN
F 1 "10k" V 9450 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9380 3900 30  0001 C CNN
F 3 "" H 9450 3900 30  0000 C CNN
F 4 "2331808" H 9450 3900 60  0001 C CNN "Farnell"
	1    9450 3900
	1    0    0    -1  
$EndComp
$Comp
L R R110
U 1 1 55B7FA3B
P 9550 3900
F 0 "R110" V 9600 4100 50  0000 C CNN
F 1 "10k" V 9550 3900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805" V 9480 3900 30  0001 C CNN
F 3 "" H 9550 3900 30  0000 C CNN
F 4 "2331808" H 9550 3900 60  0001 C CNN "Farnell"
	1    9550 3900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 55B80248
P 9400 4150
F 0 "#PWR033" H 9400 3900 50  0001 C CNN
F 1 "GND" H 9400 4000 50  0000 C CNN
F 2 "" H 9400 4150 60  0000 C CNN
F 3 "" H 9400 4150 60  0000 C CNN
	1    9400 4150
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P106
U 1 1 55B8D10C
P 1925 1300
F 0 "P106" H 1875 1450 50  0000 C CNN
F 1 "ARM_LED" H 1825 1150 50  0000 C CNN
F 2 "common:JST-PA-2" H 1925 1300 60  0001 C CNN
F 3 "" H 1925 1300 60  0000 C CNN
F 4 "1830747" H 1925 1300 60  0001 C CNN "Farnell"
	1    1925 1300
	1    0    0    1   
$EndComp
$Comp
L CONN_01X02 P107
U 1 1 55B8D25C
P 2075 1300
F 0 "P107" H 2025 1450 50  0000 C CNN
F 1 "ARM_LED" H 1975 1150 50  0000 C CNN
F 2 "" H 2075 1300 60  0000 C CNN
F 3 "" H 2075 1300 60  0000 C CNN
F 4 "1830726" H 2075 1300 60  0001 C CNN "Farnell"
	1    2075 1300
	-1   0    0    1   
$EndComp
$Comp
L LED_bicolour D102
U 1 1 55B92133
P 2525 1250
F 0 "D102" H 2425 1500 50  0000 L CNN
F 1 "RED/GREEN" H 2325 1400 50  0000 L CNN
F 2 "" V 2525 1310 60  0000 C CNN
F 3 "http://www.farnell.com/datasheets/482362.pdf" V 2525 1310 60  0001 C CNN
F 4 "1581207" H 2525 1250 60  0001 C CNN "Farnell"
	1    2525 1250
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P110
U 1 1 55BA2CE0
P 5025 1400
F 0 "P110" H 4975 1550 50  0000 C CNN
F 1 "POWER_SW" V 5025 1075 50  0000 C CNN
F 2 "common:JST-PA-2" H 5025 1400 60  0001 C CNN
F 3 "" H 5025 1400 60  0000 C CNN
F 4 "1830747" H 5025 1400 60  0001 C CNN "Farnell"
	1    5025 1400
	0    -1   -1   0   
$EndComp
$Comp
L CONN_01X02 P109
U 1 1 55BA6805
P 5025 1275
F 0 "P109" H 4975 1425 50  0000 C CNN
F 1 "POWER_SW" V 5025 950 50  0000 C CNN
F 2 "" H 5025 1275 60  0000 C CNN
F 3 "" H 5025 1275 60  0000 C CNN
F 4 "1830726" H 5025 1275 60  0001 C CNN "Farnell"
	1    5025 1275
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR034
U 1 1 55BA3B3F
P 4775 4225
F 0 "#PWR034" H 4775 3975 50  0001 C CNN
F 1 "GND" H 4775 4075 50  0000 C CNN
F 2 "" H 4775 4225 60  0000 C CNN
F 3 "" H 4775 4225 60  0000 C CNN
	1    4775 4225
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR035
U 1 1 55BA4EAC
P 4300 4975
F 0 "#PWR035" H 4300 4725 50  0001 C CNN
F 1 "GND" H 4300 4825 50  0000 C CNN
F 2 "" H 4300 4975 60  0000 C CNN
F 3 "" H 4300 4975 60  0000 C CNN
	1    4300 4975
	1    0    0    -1  
$EndComp
$Comp
L TVS_small D104
U 1 1 55BA725B
P 3975 4975
F 0 "D104" H 3975 5025 50  0000 C CNN
F 1 "TVS_small" H 3975 4900 50  0001 C CNN
F 2 "Resistors_SMD:R_0603" H 3975 4975 60  0001 C CNN
F 3 "" H 3975 4975 60  0000 C CNN
F 4 "2368174" H 3975 4975 60  0001 C CNN "Farnell"
	1    3975 4975
	0    1    1    0   
$EndComp
$Comp
L CONN_01X04 P111
U 1 1 55BAAE05
P 4550 4775
F 0 "P111" H 4500 5025 50  0000 C CNN
F 1 "SERIAL" H 4550 4525 50  0000 C CNN
F 2 "common:JST-PA-4" H 4550 4775 60  0001 C CNN
F 3 "" H 4550 4775 60  0000 C CNN
F 4 "1830749" H 4550 4775 60  0001 C CNN "Farnell"
	1    4550 4775
	1    0    0    1   
$EndComp
Wire Wire Line
	9500 1550 9500 1600
Wire Wire Line
	8500 1000 8500 1150
Connection ~ 8500 1000
Wire Wire Line
	8500 1450 8500 1500
Wire Wire Line
	10250 1400 10250 1450
Wire Wire Line
	9950 950  10650 950 
Wire Wire Line
	10250 950  10250 1100
Connection ~ 10250 950 
Wire Wire Line
	4875 1750 6875 1750
Wire Wire Line
	5725 1600 5725 1650
Connection ~ 5725 1650
Wire Wire Line
	5725 1800 5725 1750
Connection ~ 5725 1750
Wire Wire Line
	6875 1650 6875 1600
Wire Wire Line
	6875 1750 6875 1800
Wire Wire Line
	6950 5350 7500 5350
Wire Wire Line
	7450 5350 7450 5450
Wire Wire Line
	7450 5450 7500 5450
Connection ~ 7450 5350
Wire Wire Line
	7500 5250 7400 5250
Wire Wire Line
	7400 5250 7400 5350
Connection ~ 7400 5350
Wire Wire Line
	7250 4900 7250 5000
Wire Wire Line
	6950 4950 7450 4950
Wire Wire Line
	7450 4950 7450 5150
Wire Wire Line
	7450 5150 7500 5150
Connection ~ 7250 4950
Wire Wire Line
	7250 5300 7250 5350
Connection ~ 7250 5350
Wire Wire Line
	8700 6050 9050 6050
Wire Wire Line
	1700 4025 1600 4025
Wire Wire Line
	1600 4025 1600 4425
Wire Wire Line
	1600 4125 1700 4125
Wire Wire Line
	1600 4225 1700 4225
Connection ~ 1600 4125
Wire Wire Line
	1600 4425 1700 4425
Connection ~ 1600 4225
Wire Wire Line
	800  4175 1600 4175
Wire Wire Line
	1200 4175 1200 4275
Connection ~ 1600 4175
Wire Wire Line
	3650 3025 3650 3075
Connection ~ 3650 3025
Wire Wire Line
	3050 3375 3650 3375
Wire Wire Line
	3600 3375 3600 3425
Wire Wire Line
	3400 3025 3800 3025
Wire Wire Line
	3400 3275 3050 3275
Wire Wire Line
	3050 3975 3950 3975
Wire Wire Line
	3950 3975 3950 3875
Wire Wire Line
	3950 4075 3950 4175
Connection ~ 4150 4175
Connection ~ 4150 3875
Wire Wire Line
	925  6750 925  6800
Wire Wire Line
	925  6800 975  6800
Wire Wire Line
	975  6900 875  6900
Wire Wire Line
	875  6900 875  7250
Wire Wire Line
	875  7200 975  7200
Connection ~ 875  7200
Wire Wire Line
	975  7000 875  7000
Connection ~ 875  7000
Wire Wire Line
	7125 1650 7125 1700
Wire Wire Line
	7125 2400 7125 2450
Wire Wire Line
	7125 2000 7125 2100
Wire Wire Line
	7125 2050 7275 2050
Connection ~ 7125 2050
Wire Wire Line
	7600 3350 7500 3350
Wire Wire Line
	6800 3550 6800 3600
Wire Wire Line
	6800 4150 6800 4100
Wire Wire Line
	6950 3850 7600 3850
Wire Wire Line
	7150 3550 7600 3550
Wire Wire Line
	7150 3650 7600 3650
Wire Wire Line
	7500 3250 7600 3250
Wire Wire Line
	7100 4150 7600 4150
Wire Wire Line
	3400 3025 3400 3275
Connection ~ 3600 3375
Wire Wire Line
	4750 1650 4750 1600
Wire Wire Line
	4750 1600 4975 1600
Wire Wire Line
	4800 1600 4800 1600
Wire Wire Line
	5525 1600 5525 1650
Connection ~ 4800 1600
Wire Wire Line
	4750 1750 4750 1800
Wire Wire Line
	4750 1800 4875 1800
Wire Wire Line
	4800 1800 4800 1800
Connection ~ 4800 1800
Connection ~ 7125 1650
Wire Wire Line
	8800 6050 8800 6075
Connection ~ 8800 6050
Wire Wire Line
	3150 4275 3050 4275
Wire Wire Line
	3050 4375 3150 4375
Connection ~ 10425 950 
Connection ~ 3500 3025
Wire Wire Line
	3050 4075 3550 4075
Wire Wire Line
	3850 4075 3950 4075
Connection ~ 1200 4175
Wire Wire Line
	800  3325 900  3325
Wire Wire Line
	800  2725 800  4175
Wire Wire Line
	900  3925 800  3925
Connection ~ 800  3925
Wire Wire Line
	800  3725 900  3725
Connection ~ 800  3725
Wire Wire Line
	900  3525 800  3525
Connection ~ 800  3525
Wire Wire Line
	800  3125 900  3125
Connection ~ 800  3325
Wire Wire Line
	800  2925 900  2925
Connection ~ 800  3125
Wire Wire Line
	800  2725 900  2725
Connection ~ 800  2925
Wire Wire Line
	1200 2575 1200 3925
Wire Wire Line
	1200 3825 1700 3825
Connection ~ 1200 3825
Connection ~ 1200 3525
Connection ~ 1200 3725
Wire Wire Line
	1200 3425 1300 3425
Wire Wire Line
	1300 3425 1300 3725
Wire Wire Line
	1300 3725 1700 3725
Connection ~ 1200 3425
Connection ~ 1200 3325
Connection ~ 1200 3125
Connection ~ 1200 2925
Wire Wire Line
	1200 3025 1450 3025
Wire Wire Line
	1450 3025 1450 3525
Wire Wire Line
	1450 3525 1700 3525
Connection ~ 1200 3025
Wire Wire Line
	1200 2825 1550 2825
Wire Wire Line
	1550 2825 1550 3425
Wire Wire Line
	1550 3425 1700 3425
Connection ~ 1200 2825
Connection ~ 1200 2725
Wire Wire Line
	1200 2625 1700 2625
Wire Wire Line
	1700 2625 1700 3225
Connection ~ 1200 2625
Wire Wire Line
	6950 5000 6950 4950
Wire Wire Line
	6950 5300 6950 5350
Connection ~ 7200 5350
Wire Wire Line
	8900 950  8900 1050
Wire Wire Line
	8900 950  8950 950 
Wire Wire Line
	8900 1050 8950 1050
Connection ~ 8900 1000
Wire Wire Line
	10050 1050 9950 1050
Connection ~ 10050 950 
Wire Wire Line
	9950 850  10000 850 
Wire Wire Line
	10000 850  10000 950 
Connection ~ 10000 950 
Wire Wire Line
	10050 950  10050 1050
Wire Wire Line
	8800 1000 8800 1550
Wire Wire Line
	8800 1550 9400 1550
Connection ~ 8800 1000
Wire Wire Line
	9000 6200 9050 6200
Wire Wire Line
	9000 6150 9000 6300
Wire Wire Line
	9000 6150 9050 6150
Connection ~ 9000 6200
Wire Wire Line
	9000 5850 9000 5950
Wire Wire Line
	9000 5900 9050 5900
Wire Wire Line
	9000 5950 9050 5950
Connection ~ 9000 5900
Wire Wire Line
	8800 6275 9000 6275
Connection ~ 9000 6275
Wire Wire Line
	3150 7050 3150 7100
Wire Wire Line
	3150 7100 3200 7100
Wire Wire Line
	3150 7250 3150 7200
Wire Wire Line
	3150 7200 3200 7200
Wire Wire Line
	4350 7050 4350 7100
Wire Wire Line
	4350 7100 4300 7100
Wire Wire Line
	4350 7250 4350 7200
Wire Wire Line
	4350 7200 4300 7200
Wire Wire Line
	3950 1850 3950 1950
Wire Wire Line
	4050 1550 4050 1950
Connection ~ 4050 1550
Connection ~ 3950 1850
Wire Wire Line
	5525 1650 5875 1650
Wire Wire Line
	6375 1650 7125 1650
Connection ~ 6875 1650
Wire Wire Line
	8300 900  8300 1000
Wire Wire Line
	8300 1000 8900 1000
Wire Wire Line
	9175 2600 9175 2700
Wire Wire Line
	9175 2700 9675 2700
Wire Wire Line
	9525 2600 9675 2600
Wire Wire Line
	10225 2700 10275 2700
Wire Wire Line
	10275 2700 10275 2750
Wire Wire Line
	10325 2200 10325 2250
Wire Wire Line
	10225 2600 10475 2600
Wire Wire Line
	10325 2600 10325 2550
Connection ~ 10325 2600
Wire Wire Line
	3800 1550 4200 1550
Wire Wire Line
	10650 950  10650 850 
Wire Wire Line
	1325 1350 1725 1350
Wire Wire Line
	2275 1250 2375 1250
Wire Wire Line
	1625 1250 1725 1250
Wire Wire Line
	8750 3700 9250 3700
Wire Wire Line
	9250 3700 9250 3750
Wire Wire Line
	8750 3600 9350 3600
Wire Wire Line
	9350 3600 9350 3750
Wire Wire Line
	8750 3500 9450 3500
Wire Wire Line
	9450 3500 9450 3750
Wire Wire Line
	8750 3400 9550 3400
Wire Wire Line
	9550 3400 9550 3750
Wire Wire Line
	9350 4050 9350 4150
Wire Wire Line
	9250 4150 9550 4150
Wire Wire Line
	9450 4150 9450 4050
Connection ~ 9400 4150
Wire Wire Line
	9250 4050 9250 4150
Connection ~ 9350 4150
Wire Wire Line
	9550 4150 9550 4050
Connection ~ 9450 4150
Wire Wire Line
	2275 1350 2325 1350
Wire Wire Line
	2325 1350 2325 1400
Wire Wire Line
	2325 1400 2675 1400
Wire Wire Line
	2675 1400 2675 1250
Wire Wire Line
	3800 1850 4200 1850
Wire Wire Line
	4200 1550 4200 1650
Wire Wire Line
	4200 1850 4200 1750
Wire Wire Line
	4850 975  4850 1075
Wire Wire Line
	4850 1075 4975 1075
Wire Wire Line
	5200 975  5200 1075
Wire Wire Line
	5200 1075 5075 1075
Wire Wire Line
	4875 1800 4875 1750
Wire Wire Line
	5525 1600 5075 1600
Wire Wire Line
	3950 3875 4375 3875
Wire Wire Line
	3950 4175 4375 4175
Wire Wire Line
	4675 4175 4775 4175
Wire Wire Line
	4775 3875 4775 4225
Wire Wire Line
	4675 3875 4775 3875
Connection ~ 4775 4175
Wire Wire Line
	3050 4575 3975 4575
$Comp
L +3V3 #PWR036
U 1 1 55BB5B12
P 4100 4575
F 0 "#PWR036" H 4100 4425 50  0001 C CNN
F 1 "+3V3" H 4100 4715 50  0000 C CNN
F 2 "" H 4100 4575 60  0000 C CNN
F 3 "" H 4100 4575 60  0000 C CNN
	1    4100 4575
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4575 4100 4625
Wire Wire Line
	4100 4625 4350 4625
Wire Wire Line
	4350 4925 4300 4925
Wire Wire Line
	4300 4925 4300 4975
Wire Wire Line
	3975 4725 4350 4725
Wire Wire Line
	3825 4825 4350 4825
Wire Wire Line
	3975 4575 3975 4875
Wire Wire Line
	3825 4675 3825 4875
Wire Wire Line
	3825 4675 3050 4675
$Comp
L TVS_small D106
U 1 1 55BBCEE6
P 4125 4975
F 0 "D106" H 4125 5050 50  0000 C CNN
F 1 "TVS_small" H 4125 4900 50  0001 C CNN
F 2 "Resistors_SMD:R_0603" H 4125 4975 60  0001 C CNN
F 3 "" H 4125 4975 60  0000 C CNN
F 4 "2368174" H 4125 4975 60  0001 C CNN "Farnell"
	1    4125 4975
	0    1    1    0   
$EndComp
$Comp
L TVS_small D105
U 1 1 55BBDFDA
P 3825 4975
F 0 "D105" H 3825 5025 50  0000 C CNN
F 1 "TVS_small" H 3825 4900 50  0001 C CNN
F 2 "Resistors_SMD:R_0603" H 3825 4975 60  0001 C CNN
F 3 "" H 3825 4975 60  0000 C CNN
F 4 "2368174" H 3825 4975 60  0001 C CNN "Farnell"
	1    3825 4975
	0    1    1    0   
$EndComp
Wire Wire Line
	4125 4625 4125 4875
Connection ~ 4125 4625
Connection ~ 3975 4725
Connection ~ 3825 4825
$Comp
L GND #PWR037
U 1 1 55BBFDE6
P 3975 5150
F 0 "#PWR037" H 3975 4900 50  0001 C CNN
F 1 "GND" H 3975 5000 50  0000 C CNN
F 2 "" H 3975 5150 60  0000 C CNN
F 3 "" H 3975 5150 60  0000 C CNN
	1    3975 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3975 5075 3975 5150
Wire Wire Line
	3975 5125 3825 5125
Wire Wire Line
	3825 5125 3825 5075
Connection ~ 3975 5125
Wire Wire Line
	3975 5100 4125 5100
Wire Wire Line
	4125 5100 4125 5075
Connection ~ 3975 5100
NoConn ~ 3050 5675
NoConn ~ 3050 5775
$EndSCHEMATC
