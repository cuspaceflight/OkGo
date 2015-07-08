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
LIBS:control-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L CONN_01X02 P101
U 1 1 556213DD
P 6000 1150
F 0 "P101" H 6000 1300 50  0000 C CNN
F 1 "BATT_IN" V 6100 1150 50  0000 C CNN
F 2 "" H 6000 1150 60  0000 C CNN
F 3 "" H 6000 1150 60  0000 C CNN
	1    6000 1150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR104
U 1 1 556214DE
P 7050 1250
F 0 "#PWR104" H 7050 1000 50  0001 C CNN
F 1 "GND" H 7050 1100 50  0000 C CNN
F 2 "" H 7050 1250 60  0000 C CNN
F 3 "" H 7050 1250 60  0000 C CNN
	1    7050 1250
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR103
U 1 1 556214F3
P 7050 1050
F 0 "#PWR103" H 7050 900 50  0001 C CNN
F 1 "+BATT" H 7050 1190 50  0000 C CNN
F 2 "" H 7050 1050 60  0000 C CNN
F 3 "" H 7050 1050 60  0000 C CNN
	1    7050 1050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR108
U 1 1 556215CB
P 9100 1700
F 0 "#PWR108" H 9100 1450 50  0001 C CNN
F 1 "GND" H 9100 1550 50  0000 C CNN
F 2 "" H 9100 1700 60  0000 C CNN
F 3 "" H 9100 1700 60  0000 C CNN
	1    9100 1700
	1    0    0    -1  
$EndComp
$Comp
L C C102
U 1 1 556215E1
P 8100 1400
F 0 "C102" H 8125 1500 50  0000 L CNN
F 1 "2u2" H 8125 1300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 8138 1250 30  0001 C CNN
F 3 "" H 8100 1400 60  0000 C CNN
F 4 "2362106" H 8100 1400 60  0001 C CNN "Farnell"
	1    8100 1400
	1    0    0    -1  
$EndComp
$Comp
L C C101
U 1 1 55621639
P 9850 1350
F 0 "C101" H 9875 1450 50  0000 L CNN
F 1 "2u2" H 9875 1250 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 9888 1200 30  0001 C CNN
F 3 "" H 9850 1350 60  0000 C CNN
F 4 "2362106" H 9850 1350 60  0001 C CNN "Farnell"
	1    9850 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR107
U 1 1 556216C5
P 8100 1600
F 0 "#PWR107" H 8100 1350 50  0001 C CNN
F 1 "GND" H 8100 1450 50  0000 C CNN
F 2 "" H 8100 1600 60  0000 C CNN
F 3 "" H 8100 1600 60  0000 C CNN
	1    8100 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR106
U 1 1 556216DE
P 9850 1550
F 0 "#PWR106" H 9850 1300 50  0001 C CNN
F 1 "GND" H 9850 1400 50  0000 C CNN
F 2 "" H 9850 1550 60  0000 C CNN
F 3 "" H 9850 1550 60  0000 C CNN
	1    9850 1550
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG101
U 1 1 556217FC
P 6500 1050
F 0 "#FLG101" H 6500 1145 50  0001 C CNN
F 1 "PWR_FLAG" H 6500 1230 50  0000 C CNN
F 2 "" H 6500 1050 60  0000 C CNN
F 3 "" H 6500 1050 60  0000 C CNN
	1    6500 1050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG102
U 1 1 55621881
P 6500 1250
F 0 "#FLG102" H 6500 1345 50  0001 C CNN
F 1 "PWR_FLAG" H 6500 1430 50  0000 C CNN
F 2 "" H 6500 1250 60  0000 C CNN
F 3 "" H 6500 1250 60  0000 C CNN
	1    6500 1250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR119
U 1 1 556220CD
P 10350 3200
F 0 "#PWR119" H 10350 2950 50  0001 C CNN
F 1 "GND" H 10350 3050 50  0000 C CNN
F 2 "" H 10350 3200 60  0000 C CNN
F 3 "" H 10350 3200 60  0000 C CNN
	1    10350 3200
	-1   0    0    -1  
$EndComp
$Comp
L R R104
U 1 1 556229F5
P 10300 2750
F 0 "R104" V 10380 2750 50  0000 C CNN
F 1 "10k" V 10300 2750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10230 2750 30  0001 C CNN
F 3 "" H 10300 2750 30  0000 C CNN
F 4 "2331808" H 10300 2750 60  0001 C CNN "Farnell"
	1    10300 2750
	0    1    -1   0   
$EndComp
$Comp
L CONN_01X02 P105
U 1 1 55628399
P 8700 5950
F 0 "P105" H 8700 6100 50  0000 C CNN
F 1 "ANT" V 8800 5950 50  0000 C CNN
F 2 "" H 8700 5950 60  0000 C CNN
F 3 "" H 8700 5950 60  0000 C CNN
	1    8700 5950
	1    0    0    1   
$EndComp
$Comp
L GND #PWR131
U 1 1 55629E65
P 8450 6175
F 0 "#PWR131" H 8450 5925 50  0001 C CNN
F 1 "GND" H 8450 6025 50  0000 C CNN
F 2 "" H 8450 6175 60  0000 C CNN
F 3 "" H 8450 6175 60  0000 C CNN
	1    8450 6175
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR128
U 1 1 5562B214
P 6750 5200
F 0 "#PWR128" H 6750 4950 50  0001 C CNN
F 1 "GND" H 6750 5050 50  0000 C CNN
F 2 "" H 6750 5200 60  0000 C CNN
F 3 "" H 6750 5200 60  0000 C CNN
	1    6750 5200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR127
U 1 1 5562B35A
P 6800 4750
F 0 "#PWR127" H 6800 4600 50  0001 C CNN
F 1 "+3V3" H 6800 4890 50  0000 C CNN
F 2 "" H 6800 4750 60  0000 C CNN
F 3 "" H 6800 4750 60  0000 C CNN
	1    6800 4750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR102
U 1 1 55624CAA
P 10450 950
F 0 "#PWR102" H 10450 800 50  0001 C CNN
F 1 "+3V3" H 10450 1090 50  0000 C CNN
F 2 "" H 10450 950 60  0000 C CNN
F 3 "" H 10450 950 60  0000 C CNN
	1    10450 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR112
U 1 1 55624E6E
P 10100 2700
F 0 "#PWR112" H 10100 2550 50  0001 C CNN
F 1 "+3V3" H 10100 2840 50  0000 C CNN
F 2 "" H 10100 2700 60  0000 C CNN
F 3 "" H 10100 2700 60  0000 C CNN
	1    10100 2700
	-1   0    0    -1  
$EndComp
$Comp
L +3V3 #PWR110
U 1 1 5562C6B7
P 1150 1950
F 0 "#PWR110" H 1150 1800 50  0001 C CNN
F 1 "+3V3" H 1150 2090 50  0000 C CNN
F 2 "" H 1150 1950 60  0000 C CNN
F 3 "" H 1150 1950 60  0000 C CNN
	1    1150 1950
	1    0    0    -1  
$EndComp
$Comp
L C C110
U 1 1 5562D332
P 1000 3300
F 0 "C110" V 1050 3350 50  0000 L CNN
F 1 "1u" V 1050 3150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 3150 30  0001 C CNN
F 3 "" H 1000 3300 60  0000 C CNN
F 4 "9227792" H 1000 3300 60  0001 C CNN "Farnell"
	1    1000 3300
	0    1    1    0   
$EndComp
$Comp
L C C109
U 1 1 5562D381
P 1000 3100
F 0 "C109" V 1050 3150 50  0000 L CNN
F 1 "10n" V 1050 2900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2950 30  0001 C CNN
F 3 "" H 1000 3100 60  0000 C CNN
F 4 "2407341" H 1000 3100 60  0001 C CNN "Farnell"
	1    1000 3100
	0    1    1    0   
$EndComp
$Comp
L C C108
U 1 1 5562D3B3
P 1000 2900
F 0 "C108" V 1050 2950 50  0000 L CNN
F 1 "4u7" V 1050 2700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2750 30  0001 C CNN
F 3 "" H 1000 2900 60  0000 C CNN
F 4 "1845742" H 1000 2900 60  0001 C CNN "Farnell"
	1    1000 2900
	0    1    1    0   
$EndComp
$Comp
L GND #PWR120
U 1 1 5562DCAE
P 1150 3650
F 0 "#PWR120" H 1150 3400 50  0001 C CNN
F 1 "GND" H 1150 3500 50  0000 C CNN
F 2 "" H 1150 3650 60  0000 C CNN
F 3 "" H 1150 3650 60  0000 C CNN
	1    1150 3650
	1    0    0    -1  
$EndComp
$Comp
L C C107
U 1 1 5562E486
P 3600 2700
F 0 "C107" H 3625 2800 50  0000 L CNN
F 1 "100n" H 3625 2600 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 3638 2550 30  0001 C CNN
F 3 "" H 3600 2700 60  0000 C CNN
F 4 "2407344" H 3600 2700 60  0001 C CNN "Farnell"
	1    3600 2700
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR115
U 1 1 5562E73A
P 3550 2900
F 0 "#PWR115" H 3550 2650 50  0001 C CNN
F 1 "GND" H 3550 2750 50  0000 C CNN
F 2 "" H 3550 2900 60  0000 C CNN
F 3 "" H 3550 2900 60  0000 C CNN
	1    3550 2900
	-1   0    0    -1  
$EndComp
$Comp
L Crystal Y101
U 1 1 55631E06
P 4100 3400
F 0 "Y101" H 4100 3550 50  0000 C CNN
F 1 "8MHz" H 4100 3250 50  0000 C CNN
F 2 "" H 4100 3400 60  0000 C CNN
F 3 "" H 4100 3400 60  0000 C CNN
F 4 "2101329" H 4100 3400 60  0001 C CNN "Farnell"
	1    4100 3400
	0    -1   1    0   
$EndComp
$Comp
L R R105
U 1 1 5563219C
P 3650 3450
F 0 "R105" V 3750 3550 50  0000 C CNN
F 1 "100R" V 3750 3300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 3580 3450 30  0001 C CNN
F 3 "" H 3650 3450 30  0000 C CNN
F 4 "2331783" H 3650 3450 60  0001 C CNN "Farnell"
	1    3650 3450
	0    -1   1    0   
$EndComp
$Comp
L C C111
U 1 1 5563246F
P 4350 3750
F 0 "C111" H 4375 3850 50  0000 L CNN
F 1 "15p" H 4375 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4388 3600 30  0001 C CNN
F 3 "" H 4350 3750 60  0000 C CNN
F 4 "1414668" H 4350 3750 60  0001 C CNN "Farnell"
	1    4350 3750
	-1   0    0    -1  
$EndComp
$Comp
L C C112
U 1 1 55632519
P 4550 3750
F 0 "C112" H 4575 3850 50  0000 L CNN
F 1 "15p" H 4575 3650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4588 3600 30  0001 C CNN
F 3 "" H 4550 3750 60  0000 C CNN
F 4 "1414668" H 4550 3750 60  0001 C CNN "Farnell"
	1    4550 3750
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR124
U 1 1 5563278B
P 4450 3950
F 0 "#PWR124" H 4450 3700 50  0001 C CNN
F 1 "GND" H 4450 3800 50  0000 C CNN
F 2 "" H 4450 3950 60  0000 C CNN
F 3 "" H 4450 3950 60  0000 C CNN
	1    4450 3950
	-1   0    0    -1  
$EndComp
$Comp
L LED D102
U 1 1 55645DBD
P 10450 1350
F 0 "D102" H 10450 1450 50  0000 C CNN
F 1 "POWER" H 10500 1250 50  0000 C CNN
F 2 "" H 10450 1350 60  0000 C CNN
F 3 "" H 10450 1350 60  0000 C CNN
	1    10450 1350
	0    -1   -1   0   
$EndComp
$Comp
L R R103
U 1 1 55646094
P 10450 1750
F 0 "R103" V 10530 1750 50  0000 C CNN
F 1 "R" V 10450 1750 50  0000 C CNN
F 2 "" V 10380 1750 30  0000 C CNN
F 3 "" H 10450 1750 30  0000 C CNN
	1    10450 1750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR111
U 1 1 556462D7
P 10450 1950
F 0 "#PWR111" H 10450 1700 50  0001 C CNN
F 1 "GND" H 10450 1800 50  0000 C CNN
F 2 "" H 10450 1950 60  0000 C CNN
F 3 "" H 10450 1950 60  0000 C CNN
	1    10450 1950
	1    0    0    -1  
$EndComp
$Comp
L SWD U102
U 1 1 55647D4E
P 4400 1200
F 0 "U102" V 4400 1200 60  0000 C CNN
F 1 "SWD" V 4300 1200 60  0000 C CNN
F 2 "common:FTSH-105-01-F-D-K" H 4300 1500 60  0001 C CNN
F 3 "" H 4300 1500 60  0000 C CNN
	1    4400 1200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR101
U 1 1 556484DA
P 3750 950
F 0 "#PWR101" H 3750 800 50  0001 C CNN
F 1 "+3V3" H 3750 1090 50  0000 C CNN
F 2 "" H 3750 950 60  0000 C CNN
F 3 "" H 3750 950 60  0000 C CNN
	1    3750 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR105
U 1 1 5564860C
P 3700 1450
F 0 "#PWR105" H 3700 1200 50  0001 C CNN
F 1 "GND" H 3700 1300 50  0000 C CNN
F 2 "" H 3700 1450 60  0000 C CNN
F 3 "" H 3700 1450 60  0000 C CNN
	1    3700 1450
	1    0    0    -1  
$EndComp
NoConn ~ 5000 1200
NoConn ~ 5000 1300
$Comp
L C C105
U 1 1 5564FCE8
P 1000 2500
F 0 "C105" V 1050 2550 50  0000 L CNN
F 1 "4u7" V 1050 2300 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2350 30  0001 C CNN
F 3 "" H 1000 2500 60  0000 C CNN
F 4 "1845742" H 1000 2500 60  0001 C CNN "Farnell"
	1    1000 2500
	0    1    1    0   
$EndComp
$Comp
L R R101
U 1 1 5565208A
P 7300 1300
F 0 "R101" V 7380 1300 50  0000 C CNN
F 1 "3k3" V 7200 1300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7230 1300 30  0001 C CNN
F 3 "" H 7300 1300 30  0000 C CNN
F 4 "9237682" H 7300 1300 60  0001 C CNN "Farnell"
	1    7300 1300
	1    0    0    -1  
$EndComp
$Comp
L R R102
U 1 1 55652110
P 7300 1700
F 0 "R102" V 7380 1700 50  0000 C CNN
F 1 "10k" V 7200 1700 50  0000 C CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" V 7230 1700 30  0001 C CNN
F 3 "" H 7300 1700 30  0000 C CNN
F 4 "9237755" H 7300 1700 60  0001 C CNN "Farnell"
	1    7300 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR109
U 1 1 556523AF
P 7300 1900
F 0 "#PWR109" H 7300 1650 50  0001 C CNN
F 1 "GND" H 7300 1750 50  0000 C CNN
F 2 "" H 7300 1900 60  0000 C CNN
F 3 "" H 7300 1900 60  0000 C CNN
	1    7300 1900
	1    0    0    -1  
$EndComp
$Comp
L LCD_HD44780 U103
U 1 1 55638A7C
P 8050 3250
F 0 "U103" V 8100 3250 60  0000 C CNN
F 1 "LCD_HD44780" V 8000 3250 60  0000 C CNN
F 2 "" H 7300 3900 60  0000 C CNN
F 3 "" H 7300 3900 60  0000 C CNN
	1    8050 3250
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR113
U 1 1 5563E071
P 7350 2750
F 0 "#PWR113" H 7350 2600 50  0001 C CNN
F 1 "+3V3" H 7350 2890 50  0000 C CNN
F 2 "" H 7350 2750 60  0000 C CNN
F 3 "" H 7350 2750 60  0000 C CNN
	1    7350 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR114
U 1 1 5563E174
P 7350 2850
F 0 "#PWR114" H 7350 2600 50  0001 C CNN
F 1 "GND" H 7350 2700 50  0000 C CNN
F 2 "" H 7350 2850 60  0000 C CNN
F 3 "" H 7350 2850 60  0000 C CNN
	1    7350 2850
	1    0    0    -1  
$EndComp
$Comp
L POT RV101
U 1 1 5563E702
P 6650 3350
F 0 "RV101" H 6650 3250 50  0000 C CNN
F 1 "20k LIN" H 6650 3350 50  0000 C CNN
F 2 "" H 6650 3350 60  0000 C CNN
F 3 "" H 6650 3350 60  0000 C CNN
F 4 "9354824" H 6650 3350 60  0001 C CNN "Farnell"
	1    6650 3350
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR116
U 1 1 5563E7A7
P 6650 3050
F 0 "#PWR116" H 6650 2900 50  0001 C CNN
F 1 "+3V3" H 6650 3190 50  0000 C CNN
F 2 "" H 6650 3050 60  0000 C CNN
F 3 "" H 6650 3050 60  0000 C CNN
	1    6650 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR121
U 1 1 5563E8D6
P 6650 3650
F 0 "#PWR121" H 6650 3400 50  0001 C CNN
F 1 "GND" H 6650 3500 50  0000 C CNN
F 2 "" H 6650 3650 60  0000 C CNN
F 3 "" H 6650 3650 60  0000 C CNN
	1    6650 3650
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR117
U 1 1 55643D33
P 7000 3050
F 0 "#PWR117" H 7000 2900 50  0001 C CNN
F 1 "+BATT" H 7000 3190 50  0000 C CNN
F 2 "" H 7000 3050 60  0000 C CNN
F 3 "" H 7000 3050 60  0000 C CNN
	1    7000 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR118
U 1 1 55643E77
P 7000 3150
F 0 "#PWR118" H 7000 2900 50  0001 C CNN
F 1 "GND" H 7000 3000 50  0000 C CNN
F 2 "" H 7000 3150 60  0000 C CNN
F 3 "" H 7000 3150 60  0000 C CNN
	1    7000 3150
	1    0    0    -1  
$EndComp
$Comp
L RFM95W U105
U 1 1 55635406
P 7650 5400
F 0 "U105" V 7700 5400 60  0000 C CNN
F 1 "RFM95W" V 7600 5400 60  0000 C CNN
F 2 "" H 7650 5450 60  0000 C CNN
F 3 "" H 7650 5450 60  0000 C CNN
	1    7650 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR122
U 1 1 55638AFF
P 6950 3650
F 0 "#PWR122" H 6950 3400 50  0001 C CNN
F 1 "GND" H 6950 3500 50  0000 C CNN
F 2 "" H 6950 3650 60  0000 C CNN
F 3 "" H 6950 3650 60  0000 C CNN
	1    6950 3650
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P102
U 1 1 5563AF11
P 10700 3000
F 0 "P102" H 10700 3250 50  0000 C CNN
F 1 "CONN_01X04" V 10800 3000 50  0000 C CNN
F 2 "" H 10700 3000 60  0000 C CNN
F 3 "" H 10700 3000 60  0000 C CNN
	1    10700 3000
	1    0    0    -1  
$EndComp
$Comp
L STM32F071CBT6 U104
U 1 1 559BF2FD
P 2350 4200
F 0 "U104" V 2400 4350 60  0000 C CNN
F 1 "STM32F071CBT6" V 2300 4350 60  0000 C CNN
F 2 "Housings_QFP:LQFP-48_7x7mm_Pitch0.5mm" H 2350 4400 60  0001 C CNN
F 3 "" H 2350 4400 60  0000 C CNN
F 4 "2432093" H 2350 4200 60  0001 C CNN "Farnell"
	1    2350 4200
	1    0    0    -1  
$EndComp
$Comp
L TVS_small D101
U 1 1 559DC9F3
P 6250 1150
F 0 "D101" V 6450 1150 50  0000 C CNN
F 1 "TVS_small" H 6250 1075 50  0001 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 6250 1150 60  0001 C CNN
F 3 "" H 6250 1150 60  0000 C CNN
F 4 "2368174" H 6250 1150 60  0001 C CNN "Farnell"
	1    6250 1150
	0    1    1    0   
$EndComp
$Comp
L TVS_small D103
U 1 1 559DD518
P 8350 6025
F 0 "D103" H 8350 6100 50  0000 C CNN
F 1 "TVS_small" H 8350 5950 50  0001 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" H 8350 6025 60  0001 C CNN
F 3 "" H 8350 6025 60  0000 C CNN
F 4 "2368174" H 8350 6025 60  0001 C CNN "Farnell"
	1    8350 6025
	0    -1   -1   0   
$EndComp
Text Label 3750 2500 0    60   ~ 0
nRST
Text Label 3100 3650 0    60   ~ 0
SWDIO
Text Label 3100 3750 0    60   ~ 0
SWDCLK
Text Label 5000 1000 0    60   ~ 0
SWDIO
Text Label 5000 1100 0    60   ~ 0
SWDCLK
Text Label 5000 1400 0    60   ~ 0
nRST
Text Label 8250 5000 0    60   ~ 0
RFM_DIO0
Text Label 8250 5100 0    60   ~ 0
RFM_DIO1
Text Label 8250 5200 0    60   ~ 0
RFM_DIO2
Text Label 8250 5300 0    60   ~ 0
RFM_DIO3
Text Label 8250 5400 0    60   ~ 0
RFM_DIO4
Text Label 8250 5500 0    60   ~ 0
RFM_DIO5
Text Label 7050 5500 2    60   ~ 0
RFM_MISO
Text Label 7050 5600 2    60   ~ 0
RFM_MOSI
Text Label 7050 5700 2    60   ~ 0
RFM_SCK
Text Label 7050 5800 2    60   ~ 0
RFM_NSS
Text Label 7050 5900 2    60   ~ 0
RFM_RESET
Text Label 5000 5750 0    60   ~ 0
RFM_DIO0
Text Label 5000 5850 0    60   ~ 0
RFM_DIO1
Text Label 5000 5950 0    60   ~ 0
RFM_DIO2
Text Label 5000 6050 0    60   ~ 0
RFM_DIO3
Text Label 5000 6150 0    60   ~ 0
RFM_DIO4
Text Label 5000 6250 0    60   ~ 0
RFM_DIO5
Text Label 5000 5250 0    60   ~ 0
RFM_NSS
Text Label 5000 5350 0    60   ~ 0
RFM_SCK
Text Label 5000 5450 0    60   ~ 0
RFM_MISO
Text Label 5000 5550 0    60   ~ 0
RFM_MOSI
Text Label 8600 2900 0    60   ~ 0
LCD_DB0
Text Label 8600 3000 0    60   ~ 0
LCD_DB1
Text Label 8600 3100 0    60   ~ 0
LCD_DB2
Text Label 8600 3200 0    60   ~ 0
LCD_DB3
Text Label 8600 3300 0    60   ~ 0
LCD_DB4
Text Label 8600 3400 0    60   ~ 0
LCD_DB5
Text Label 8600 3500 0    60   ~ 0
LCD_DB6
Text Label 8600 3600 0    60   ~ 0
LCD_DB7
Text Label 7450 3550 2    60   ~ 0
LCD_RS
Text Label 7450 3750 2    60   ~ 0
LCD_E
Text Label 7450 1500 0    60   ~ 0
BATT_MON
Text Label 10000 2850 2    60   ~ 0
CH1_SW
Text Label 10000 2950 2    60   ~ 0
CH1_LED
$Comp
L GND #PWR125
U 1 1 559FB09B
P 10350 4200
F 0 "#PWR125" H 10350 3950 50  0001 C CNN
F 1 "GND" H 10350 4050 50  0000 C CNN
F 2 "" H 10350 4200 60  0000 C CNN
F 3 "" H 10350 4200 60  0000 C CNN
	1    10350 4200
	-1   0    0    -1  
$EndComp
$Comp
L R R106
U 1 1 559FB0A1
P 10300 3750
F 0 "R106" V 10380 3750 50  0000 C CNN
F 1 "10k" V 10300 3750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10230 3750 30  0001 C CNN
F 3 "" H 10300 3750 30  0000 C CNN
F 4 "2331808" H 10300 3750 60  0001 C CNN "Farnell"
	1    10300 3750
	0    1    -1   0   
$EndComp
$Comp
L +3V3 #PWR123
U 1 1 559FB0A7
P 10100 3700
F 0 "#PWR123" H 10100 3550 50  0001 C CNN
F 1 "+3V3" H 10100 3840 50  0000 C CNN
F 2 "" H 10100 3700 60  0000 C CNN
F 3 "" H 10100 3700 60  0000 C CNN
	1    10100 3700
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X04 P103
U 1 1 559FB0B4
P 10700 4000
F 0 "P103" H 10700 4250 50  0000 C CNN
F 1 "CONN_01X04" V 10800 4000 50  0000 C CNN
F 2 "" H 10700 4000 60  0000 C CNN
F 3 "" H 10700 4000 60  0000 C CNN
	1    10700 4000
	1    0    0    -1  
$EndComp
Text Label 10000 3850 2    60   ~ 0
CH2_SW
Text Label 10000 3950 2    60   ~ 0
CH2_LED
$Comp
L GND #PWR129
U 1 1 559FB15D
P 10350 5200
F 0 "#PWR129" H 10350 4950 50  0001 C CNN
F 1 "GND" H 10350 5050 50  0000 C CNN
F 2 "" H 10350 5200 60  0000 C CNN
F 3 "" H 10350 5200 60  0000 C CNN
	1    10350 5200
	-1   0    0    -1  
$EndComp
$Comp
L R R107
U 1 1 559FB163
P 10300 4750
F 0 "R107" V 10380 4750 50  0000 C CNN
F 1 "10k" V 10300 4750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10230 4750 30  0001 C CNN
F 3 "" H 10300 4750 30  0000 C CNN
F 4 "2331808" H 10300 4750 60  0001 C CNN "Farnell"
	1    10300 4750
	0    1    -1   0   
$EndComp
$Comp
L +3V3 #PWR126
U 1 1 559FB169
P 10100 4700
F 0 "#PWR126" H 10100 4550 50  0001 C CNN
F 1 "+3V3" H 10100 4840 50  0000 C CNN
F 2 "" H 10100 4700 60  0000 C CNN
F 3 "" H 10100 4700 60  0000 C CNN
	1    10100 4700
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X04 P104
U 1 1 559FB176
P 10700 5000
F 0 "P104" H 10700 5250 50  0000 C CNN
F 1 "CONN_01X04" V 10800 5000 50  0000 C CNN
F 2 "" H 10700 5000 60  0000 C CNN
F 3 "" H 10700 5000 60  0000 C CNN
	1    10700 5000
	1    0    0    -1  
$EndComp
Text Label 10000 4850 2    60   ~ 0
CH3_SW
Text Label 10000 4950 2    60   ~ 0
CH3_LED
$Comp
L GND #PWR132
U 1 1 559FB24D
P 10350 6200
F 0 "#PWR132" H 10350 5950 50  0001 C CNN
F 1 "GND" H 10350 6050 50  0000 C CNN
F 2 "" H 10350 6200 60  0000 C CNN
F 3 "" H 10350 6200 60  0000 C CNN
	1    10350 6200
	-1   0    0    -1  
$EndComp
$Comp
L R R108
U 1 1 559FB253
P 10300 5750
F 0 "R108" V 10380 5750 50  0000 C CNN
F 1 "10k" V 10300 5750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10230 5750 30  0001 C CNN
F 3 "" H 10300 5750 30  0000 C CNN
F 4 "2331808" H 10300 5750 60  0001 C CNN "Farnell"
	1    10300 5750
	0    1    -1   0   
$EndComp
$Comp
L +3V3 #PWR130
U 1 1 559FB259
P 10100 5700
F 0 "#PWR130" H 10100 5550 50  0001 C CNN
F 1 "+3V3" H 10100 5840 50  0000 C CNN
F 2 "" H 10100 5700 60  0000 C CNN
F 3 "" H 10100 5700 60  0000 C CNN
	1    10100 5700
	-1   0    0    -1  
$EndComp
$Comp
L CONN_01X04 P106
U 1 1 559FB266
P 10700 6000
F 0 "P106" H 10700 6250 50  0000 C CNN
F 1 "CONN_01X04" V 10800 6000 50  0000 C CNN
F 2 "" H 10700 6000 60  0000 C CNN
F 3 "" H 10700 6000 60  0000 C CNN
	1    10700 6000
	1    0    0    -1  
$EndComp
Text Label 10000 5850 2    60   ~ 0
CH4_SW
Text Label 10000 5950 2    60   ~ 0
CH4_LED
Text Label 5000 3450 0    60   ~ 0
CH1_SW
Text Label 5000 3550 0    60   ~ 0
CH2_SW
Text Label 5000 3650 0    60   ~ 0
CH3_SW
Text Label 5000 3750 0    60   ~ 0
CH4_SW
Text Label 5000 2950 0    60   ~ 0
CH1_LED
Text Label 5000 3050 0    60   ~ 0
CH2_LED
Text Label 5000 3150 0    60   ~ 0
CH3_LED
Text Label 5000 3250 0    60   ~ 0
CH4_LED
Text Label 5000 5150 0    60   ~ 0
RFM_RESET
Text Label 5000 3950 0    60   ~ 0
LCD_DB0
Text Label 5000 4050 0    60   ~ 0
LCD_DB1
Text Label 5000 4150 0    60   ~ 0
LCD_DB2
Text Label 5000 4250 0    60   ~ 0
LCD_DB3
Text Label 5000 4350 0    60   ~ 0
LCD_DB4
Text Label 5000 4450 0    60   ~ 0
LCD_DB5
Text Label 5000 4550 0    60   ~ 0
LCD_DB6
Text Label 5000 4650 0    60   ~ 0
LCD_DB7
Text Label 5000 4850 0    60   ~ 0
LCD_RS
Text Label 5000 4950 0    60   ~ 0
LCD_E
Text Label 5000 2750 0    60   ~ 0
BATT_MON
$Comp
L TestPoint TP101
U 1 1 559DAAF9
P 10250 1050
F 0 "TP101" H 10250 975 60  0000 C CNN
F 1 "TestPoint" H 10225 875 60  0001 C CNN
F 2 "" H 10250 1050 60  0000 C CNN
F 3 "" H 10250 1050 60  0000 C CNN
	1    10250 1050
	-1   0    0    1   
$EndComp
$Comp
L TestPoint TP102
U 1 1 559DAED6
P 6750 1100
F 0 "TP102" H 6750 1025 60  0000 C CNN
F 1 "TestPoint" H 6725 925 60  0001 C CNN
F 2 "" H 6750 1100 60  0000 C CNN
F 3 "" H 6750 1100 60  0000 C CNN
	1    6750 1100
	-1   0    0    1   
$EndComp
$Comp
L TestPoint TP103
U 1 1 559DAFE3
P 6750 1200
F 0 "TP103" H 6750 1125 60  0000 C CNN
F 1 "TestPoint" H 6725 1025 60  0001 C CNN
F 2 "" H 6750 1200 60  0000 C CNN
F 3 "" H 6750 1200 60  0000 C CNN
	1    6750 1200
	1    0    0    -1  
$EndComp
$Comp
L TestPoint TP104
U 1 1 559DB26A
P 3450 2500
F 0 "TP104" H 3450 2425 60  0000 C CNN
F 1 "TestPoint" H 3425 2325 60  0001 C CNN
F 2 "" H 3450 2500 60  0000 C CNN
F 3 "" H 3450 2500 60  0000 C CNN
	1    3450 2500
	-1   0    0    1   
$EndComp
$Comp
L C C106
U 1 1 559DAEBF
P 1000 2700
F 0 "C106" V 950 2750 50  0000 L CNN
F 1 "100n" V 950 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2550 30  0001 C CNN
F 3 "" H 1000 2700 60  0000 C CNN
F 4 "2407344" H 1000 2700 60  0001 C CNN "Farnell"
	1    1000 2700
	0    1    -1   0   
$EndComp
$Comp
L C C104
U 1 1 559DB222
P 1000 2300
F 0 "C104" V 950 2350 50  0000 L CNN
F 1 "100n" V 950 2050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 2150 30  0001 C CNN
F 3 "" H 1000 2300 60  0000 C CNN
F 4 "2407344" H 1000 2300 60  0001 C CNN "Farnell"
	1    1000 2300
	0    1    -1   0   
$EndComp
$Comp
L C C103
U 1 1 559DB2C5
P 1000 2100
F 0 "C103" V 950 2150 50  0000 L CNN
F 1 "100n" V 950 1850 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 1038 1950 30  0001 C CNN
F 3 "" H 1000 2100 60  0000 C CNN
F 4 "2407344" H 1000 2100 60  0001 C CNN "Farnell"
	1    1000 2100
	0    1    -1   0   
$EndComp
$Comp
L C C114
U 1 1 559DBA6F
P 6800 5000
F 0 "C114" H 6650 5100 50  0000 L CNN
F 1 "100n" H 6600 4900 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6838 4850 30  0001 C CNN
F 3 "" H 6800 5000 60  0000 C CNN
F 4 "2407344" H 6800 5000 60  0001 C CNN "Farnell"
	1    6800 5000
	1    0    0    1   
$EndComp
$Comp
L C C113
U 1 1 559DBFDA
P 6500 5000
F 0 "C113" H 6350 5100 50  0000 L CNN
F 1 "100u" H 6300 4900 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 6538 4850 30  0001 C CNN
F 3 "" H 6500 5000 60  0000 C CNN
F 4 "2362115" H 6500 5000 60  0001 C CNN "Farnell"
	1    6500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1650 9100 1700
Wire Wire Line
	8100 1100 8100 1250
Connection ~ 8100 1100
Wire Wire Line
	8100 1550 8100 1600
Wire Wire Line
	9850 1500 9850 1550
Wire Wire Line
	9550 1050 10450 1050
Wire Wire Line
	9850 1050 9850 1200
Connection ~ 9850 1050
Wire Wire Line
	10450 950  10450 1150
Wire Wire Line
	6300 1200 7050 1200
Wire Wire Line
	6500 1050 6500 1100
Connection ~ 6500 1100
Wire Wire Line
	6500 1250 6500 1200
Connection ~ 6500 1200
Wire Wire Line
	7050 1100 7050 1050
Connection ~ 7050 1100
Wire Wire Line
	7050 1200 7050 1250
Wire Wire Line
	10350 3150 10500 3150
Wire Wire Line
	10350 3050 10350 3200
Wire Wire Line
	10450 2850 10450 2750
Connection ~ 10450 2850
Wire Wire Line
	10150 2750 10100 2750
Wire Wire Line
	10100 2750 10100 2700
Wire Wire Line
	8500 6000 8450 6000
Wire Wire Line
	8450 6000 8450 6175
Wire Wire Line
	6500 5200 7050 5200
Wire Wire Line
	7000 5200 7000 5300
Wire Wire Line
	7000 5300 7050 5300
Connection ~ 7000 5200
Wire Wire Line
	7050 5100 6950 5100
Wire Wire Line
	6950 5100 6950 5200
Connection ~ 6950 5200
Wire Wire Line
	6800 4750 6800 4850
Wire Wire Line
	6500 4800 7000 4800
Wire Wire Line
	7000 4800 7000 5000
Wire Wire Line
	7000 5000 7050 5000
Connection ~ 6800 4800
Wire Wire Line
	6800 5150 6800 5200
Connection ~ 6800 5200
Wire Wire Line
	8250 5900 8500 5900
Wire Wire Line
	1650 3400 1550 3400
Wire Wire Line
	1550 3400 1550 3800
Wire Wire Line
	1550 3500 1650 3500
Wire Wire Line
	1550 3600 1650 3600
Connection ~ 1550 3500
Wire Wire Line
	1550 3800 1650 3800
Connection ~ 1550 3600
Wire Wire Line
	750  3550 1550 3550
Wire Wire Line
	1150 3550 1150 3650
Connection ~ 1550 3550
Wire Wire Line
	3600 2500 3600 2550
Connection ~ 3600 2500
Wire Wire Line
	3000 2850 3600 2850
Wire Wire Line
	3550 2850 3550 2900
Wire Wire Line
	3350 2500 3750 2500
Wire Wire Line
	3350 2750 3000 2750
Wire Wire Line
	3000 3350 3900 3350
Wire Wire Line
	3900 3350 3900 3250
Wire Wire Line
	3900 3250 4550 3250
Wire Wire Line
	3900 3450 3900 3550
Wire Wire Line
	3900 3550 4350 3550
Wire Wire Line
	4350 3550 4350 3600
Connection ~ 4100 3550
Wire Wire Line
	4550 3250 4550 3600
Connection ~ 4100 3250
Wire Wire Line
	4550 3950 4550 3900
Wire Wire Line
	4350 3950 4550 3950
Connection ~ 4450 3950
Wire Wire Line
	4350 3950 4350 3900
Connection ~ 10450 1050
Wire Wire Line
	10450 1550 10450 1600
Wire Wire Line
	10450 1900 10450 1950
Wire Wire Line
	3750 950  3750 1000
Wire Wire Line
	3750 1000 3800 1000
Wire Wire Line
	3800 1100 3700 1100
Wire Wire Line
	3700 1100 3700 1450
Wire Wire Line
	3700 1400 3800 1400
Connection ~ 3700 1400
Wire Wire Line
	3800 1200 3700 1200
Connection ~ 3700 1200
Wire Wire Line
	7300 1100 7300 1150
Wire Wire Line
	7300 1850 7300 1900
Wire Wire Line
	7300 1450 7300 1550
Wire Wire Line
	7300 1500 7450 1500
Connection ~ 7300 1500
Wire Wire Line
	7450 2850 7350 2850
Wire Wire Line
	6650 3050 6650 3100
Wire Wire Line
	6650 3650 6650 3600
Wire Wire Line
	6800 3350 7450 3350
Wire Wire Line
	7000 3050 7450 3050
Wire Wire Line
	7000 3150 7450 3150
Wire Wire Line
	7350 2750 7450 2750
Wire Wire Line
	6950 3650 7450 3650
Wire Wire Line
	10500 3050 10350 3050
Connection ~ 10350 3150
Wire Wire Line
	3350 2500 3350 2750
Connection ~ 3550 2850
Wire Wire Line
	6200 1100 6200 1050
Wire Wire Line
	6200 1050 6300 1050
Wire Wire Line
	6250 1050 6250 1050
Wire Wire Line
	6300 1050 6300 1100
Connection ~ 6250 1050
Wire Wire Line
	6200 1200 6200 1250
Wire Wire Line
	6200 1250 6300 1250
Wire Wire Line
	6250 1250 6250 1250
Wire Wire Line
	6300 1250 6300 1200
Connection ~ 6250 1250
Connection ~ 7300 1100
Wire Wire Line
	8350 5900 8350 5925
Connection ~ 8350 5900
Wire Wire Line
	8350 6125 8450 6125
Connection ~ 8450 6125
Wire Wire Line
	3100 3650 3000 3650
Wire Wire Line
	3000 3750 3100 3750
Wire Wire Line
	10000 2850 10500 2850
Wire Wire Line
	10500 2950 10000 2950
Wire Wire Line
	10350 4150 10500 4150
Wire Wire Line
	10350 4050 10350 4200
Wire Wire Line
	10450 3850 10450 3750
Connection ~ 10450 3850
Wire Wire Line
	10150 3750 10100 3750
Wire Wire Line
	10100 3750 10100 3700
Wire Wire Line
	10500 4050 10350 4050
Connection ~ 10350 4150
Wire Wire Line
	10000 3850 10500 3850
Wire Wire Line
	10500 3950 10000 3950
Wire Wire Line
	10350 5150 10500 5150
Wire Wire Line
	10350 5050 10350 5200
Wire Wire Line
	10450 4850 10450 4750
Connection ~ 10450 4850
Wire Wire Line
	10150 4750 10100 4750
Wire Wire Line
	10100 4750 10100 4700
Wire Wire Line
	10500 5050 10350 5050
Connection ~ 10350 5150
Wire Wire Line
	10000 4850 10500 4850
Wire Wire Line
	10500 4950 10000 4950
Wire Wire Line
	10350 6150 10500 6150
Wire Wire Line
	10350 6050 10350 6200
Wire Wire Line
	10450 5850 10450 5750
Connection ~ 10450 5850
Wire Wire Line
	10150 5750 10100 5750
Wire Wire Line
	10100 5750 10100 5700
Wire Wire Line
	10500 6050 10350 6050
Connection ~ 10350 6150
Wire Wire Line
	10000 5850 10500 5850
Wire Wire Line
	10500 5950 10000 5950
Connection ~ 10250 1050
Connection ~ 6750 1100
Connection ~ 6750 1200
Connection ~ 3450 2500
Wire Wire Line
	3000 3450 3500 3450
Wire Wire Line
	3800 3450 3900 3450
Connection ~ 1150 3550
Wire Wire Line
	750  2700 850  2700
Wire Wire Line
	750  2100 750  3550
Wire Wire Line
	850  3300 750  3300
Connection ~ 750  3300
Wire Wire Line
	750  3100 850  3100
Connection ~ 750  3100
Wire Wire Line
	850  2900 750  2900
Connection ~ 750  2900
Wire Wire Line
	750  2500 850  2500
Connection ~ 750  2700
Wire Wire Line
	750  2300 850  2300
Connection ~ 750  2500
Wire Wire Line
	750  2100 850  2100
Connection ~ 750  2300
Wire Wire Line
	1150 1950 1150 3300
Wire Wire Line
	1150 3200 1650 3200
Connection ~ 1150 3200
Connection ~ 1150 2900
Connection ~ 1150 3100
Wire Wire Line
	1150 2800 1250 2800
Wire Wire Line
	1250 2800 1250 3100
Wire Wire Line
	1250 3100 1650 3100
Connection ~ 1150 2800
Connection ~ 1150 2700
Connection ~ 1150 2500
Connection ~ 1150 2300
Wire Wire Line
	1150 2400 1400 2400
Wire Wire Line
	1400 2400 1400 2900
Wire Wire Line
	1400 2900 1650 2900
Connection ~ 1150 2400
Wire Wire Line
	1150 2200 1500 2200
Wire Wire Line
	1500 2200 1500 2800
Wire Wire Line
	1500 2800 1650 2800
Connection ~ 1150 2200
Connection ~ 1150 2100
Wire Wire Line
	1150 2000 1650 2000
Wire Wire Line
	1650 2000 1650 2600
Connection ~ 1150 2000
Wire Wire Line
	6500 4850 6500 4800
Wire Wire Line
	6500 5150 6500 5200
Connection ~ 6750 5200
Wire Wire Line
	6300 1100 8500 1100
Wire Wire Line
	8500 1050 8500 1150
Wire Wire Line
	8500 1050 8550 1050
Wire Wire Line
	8500 1150 8550 1150
Connection ~ 8500 1100
Wire Wire Line
	9650 1150 9550 1150
Connection ~ 9650 1050
Wire Wire Line
	9550 950  9600 950 
Wire Wire Line
	9600 950  9600 1050
Connection ~ 9600 1050
Wire Wire Line
	9650 1050 9650 1150
Wire Wire Line
	8400 1100 8400 1650
Wire Wire Line
	8400 1650 9000 1650
Connection ~ 8400 1100
$Comp
L ADP3335 U101
U 1 1 559E0082
P 9000 1050
F 0 "U101" V 9100 1050 60  0000 C CNN
F 1 "ADP3335" V 9000 1050 60  0000 C CNN
F 2 "Housings_SSOP:MSOP-8_3x3mm_Pitch0.65mm" H 9000 1200 60  0001 C CNN
F 3 "" H 9000 1200 60  0000 C CNN
F 4 "2067775" H 9000 1050 60  0001 C CNN "Farnell"
	1    9000 1050
	1    0    0    -1  
$EndComp
$EndSCHEMATC
