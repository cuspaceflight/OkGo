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
LIBS:stm32f071cbt6
LIBS:swd
LIBS:lcd_hd44780
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
L CONN_01X02 P?
U 1 1 556213DD
P 6700 1150
F 0 "P?" H 6700 1300 50  0000 C CNN
F 1 "BATT_IN" V 6800 1150 50  0000 C CNN
F 2 "" H 6700 1150 60  0000 C CNN
F 3 "" H 6700 1150 60  0000 C CNN
	1    6700 1150
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 556214DE
P 7400 1250
F 0 "#PWR?" H 7400 1000 50  0001 C CNN
F 1 "GND" H 7400 1100 50  0000 C CNN
F 2 "" H 7400 1250 60  0000 C CNN
F 3 "" H 7400 1250 60  0000 C CNN
	1    7400 1250
	1    0    0    -1  
$EndComp
$Comp
L +BATT #PWR?
U 1 1 556214F3
P 7400 1050
F 0 "#PWR?" H 7400 900 50  0001 C CNN
F 1 "+BATT" H 7400 1190 50  0000 C CNN
F 2 "" H 7400 1050 60  0000 C CNN
F 3 "" H 7400 1050 60  0000 C CNN
	1    7400 1050
	1    0    0    -1  
$EndComp
$Comp
L APE8865N-33-HF-3 U?
U 1 1 55621557
P 9050 1150
F 0 "U?" H 8750 1400 40  0000 C CNN
F 1 "APE8865N-33-HF-3" H 9050 1350 40  0000 C CNN
F 2 "SOT-23" H 9050 1250 35  0000 C CIN
F 3 "" H 9050 1150 60  0000 C CNN
	1    9050 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556215CB
P 9050 1500
F 0 "#PWR?" H 9050 1250 50  0001 C CNN
F 1 "GND" H 9050 1350 50  0000 C CNN
F 2 "" H 9050 1500 60  0000 C CNN
F 3 "" H 9050 1500 60  0000 C CNN
	1    9050 1500
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 556215E1
P 8500 1400
F 0 "C?" H 8525 1500 50  0000 L CNN
F 1 "C" H 8525 1300 50  0000 L CNN
F 2 "" H 8538 1250 30  0000 C CNN
F 3 "" H 8500 1400 60  0000 C CNN
	1    8500 1400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 55621639
P 9600 1400
F 0 "C?" H 9625 1500 50  0000 L CNN
F 1 "C" H 9625 1300 50  0000 L CNN
F 2 "" H 9638 1250 30  0000 C CNN
F 3 "" H 9600 1400 60  0000 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
$Comp
L CP C?
U 1 1 55621664
P 9850 1400
F 0 "C?" H 9875 1500 50  0000 L CNN
F 1 "CP" H 9875 1300 50  0000 L CNN
F 2 "" H 9888 1250 30  0000 C CNN
F 3 "" H 9850 1400 60  0000 C CNN
	1    9850 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556216C5
P 8500 1600
F 0 "#PWR?" H 8500 1350 50  0001 C CNN
F 1 "GND" H 8500 1450 50  0000 C CNN
F 2 "" H 8500 1600 60  0000 C CNN
F 3 "" H 8500 1600 60  0000 C CNN
	1    8500 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556216DE
P 9600 1600
F 0 "#PWR?" H 9600 1350 50  0001 C CNN
F 1 "GND" H 9600 1450 50  0000 C CNN
F 2 "" H 9600 1600 60  0000 C CNN
F 3 "" H 9600 1600 60  0000 C CNN
	1    9600 1600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556216F7
P 9850 1600
F 0 "#PWR?" H 9850 1350 50  0001 C CNN
F 1 "GND" H 9850 1450 50  0000 C CNN
F 2 "" H 9850 1600 60  0000 C CNN
F 3 "" H 9850 1600 60  0000 C CNN
	1    9850 1600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 556217FC
P 7050 1050
F 0 "#FLG?" H 7050 1145 50  0001 C CNN
F 1 "PWR_FLAG" H 7050 1230 50  0000 C CNN
F 2 "" H 7050 1050 60  0000 C CNN
F 3 "" H 7050 1050 60  0000 C CNN
	1    7050 1050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG?
U 1 1 55621881
P 7050 1250
F 0 "#FLG?" H 7050 1345 50  0001 C CNN
F 1 "PWR_FLAG" H 7050 1430 50  0000 C CNN
F 2 "" H 7050 1250 60  0000 C CNN
F 3 "" H 7050 1250 60  0000 C CNN
	1    7050 1250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 556220CD
P 10350 3200
F 0 "#PWR?" H 10350 2950 50  0001 C CNN
F 1 "GND" H 10350 3050 50  0000 C CNN
F 2 "" H 10350 3200 60  0000 C CNN
F 3 "" H 10350 3200 60  0000 C CNN
	1    10350 3200
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556221AC
P 10350 4150
F 0 "#PWR?" H 10350 3900 50  0001 C CNN
F 1 "GND" H 10350 4000 50  0000 C CNN
F 2 "" H 10350 4150 60  0000 C CNN
F 3 "" H 10350 4150 60  0000 C CNN
	1    10350 4150
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556222F9
P 10350 5050
F 0 "#PWR?" H 10350 4800 50  0001 C CNN
F 1 "GND" H 10350 4900 50  0000 C CNN
F 2 "" H 10350 5050 60  0000 C CNN
F 3 "" H 10350 5050 60  0000 C CNN
	1    10350 5050
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5562233A
P 10350 6050
F 0 "#PWR?" H 10350 5800 50  0001 C CNN
F 1 "GND" H 10350 5900 50  0000 C CNN
F 2 "" H 10350 6050 60  0000 C CNN
F 3 "" H 10350 6050 60  0000 C CNN
	1    10350 6050
	-1   0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 556229F5
P 10250 2750
F 0 "R?" V 10330 2750 50  0000 C CNN
F 1 "R" V 10250 2750 50  0000 C CNN
F 2 "" V 10180 2750 30  0000 C CNN
F 3 "" H 10250 2750 30  0000 C CNN
	1    10250 2750
	0    1    -1   0   
$EndComp
Text GLabel 10050 2850 0    60   Input ~ 0
CH1_SW
Text GLabel 10050 3800 0    60   Input ~ 0
CH2_SW
$Comp
L R R?
U 1 1 55623A45
P 10250 3700
F 0 "R?" V 10330 3700 50  0000 C CNN
F 1 "R" V 10250 3700 50  0000 C CNN
F 2 "" V 10180 3700 30  0000 C CNN
F 3 "" H 10250 3700 30  0000 C CNN
	1    10250 3700
	0    1    -1   0   
$EndComp
Text GLabel 10050 4700 0    60   Input ~ 0
CH3_SW
$Comp
L R R?
U 1 1 55624B53
P 10250 4600
F 0 "R?" V 10330 4600 50  0000 C CNN
F 1 "R" V 10250 4600 50  0000 C CNN
F 2 "" V 10180 4600 30  0000 C CNN
F 3 "" H 10250 4600 30  0000 C CNN
	1    10250 4600
	0    1    -1   0   
$EndComp
Text GLabel 10050 5700 0    60   Input ~ 0
CH4_SW
$Comp
L R R?
U 1 1 556256D5
P 10250 5600
F 0 "R?" V 10330 5600 50  0000 C CNN
F 1 "R" V 10250 5600 50  0000 C CNN
F 2 "" V 10180 5600 30  0000 C CNN
F 3 "" H 10250 5600 30  0000 C CNN
	1    10250 5600
	0    1    -1   0   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 55628399
P 8150 5850
F 0 "P?" H 8150 6000 50  0000 C CNN
F 1 "ANT" V 8250 5850 50  0000 C CNN
F 2 "" H 8150 5850 60  0000 C CNN
F 3 "" H 8150 5850 60  0000 C CNN
	1    8150 5850
	1    0    0    1   
$EndComp
$Comp
L GND #PWR?
U 1 1 55629E65
P 7900 5950
F 0 "#PWR?" H 7900 5700 50  0001 C CNN
F 1 "GND" H 7900 5800 50  0000 C CNN
F 2 "" H 7900 5950 60  0000 C CNN
F 3 "" H 7900 5950 60  0000 C CNN
	1    7900 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5562B214
P 6200 5100
F 0 "#PWR?" H 6200 4850 50  0001 C CNN
F 1 "GND" H 6200 4950 50  0000 C CNN
F 2 "" H 6200 5100 60  0000 C CNN
F 3 "" H 6200 5100 60  0000 C CNN
	1    6200 5100
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5562B31B
P 6250 4900
F 0 "C?" H 6275 5000 50  0000 L CNN
F 1 "C" H 6275 4800 50  0000 L CNN
F 2 "" H 6288 4750 30  0000 C CNN
F 3 "" H 6250 4900 60  0000 C CNN
	1    6250 4900
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 5562B35A
P 6250 4650
F 0 "#PWR?" H 6250 4500 50  0001 C CNN
F 1 "+3V3" H 6250 4790 50  0000 C CNN
F 2 "" H 6250 4650 60  0000 C CNN
F 3 "" H 6250 4650 60  0000 C CNN
	1    6250 4650
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 55624CAA
P 10300 1000
F 0 "#PWR?" H 10300 850 50  0001 C CNN
F 1 "+3V3" H 10300 1140 50  0000 C CNN
F 2 "" H 10300 1000 60  0000 C CNN
F 3 "" H 10300 1000 60  0000 C CNN
	1    10300 1000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 55624E6E
P 10050 2700
F 0 "#PWR?" H 10050 2550 50  0001 C CNN
F 1 "+3V3" H 10050 2840 50  0000 C CNN
F 2 "" H 10050 2700 60  0000 C CNN
F 3 "" H 10050 2700 60  0000 C CNN
	1    10050 2700
	-1   0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 55624E9A
P 10050 3650
F 0 "#PWR?" H 10050 3500 50  0001 C CNN
F 1 "+3V3" H 10050 3790 50  0000 C CNN
F 2 "" H 10050 3650 60  0000 C CNN
F 3 "" H 10050 3650 60  0000 C CNN
	1    10050 3650
	-1   0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 55625046
P 10050 4550
F 0 "#PWR?" H 10050 4400 50  0001 C CNN
F 1 "+3V3" H 10050 4690 50  0000 C CNN
F 2 "" H 10050 4550 60  0000 C CNN
F 3 "" H 10050 4550 60  0000 C CNN
	1    10050 4550
	-1   0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 55625072
P 10050 5550
F 0 "#PWR?" H 10050 5400 50  0001 C CNN
F 1 "+3V3" H 10050 5690 50  0000 C CNN
F 2 "" H 10050 5550 60  0000 C CNN
F 3 "" H 10050 5550 60  0000 C CNN
	1    10050 5550
	-1   0    0    -1  
$EndComp
Text GLabel 6150 5400 0    60   Input ~ 0
RFM_MISO
Text GLabel 6150 5550 0    60   Input ~ 0
RFM_MOSI
Text GLabel 6150 5700 0    60   Input ~ 0
RFM_SCK
Text GLabel 6150 5850 0    60   Input ~ 0
RFM_NSS
Text GLabel 6150 6000 0    60   Input ~ 0
RFM_RESET
$Comp
L STM32F071CBT6 U?
U 1 1 5562BD4C
P 3400 4150
F 0 "U?" V 3450 4300 60  0000 C CNN
F 1 "STM32F071CBT6" V 3350 4300 60  0000 C CNN
F 2 "" H 3400 4350 60  0000 C CNN
F 3 "" H 3400 4350 60  0000 C CNN
	1    3400 4150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 5562C6B7
P 2450 2400
F 0 "#PWR?" H 2450 2250 50  0001 C CNN
F 1 "+3V3" H 2450 2540 50  0000 C CNN
F 2 "" H 2450 2400 60  0000 C CNN
F 3 "" H 2450 2400 60  0000 C CNN
	1    2450 2400
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5562D332
P 2050 3250
F 0 "C?" H 2075 3350 50  0000 L CNN
F 1 "C" H 2075 3150 50  0000 L CNN
F 2 "" H 2088 3100 30  0000 C CNN
F 3 "" H 2050 3250 60  0000 C CNN
	1    2050 3250
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 5562D381
P 2050 3050
F 0 "C?" H 2075 3150 50  0000 L CNN
F 1 "C" H 2075 2950 50  0000 L CNN
F 2 "" H 2088 2900 30  0000 C CNN
F 3 "" H 2050 3050 60  0000 C CNN
	1    2050 3050
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 5562D3B3
P 2050 2850
F 0 "C?" H 2075 2950 50  0000 L CNN
F 1 "C" H 2075 2750 50  0000 L CNN
F 2 "" H 2088 2700 30  0000 C CNN
F 3 "" H 2050 2850 60  0000 C CNN
	1    2050 2850
	0    1    1    0   
$EndComp
$Comp
L C C?
U 1 1 5562D400
P 2050 2650
F 0 "C?" H 2075 2750 50  0000 L CNN
F 1 "C" H 2075 2550 50  0000 L CNN
F 2 "" H 2088 2500 30  0000 C CNN
F 3 "" H 2050 2650 60  0000 C CNN
	1    2050 2650
	0    1    1    0   
$EndComp
$Comp
L GND #PWR?
U 1 1 5562DCAE
P 2400 3650
F 0 "#PWR?" H 2400 3400 50  0001 C CNN
F 1 "GND" H 2400 3500 50  0000 C CNN
F 2 "" H 2400 3650 60  0000 C CNN
F 3 "" H 2400 3650 60  0000 C CNN
	1    2400 3650
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 5562E486
P 2100 4050
F 0 "C?" H 2125 4150 50  0000 L CNN
F 1 "C" H 2125 3950 50  0000 L CNN
F 2 "" H 2138 3900 30  0000 C CNN
F 3 "" H 2100 4050 60  0000 C CNN
	1    2100 4050
	1    0    0    -1  
$EndComp
Text GLabel 1950 3850 0    60   Input ~ 0
NRST
$Comp
L GND #PWR?
U 1 1 5562E73A
P 2450 4100
F 0 "#PWR?" H 2450 3850 50  0001 C CNN
F 1 "GND" H 2450 3950 50  0000 C CNN
F 2 "" H 2450 4100 60  0000 C CNN
F 3 "" H 2450 4100 60  0000 C CNN
	1    2450 4100
	1    0    0    -1  
$EndComp
Text GLabel 2400 4700 0    60   Input ~ 0
RFM_MISO
Text GLabel 2400 4850 0    60   Input ~ 0
RFM_MOSI
Text GLabel 2400 4550 0    60   Input ~ 0
RFM_SCK
Text GLabel 2400 4400 0    60   Input ~ 0
RFM_NSS
Text GLabel 2550 5350 0    60   Input ~ 0
SWDIO
Text GLabel 2550 5500 0    60   Input ~ 0
SWDCLK
$Comp
L Crystal Y?
U 1 1 55631E06
P 1500 5100
F 0 "Y?" H 1500 5250 50  0000 C CNN
F 1 "Crystal" H 1500 4950 50  0000 C CNN
F 2 "" H 1500 5100 60  0000 C CNN
F 3 "" H 1500 5100 60  0000 C CNN
	1    1500 5100
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5563219C
P 2050 5050
F 0 "R?" V 2130 5050 50  0000 C CNN
F 1 "R" V 2050 5050 50  0000 C CNN
F 2 "" V 1980 5050 30  0000 C CNN
F 3 "" H 2050 5050 30  0000 C CNN
	1    2050 5050
	0    -1   -1   0   
$EndComp
$Comp
L C C?
U 1 1 5563246F
P 1250 5450
F 0 "C?" H 1275 5550 50  0000 L CNN
F 1 "C" H 1275 5350 50  0000 L CNN
F 2 "" H 1288 5300 30  0000 C CNN
F 3 "" H 1250 5450 60  0000 C CNN
	1    1250 5450
	1    0    0    -1  
$EndComp
$Comp
L C C?
U 1 1 55632519
P 1050 5450
F 0 "C?" H 1075 5550 50  0000 L CNN
F 1 "C" H 1075 5350 50  0000 L CNN
F 2 "" H 1088 5300 30  0000 C CNN
F 3 "" H 1050 5450 60  0000 C CNN
	1    1050 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5563278B
P 1150 5650
F 0 "#PWR?" H 1150 5400 50  0001 C CNN
F 1 "GND" H 1150 5500 50  0000 C CNN
F 2 "" H 1150 5650 60  0000 C CNN
F 3 "" H 1150 5650 60  0000 C CNN
	1    1150 5650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5563488F
P 1900 3400
F 0 "#PWR?" H 1900 3150 50  0001 C CNN
F 1 "GND" H 1900 3250 50  0000 C CNN
F 2 "" H 1900 3400 60  0000 C CNN
F 3 "" H 1900 3400 60  0000 C CNN
	1    1900 3400
	1    0    0    -1  
$EndComp
Text GLabel 4650 3000 2    60   Input ~ 0
RFM_RESET
Text GLabel 4650 3250 2    60   Input ~ 0
CH1_SW
Text GLabel 4650 3400 2    60   Input ~ 0
CH2_SW
Text GLabel 4650 3550 2    60   Input ~ 0
CH3_SW
Text GLabel 4650 3700 2    60   Input ~ 0
CH4_SW
$Comp
L LED D?
U 1 1 55645DBD
P 10300 1400
F 0 "D?" H 10300 1500 50  0000 C CNN
F 1 "POWER" H 10350 1300 50  0000 C CNN
F 2 "" H 10300 1400 60  0000 C CNN
F 3 "" H 10300 1400 60  0000 C CNN
	1    10300 1400
	0    -1   -1   0   
$EndComp
$Comp
L R R?
U 1 1 55646094
P 10300 1800
F 0 "R?" V 10380 1800 50  0000 C CNN
F 1 "R" V 10300 1800 50  0000 C CNN
F 2 "" V 10230 1800 30  0000 C CNN
F 3 "" H 10300 1800 30  0000 C CNN
	1    10300 1800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556462D7
P 10300 2000
F 0 "#PWR?" H 10300 1750 50  0001 C CNN
F 1 "GND" H 10300 1850 50  0000 C CNN
F 2 "" H 10300 2000 60  0000 C CNN
F 3 "" H 10300 2000 60  0000 C CNN
	1    10300 2000
	1    0    0    -1  
$EndComp
$Comp
L SWD U?
U 1 1 55647D4E
P 4400 1200
F 0 "U?" V 4400 1200 60  0000 C CNN
F 1 "SWD" V 4300 1200 60  0000 C CNN
F 2 "" H 4300 1500 60  0000 C CNN
F 3 "" H 4300 1500 60  0000 C CNN
	1    4400 1200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 556484DA
P 3750 950
F 0 "#PWR?" H 3750 800 50  0001 C CNN
F 1 "+3V3" H 3750 1090 50  0000 C CNN
F 2 "" H 3750 950 60  0000 C CNN
F 3 "" H 3750 950 60  0000 C CNN
	1    3750 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5564860C
P 3700 1450
F 0 "#PWR?" H 3700 1200 50  0001 C CNN
F 1 "GND" H 3700 1300 50  0000 C CNN
F 2 "" H 3700 1450 60  0000 C CNN
F 3 "" H 3700 1450 60  0000 C CNN
	1    3700 1450
	1    0    0    -1  
$EndComp
Text GLabel 5100 950  2    60   Input ~ 0
SWDIO
Text GLabel 5100 1100 2    60   Input ~ 0
SWDCLK
NoConn ~ 5000 1200
NoConn ~ 5000 1300
Text GLabel 5100 1400 2    60   Input ~ 0
nRST
$Comp
L C C?
U 1 1 5564FCE8
P 2050 2450
F 0 "C?" V 2000 2500 50  0000 L CNN
F 1 "100n" V 2000 2200 50  0000 L CNN
F 2 "" H 2088 2300 30  0000 C CNN
F 3 "" H 2050 2450 60  0000 C CNN
	1    2050 2450
	0    1    1    0   
$EndComp
$Comp
L R R?
U 1 1 5565208A
P 7650 1300
F 0 "R?" V 7730 1300 50  0000 C CNN
F 1 "R" V 7650 1300 50  0000 C CNN
F 2 "" V 7580 1300 30  0000 C CNN
F 3 "" H 7650 1300 30  0000 C CNN
	1    7650 1300
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 55652110
P 7650 1700
F 0 "R?" V 7730 1700 50  0000 C CNN
F 1 "R" V 7650 1700 50  0000 C CNN
F 2 "" V 7580 1700 30  0000 C CNN
F 3 "" H 7650 1700 30  0000 C CNN
	1    7650 1700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 556523AF
P 7650 1900
F 0 "#PWR?" H 7650 1650 50  0001 C CNN
F 1 "GND" H 7650 1750 50  0000 C CNN
F 2 "" H 7650 1900 60  0000 C CNN
F 3 "" H 7650 1900 60  0000 C CNN
	1    7650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9050 1450 9050 1500
Wire Wire Line
	8500 1100 8500 1250
Connection ~ 8500 1100
Wire Wire Line
	8500 1550 8500 1600
Wire Wire Line
	9600 1550 9600 1600
Wire Wire Line
	9850 1550 9850 1600
Wire Wire Line
	9500 1100 10300 1100
Wire Wire Line
	9600 1100 9600 1250
Wire Wire Line
	9850 1100 9850 1250
Connection ~ 9600 1100
Wire Wire Line
	10300 1000 10300 1200
Connection ~ 9850 1100
Wire Wire Line
	6900 1200 7400 1200
Wire Wire Line
	7050 1050 7050 1100
Connection ~ 7050 1100
Wire Wire Line
	7050 1250 7050 1200
Connection ~ 7050 1200
Wire Wire Line
	7400 1100 7400 1050
Connection ~ 7400 1100
Wire Wire Line
	7400 1200 7400 1250
Wire Wire Line
	10350 3150 10500 3150
Wire Wire Line
	10350 3050 10350 3200
Wire Wire Line
	10350 4100 10500 4100
Wire Wire Line
	10350 4000 10350 4150
Wire Wire Line
	10350 5000 10500 5000
Wire Wire Line
	10350 4900 10350 5050
Wire Wire Line
	10350 6000 10500 6000
Wire Wire Line
	10350 5900 10350 6050
Wire Wire Line
	10400 2850 10400 2750
Connection ~ 10400 2850
Wire Wire Line
	10100 2750 10050 2750
Wire Wire Line
	10050 2750 10050 2700
Wire Wire Line
	10050 2850 10500 2850
Wire Wire Line
	10050 3800 10500 3800
Wire Wire Line
	10400 3800 10400 3700
Connection ~ 10400 3800
Wire Wire Line
	10100 3700 10050 3700
Wire Wire Line
	10050 3700 10050 3650
Wire Wire Line
	10050 4700 10500 4700
Wire Wire Line
	10100 4600 10050 4600
Wire Wire Line
	10050 4600 10050 4550
Wire Wire Line
	10400 4600 10400 4700
Connection ~ 10400 4700
Wire Wire Line
	10050 5700 10500 5700
Wire Wire Line
	10400 5600 10400 5700
Connection ~ 10400 5700
Wire Wire Line
	10100 5600 10050 5600
Wire Wire Line
	10050 5600 10050 5550
Wire Wire Line
	7950 5900 7900 5900
Wire Wire Line
	7900 5900 7900 5950
Wire Wire Line
	6200 5100 6500 5100
Wire Wire Line
	6450 5100 6450 5200
Wire Wire Line
	6450 5200 6500 5200
Connection ~ 6450 5100
Wire Wire Line
	6500 5000 6400 5000
Wire Wire Line
	6400 5000 6400 5100
Connection ~ 6400 5100
Wire Wire Line
	6250 4650 6250 4750
Wire Wire Line
	6250 4700 6450 4700
Wire Wire Line
	6450 4700 6450 4900
Wire Wire Line
	6450 4900 6500 4900
Connection ~ 6250 4700
Wire Wire Line
	6250 5050 6250 5100
Connection ~ 6250 5100
Wire Wire Line
	7950 5800 7700 5800
Wire Wire Line
	2450 2400 2450 3150
Wire Wire Line
	2300 2750 2700 2750
Wire Wire Line
	2200 2850 2700 2850
Connection ~ 2450 2750
Wire Wire Line
	2200 3050 2700 3050
Connection ~ 2450 2850
Wire Wire Line
	2300 3150 2700 3150
Connection ~ 2450 3050
Connection ~ 2450 3150
Wire Wire Line
	2700 3350 2600 3350
Wire Wire Line
	2600 3350 2600 3750
Wire Wire Line
	2600 3450 2700 3450
Wire Wire Line
	2600 3550 2700 3550
Connection ~ 2600 3450
Wire Wire Line
	2600 3750 2700 3750
Connection ~ 2600 3550
Wire Wire Line
	2600 3500 2400 3500
Wire Wire Line
	2400 3500 2400 3650
Connection ~ 2600 3500
Wire Wire Line
	2100 3850 2100 3900
Connection ~ 2100 3850
Wire Wire Line
	2300 4050 2700 4050
Wire Wire Line
	2450 4050 2450 4100
Wire Wire Line
	1950 3850 2350 3850
Wire Wire Line
	2350 3850 2350 3950
Wire Wire Line
	2350 3950 2700 3950
Wire Wire Line
	2100 4200 2300 4200
Wire Wire Line
	2300 4200 2300 4050
Connection ~ 2450 4050
Wire Wire Line
	2400 4400 2600 4400
Wire Wire Line
	2600 4400 2600 4550
Wire Wire Line
	2600 4550 2700 4550
Wire Wire Line
	2400 4550 2550 4550
Wire Wire Line
	2550 4550 2550 4650
Wire Wire Line
	2550 4650 2700 4650
Wire Wire Line
	2400 4850 2700 4850
Wire Wire Line
	2400 4700 2500 4700
Wire Wire Line
	2500 4700 2500 4750
Wire Wire Line
	2500 4750 2700 4750
Wire Wire Line
	2550 5500 2650 5500
Wire Wire Line
	2650 5500 2650 5450
Wire Wire Line
	2650 5450 2700 5450
Wire Wire Line
	2700 5050 2200 5050
Wire Wire Line
	1900 5050 1700 5050
Wire Wire Line
	1700 5050 1700 4950
Wire Wire Line
	1700 4950 1050 4950
Wire Wire Line
	1700 5150 2700 5150
Wire Wire Line
	1700 5250 1700 5150
Wire Wire Line
	1250 5250 1700 5250
Wire Wire Line
	1250 5250 1250 5300
Connection ~ 1500 5250
Wire Wire Line
	1050 4950 1050 5300
Connection ~ 1500 4950
Wire Wire Line
	1050 5600 1050 5650
Wire Wire Line
	1050 5650 1250 5650
Connection ~ 1150 5650
Wire Wire Line
	1250 5650 1250 5600
Wire Wire Line
	2550 5350 2700 5350
Wire Wire Line
	2300 2750 2300 2650
Wire Wire Line
	2300 2650 2200 2650
Wire Wire Line
	2300 3150 2300 3250
Wire Wire Line
	2300 3250 2200 3250
Wire Wire Line
	1900 2450 1900 3400
Connection ~ 1900 2850
Connection ~ 1900 3050
Connection ~ 1900 3250
Wire Wire Line
	6500 5400 6150 5400
Wire Wire Line
	6500 5500 6200 5500
Wire Wire Line
	6200 5500 6200 5550
Wire Wire Line
	6200 5550 6150 5550
Wire Wire Line
	6500 5600 6250 5600
Wire Wire Line
	6250 5600 6250 5700
Wire Wire Line
	6250 5700 6150 5700
Wire Wire Line
	6500 5700 6300 5700
Wire Wire Line
	6300 5700 6300 5850
Wire Wire Line
	6300 5850 6150 5850
Wire Wire Line
	6500 5800 6350 5800
Wire Wire Line
	6350 5800 6350 6000
Wire Wire Line
	6350 6000 6150 6000
Connection ~ 10300 1100
Wire Wire Line
	10300 1600 10300 1650
Wire Wire Line
	10300 1950 10300 2000
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
	5000 1000 5050 1000
Wire Wire Line
	5050 1000 5050 950 
Wire Wire Line
	5050 950  5100 950 
Wire Wire Line
	5000 1100 5100 1100
Wire Wire Line
	5100 1400 5000 1400
Wire Wire Line
	2200 2450 2400 2450
Wire Wire Line
	2400 2450 2400 2550
Wire Wire Line
	2400 2550 2700 2550
Connection ~ 2450 2550
Connection ~ 1900 2650
Wire Wire Line
	7650 1100 7650 1150
Wire Wire Line
	7650 1850 7650 1900
Wire Wire Line
	7650 1450 7650 1550
Wire Wire Line
	7650 1500 7800 1500
Connection ~ 7650 1500
Text GLabel 7800 1500 2    60   Input ~ 0
BATT_MON
Wire Wire Line
	6900 1100 8600 1100
Text GLabel 4650 2850 2    60   Input ~ 0
BATT_MON
$Comp
L LCD_HD44780 U?
U 1 1 55638A7C
P 7200 3200
F 0 "U?" V 7250 3200 60  0000 C CNN
F 1 "LCD_HD44780" V 7150 3200 60  0000 C CNN
F 2 "" H 6450 3850 60  0000 C CNN
F 3 "" H 6450 3850 60  0000 C CNN
	1    7200 3200
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 5563E071
P 6500 2700
F 0 "#PWR?" H 6500 2550 50  0001 C CNN
F 1 "+3V3" H 6500 2840 50  0000 C CNN
F 2 "" H 6500 2700 60  0000 C CNN
F 3 "" H 6500 2700 60  0000 C CNN
	1    6500 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5563E174
P 6500 2800
F 0 "#PWR?" H 6500 2550 50  0001 C CNN
F 1 "GND" H 6500 2650 50  0000 C CNN
F 2 "" H 6500 2800 60  0000 C CNN
F 3 "" H 6500 2800 60  0000 C CNN
	1    6500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 6500 2800
$Comp
L POT RV?
U 1 1 5563E702
P 5800 3300
F 0 "RV?" H 5800 3200 50  0000 C CNN
F 1 "20k LIN" H 5800 3300 50  0000 C CNN
F 2 "" H 5800 3300 60  0000 C CNN
F 3 "" H 5800 3300 60  0000 C CNN
	1    5800 3300
	0    1    1    0   
$EndComp
$Comp
L +3V3 #PWR?
U 1 1 5563E7A7
P 5800 3000
F 0 "#PWR?" H 5800 2850 50  0001 C CNN
F 1 "+3V3" H 5800 3140 50  0000 C CNN
F 2 "" H 5800 3000 60  0000 C CNN
F 3 "" H 5800 3000 60  0000 C CNN
	1    5800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3000 5800 3050
$Comp
L GND #PWR?
U 1 1 5563E8D6
P 5800 3600
F 0 "#PWR?" H 5800 3350 50  0001 C CNN
F 1 "GND" H 5800 3450 50  0000 C CNN
F 2 "" H 5800 3600 60  0000 C CNN
F 3 "" H 5800 3600 60  0000 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 3600 5800 3550
Wire Wire Line
	5950 3300 6600 3300
Text GLabel 6550 3450 0    60   Input ~ 0
LCD_RS
Text GLabel 6550 3750 0    60   Input ~ 0
LCD_E
Text GLabel 8000 2700 2    60   Input ~ 0
LCD_DB0
Text GLabel 8000 3150 2    60   Input ~ 0
LCD_DB3
Text GLabel 8000 3000 2    60   Input ~ 0
LCD_DB2
Text GLabel 8000 2850 2    60   Input ~ 0
LCD_DB1
Text GLabel 8000 3300 2    60   Input ~ 0
LCD_DB4
Text GLabel 8000 3450 2    60   Input ~ 0
LCD_DB5
Text GLabel 8000 3600 2    60   Input ~ 0
LCD_DB6
Wire Wire Line
	7750 3150 8000 3150
Wire Wire Line
	7750 3050 7950 3050
Wire Wire Line
	7950 3050 7950 3000
Wire Wire Line
	7950 3000 8000 3000
Wire Wire Line
	7750 2950 7900 2950
Wire Wire Line
	7900 2950 7900 2850
Wire Wire Line
	7900 2850 8000 2850
Wire Wire Line
	7750 2850 7850 2850
Wire Wire Line
	7850 2850 7850 2700
Wire Wire Line
	7850 2700 8000 2700
Wire Wire Line
	7750 3250 7950 3250
Wire Wire Line
	7950 3250 7950 3300
Wire Wire Line
	7950 3300 8000 3300
Wire Wire Line
	7750 3350 7900 3350
Wire Wire Line
	7900 3350 7900 3450
Wire Wire Line
	7900 3450 8000 3450
Wire Wire Line
	7750 3450 7850 3450
Wire Wire Line
	7850 3450 7850 3600
Wire Wire Line
	7850 3600 8000 3600
Text GLabel 8000 3750 2    60   Input ~ 0
LCD_DB7
Wire Wire Line
	7750 3550 7800 3550
Wire Wire Line
	7800 3550 7800 3750
Wire Wire Line
	7800 3750 8000 3750
Text GLabel 4650 4650 2    60   Input ~ 0
LCD_DB0
Text GLabel 4650 5100 2    60   Input ~ 0
LCD_DB3
Text GLabel 4650 4950 2    60   Input ~ 0
LCD_DB2
Text GLabel 4650 4800 2    60   Input ~ 0
LCD_DB1
Text GLabel 4650 5250 2    60   Input ~ 0
LCD_DB4
Text GLabel 4650 5400 2    60   Input ~ 0
LCD_DB5
Text GLabel 4650 5550 2    60   Input ~ 0
LCD_DB6
Text GLabel 4650 5700 2    60   Input ~ 0
LCD_DB7
Text GLabel 4650 5950 2    60   Input ~ 0
LCD_RS
Text GLabel 4650 6100 2    60   Input ~ 0
LCD_E
$Comp
L +BATT #PWR?
U 1 1 55643D33
P 6150 3000
F 0 "#PWR?" H 6150 2850 50  0001 C CNN
F 1 "+BATT" H 6150 3140 50  0000 C CNN
F 2 "" H 6150 3000 60  0000 C CNN
F 3 "" H 6150 3000 60  0000 C CNN
	1    6150 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3000 6600 3000
$Comp
L GND #PWR?
U 1 1 55643E77
P 6150 3100
F 0 "#PWR?" H 6150 2850 50  0001 C CNN
F 1 "GND" H 6150 2950 50  0000 C CNN
F 2 "" H 6150 3100 60  0000 C CNN
F 3 "" H 6150 3100 60  0000 C CNN
	1    6150 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3100 6600 3100
Wire Wire Line
	6500 2700 6600 2700
Wire Wire Line
	6550 3450 6600 3450
Wire Wire Line
	6600 3450 6600 3500
Wire Wire Line
	6100 3600 6600 3600
Wire Wire Line
	6550 3750 6600 3750
Wire Wire Line
	6600 3750 6600 3700
$Comp
L RFM95W U?
U 1 1 55635406
P 7100 5300
F 0 "U?" V 7150 5300 60  0000 C CNN
F 1 "RFM95W" V 7050 5300 60  0000 C CNN
F 2 "" H 7100 5350 60  0000 C CNN
F 3 "" H 7100 5350 60  0000 C CNN
	1    7100 5300
	1    0    0    -1  
$EndComp
Text GLabel 7900 4750 2    60   Input ~ 0
RFM_DIO0
Text GLabel 7900 5050 2    60   Input ~ 0
RFM_DIO2
Text GLabel 7900 4900 2    60   Input ~ 0
RFM_DIO1
Text GLabel 7900 5200 2    60   Input ~ 0
RFM_DIO3
Text GLabel 7900 5350 2    60   Input ~ 0
RFM_DIO4
Text GLabel 7900 5500 2    60   Input ~ 0
RFM_DIO5
Wire Wire Line
	7700 5200 7900 5200
Wire Wire Line
	7700 5300 7850 5300
Wire Wire Line
	7850 5300 7850 5350
Wire Wire Line
	7850 5350 7900 5350
Wire Wire Line
	7700 5400 7800 5400
Wire Wire Line
	7800 5400 7800 5500
Wire Wire Line
	7800 5500 7900 5500
Wire Wire Line
	7700 5100 7850 5100
Wire Wire Line
	7850 5100 7850 5050
Wire Wire Line
	7850 5050 7900 5050
Wire Wire Line
	7700 5000 7800 5000
Wire Wire Line
	7800 5000 7800 4900
Wire Wire Line
	7800 4900 7900 4900
Wire Wire Line
	7700 4900 7750 4900
Wire Wire Line
	7750 4900 7750 4750
Wire Wire Line
	7750 4750 7900 4750
Text GLabel 4650 6350 2    60   Input ~ 0
RFM_DIO0
Text GLabel 4650 6650 2    60   Input ~ 0
RFM_DIO2
Text GLabel 4650 6500 2    60   Input ~ 0
RFM_DIO1
Text GLabel 4650 6800 2    60   Input ~ 0
RFM_DIO3
Text GLabel 4650 6950 2    60   Input ~ 0
RFM_DIO4
Text GLabel 4650 7100 2    60   Input ~ 0
RFM_DIO5
$Comp
L GND #PWR?
U 1 1 55638AFF
P 6100 3600
F 0 "#PWR?" H 6100 3350 50  0001 C CNN
F 1 "GND" H 6100 3450 50  0000 C CNN
F 2 "" H 6100 3600 60  0000 C CNN
F 3 "" H 6100 3600 60  0000 C CNN
	1    6100 3600
	1    0    0    -1  
$EndComp
Text GLabel 4650 3950 2    60   Input ~ 0
CH1_LED
Text GLabel 4650 4100 2    60   Input ~ 0
CH2_LED
Text GLabel 4650 4250 2    60   Input ~ 0
CH3_LED
Text GLabel 4650 4400 2    60   Input ~ 0
CH4_LED
$Comp
L CONN_01X04 P?
U 1 1 5563ADE4
P 10700 5850
F 0 "P?" H 10700 6100 50  0000 C CNN
F 1 "CONN_01X04" V 10800 5850 50  0000 C CNN
F 2 "" H 10700 5850 60  0000 C CNN
F 3 "" H 10700 5850 60  0000 C CNN
	1    10700 5850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P?
U 1 1 5563AE72
P 10700 4850
F 0 "P?" H 10700 5100 50  0000 C CNN
F 1 "CONN_01X04" V 10800 4850 50  0000 C CNN
F 2 "" H 10700 4850 60  0000 C CNN
F 3 "" H 10700 4850 60  0000 C CNN
	1    10700 4850
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P?
U 1 1 5563AEC9
P 10700 3950
F 0 "P?" H 10700 4200 50  0000 C CNN
F 1 "CONN_01X04" V 10800 3950 50  0000 C CNN
F 2 "" H 10700 3950 60  0000 C CNN
F 3 "" H 10700 3950 60  0000 C CNN
	1    10700 3950
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 P?
U 1 1 5563AF11
P 10700 3000
F 0 "P?" H 10700 3250 50  0000 C CNN
F 1 "CONN_01X04" V 10800 3000 50  0000 C CNN
F 2 "" H 10700 3000 60  0000 C CNN
F 3 "" H 10700 3000 60  0000 C CNN
	1    10700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	10500 3050 10350 3050
Connection ~ 10350 3150
Wire Wire Line
	10500 4000 10350 4000
Connection ~ 10350 4100
Wire Wire Line
	10350 4900 10500 4900
Connection ~ 10350 5000
Wire Wire Line
	10500 5900 10350 5900
Connection ~ 10350 6000
Text GLabel 10050 5850 0    60   Input ~ 0
CH4_LED
Wire Wire Line
	10050 5850 10100 5850
Wire Wire Line
	10100 5850 10100 5800
Wire Wire Line
	10100 5800 10500 5800
Text GLabel 10050 4850 0    60   Input ~ 0
CH3_LED
Wire Wire Line
	10050 4850 10100 4850
Wire Wire Line
	10100 4850 10100 4800
Wire Wire Line
	10100 4800 10500 4800
Text GLabel 10050 3950 0    60   Input ~ 0
CH2_LED
Wire Wire Line
	10050 3950 10100 3950
Wire Wire Line
	10100 3950 10100 3900
Wire Wire Line
	10100 3900 10500 3900
Text GLabel 10050 3000 0    60   Input ~ 0
CH1_LED
Wire Wire Line
	10050 3000 10100 3000
Wire Wire Line
	10100 3000 10100 2950
Wire Wire Line
	10100 2950 10500 2950
$EndSCHEMATC
