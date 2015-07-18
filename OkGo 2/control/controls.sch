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
LIBS:meu1s0303zc
LIBS:part
LIBS:lipo_1s
LIBS:spst_small
LIBS:push_illum
LIBS:push_illum_straight
LIBS:control-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
L CONN_01X04 P201
U 1 1 559EE152
P 3400 2150
F 0 "P201" H 3400 2400 50  0000 C CNN
F 1 "CH1" H 3400 1900 50  0000 C CNN
F 2 "" H 3400 2150 60  0000 C CNN
F 3 "" H 3400 2150 60  0000 C CNN
F 4 "1830737" H 3400 2150 60  0001 C CNN "Farnell"
	1    3400 2150
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q201
U 1 1 559EE1CE
P 2200 2500
F 0 "Q201" H 2500 2550 50  0000 R CNN
F 1 "BSS138BK" H 2800 2450 50  0000 R CNN
F 2 "" H 2400 2600 29  0000 C CNN
F 3 "" H 2200 2500 60  0000 C CNN
F 4 "2053833" H 2200 2500 60  0001 C CNN "Farnell"
	1    2200 2500
	1    0    0    -1  
$EndComp
$Comp
L R R203
U 1 1 559EE1D6
P 1750 2500
F 0 "R203" V 1850 2500 50  0000 C CNN
F 1 "180R" V 1650 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 2500 30  0001 C CNN
F 3 "" H 1750 2500 30  0000 C CNN
F 4 "2331786" H 1750 2500 60  0001 C CNN "Farnell"
	1    1750 2500
	0    1    1    0   
$EndComp
$Comp
L R R205
U 1 1 559EE1DD
P 1950 2700
F 0 "R205" V 2050 2700 50  0000 C CNN
F 1 "100k" V 1850 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1880 2700 30  0001 C CNN
F 3 "" H 1950 2700 30  0000 C CNN
F 4 "2331783" H 1950 2700 60  0001 C CNN "Farnell"
	1    1950 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR207
U 1 1 559EE1E4
P 1950 2900
F 0 "#PWR207" H 1950 2650 50  0001 C CNN
F 1 "GND" H 1950 2750 50  0000 C CNN
F 2 "" H 1950 2900 60  0000 C CNN
F 3 "" H 1950 2900 60  0000 C CNN
	1    1950 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR208
U 1 1 559EE1EA
P 2300 2900
F 0 "#PWR208" H 2300 2650 50  0001 C CNN
F 1 "GND" H 2300 2750 50  0000 C CNN
F 2 "" H 2300 2900 60  0000 C CNN
F 3 "" H 2300 2900 60  0000 C CNN
	1    2300 2900
	1    0    0    -1  
$EndComp
$Comp
L R R201
U 1 1 559EE1FB
P 2950 1750
F 0 "R201" V 3050 1750 50  0000 C CNN
F 1 "10k" V 2850 1750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 1750 30  0001 C CNN
F 3 "" H 2950 1750 30  0000 C CNN
F 4 "2331808" H 2950 1750 60  0001 C CNN "Farnell"
	1    2950 1750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR201
U 1 1 559EE202
P 2950 1550
F 0 "#PWR201" H 2950 1400 50  0001 C CNN
F 1 "+3V3" H 2950 1690 50  0000 C CNN
F 2 "" H 2950 1550 60  0000 C CNN
F 3 "" H 2950 1550 60  0000 C CNN
	1    2950 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR205
U 1 1 559EE20C
P 2300 2200
F 0 "#PWR205" H 2300 2050 50  0001 C CNN
F 1 "+5V" H 2300 2340 50  0000 C CNN
F 2 "" H 2300 2200 60  0000 C CNN
F 3 "" H 2300 2200 60  0000 C CNN
	1    2300 2200
	1    0    0    -1  
$EndComp
Text HLabel 1600 2500 0    60   Input ~ 0
CH1_LED
Text HLabel 2900 2000 0    60   Output ~ 0
CH1_SW
$Comp
L CONN_01X04 P202
U 1 1 559F1DAA
P 3550 2150
F 0 "P202" H 3550 2400 50  0000 C CNN
F 1 "CH1" H 3550 1900 50  0000 C CNN
F 2 "" H 3550 2150 60  0000 C CNN
F 3 "" H 3550 2150 60  0000 C CNN
F 4 "1830729" H 3550 2150 60  0001 C CNN "Farnell"
	1    3550 2150
	-1   0    0    -1  
$EndComp
$Comp
L PUSH_ILLUM U201
U 1 1 559F249C
P 4150 1900
F 0 "U201" H 3850 1900 60  0000 C CNN
F 1 "RED" H 4150 1450 60  0000 C CNN
F 2 "" H 4150 1900 60  0000 C CNN
F 3 "" H 4150 1900 60  0000 C CNN
F 4 "SW04847" H 4150 1900 60  0001 C CNN "Farnell"
	1    4150 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1550 2950 1600
Wire Wire Line
	2950 2000 2950 1900
Connection ~ 2950 2000
Wire Wire Line
	2300 2700 2300 2900
Wire Wire Line
	1950 2850 1950 2900
Wire Wire Line
	1900 2500 2000 2500
Wire Wire Line
	1950 2500 1950 2550
Connection ~ 1950 2500
$Comp
L GND #PWR203
U 1 1 559EE1F2
P 2950 2050
F 0 "#PWR203" H 2950 1800 50  0001 C CNN
F 1 "GND" H 2950 1900 50  0001 C CNN
F 2 "" H 2950 2050 60  0000 C CNN
F 3 "" H 2950 2050 60  0000 C CNN
	1    2950 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2000 3200 2000
Wire Wire Line
	2300 2200 3200 2200
Wire Wire Line
	2950 2050 3050 2050
Wire Wire Line
	3050 2050 3050 2100
Wire Wire Line
	3050 2100 3200 2100
Wire Wire Line
	2300 2300 3200 2300
$Comp
L CONN_01X04 P205
U 1 1 559F3714
P 3400 4950
F 0 "P205" H 3400 5200 50  0000 C CNN
F 1 "CH2" H 3400 4700 50  0000 C CNN
F 2 "" H 3400 4950 60  0000 C CNN
F 3 "" H 3400 4950 60  0000 C CNN
F 4 "1830737" H 3400 4950 60  0001 C CNN "Farnell"
	1    3400 4950
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q203
U 1 1 559F371B
P 2200 5300
F 0 "Q203" H 2500 5350 50  0000 R CNN
F 1 "BSS138BK" H 2800 5250 50  0000 R CNN
F 2 "" H 2400 5400 29  0000 C CNN
F 3 "" H 2200 5300 60  0000 C CNN
F 4 "2053833" H 2200 5300 60  0001 C CNN "Farnell"
	1    2200 5300
	1    0    0    -1  
$EndComp
$Comp
L R R209
U 1 1 559F3722
P 1750 5300
F 0 "R209" V 1850 5300 50  0000 C CNN
F 1 "180R" V 1650 5300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1680 5300 30  0001 C CNN
F 3 "" H 1750 5300 30  0000 C CNN
F 4 "2331786" H 1750 5300 60  0001 C CNN "Farnell"
	1    1750 5300
	0    1    1    0   
$EndComp
$Comp
L R R211
U 1 1 559F3729
P 1950 5500
F 0 "R211" V 2050 5500 50  0000 C CNN
F 1 "100k" V 1850 5500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 1880 5500 30  0001 C CNN
F 3 "" H 1950 5500 30  0000 C CNN
F 4 "2331783" H 1950 5500 60  0001 C CNN "Farnell"
	1    1950 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR217
U 1 1 559F372F
P 1950 5700
F 0 "#PWR217" H 1950 5450 50  0001 C CNN
F 1 "GND" H 1950 5550 50  0000 C CNN
F 2 "" H 1950 5700 60  0000 C CNN
F 3 "" H 1950 5700 60  0000 C CNN
	1    1950 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR218
U 1 1 559F3735
P 2300 5700
F 0 "#PWR218" H 2300 5450 50  0001 C CNN
F 1 "GND" H 2300 5550 50  0000 C CNN
F 2 "" H 2300 5700 60  0000 C CNN
F 3 "" H 2300 5700 60  0000 C CNN
	1    2300 5700
	1    0    0    -1  
$EndComp
$Comp
L R R207
U 1 1 559F373C
P 2950 4550
F 0 "R207" V 3050 4550 50  0000 C CNN
F 1 "10k" V 2850 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2880 4550 30  0001 C CNN
F 3 "" H 2950 4550 30  0000 C CNN
F 4 "2331808" H 2950 4550 60  0001 C CNN "Farnell"
	1    2950 4550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR211
U 1 1 559F3742
P 2950 4350
F 0 "#PWR211" H 2950 4200 50  0001 C CNN
F 1 "+3V3" H 2950 4490 50  0000 C CNN
F 2 "" H 2950 4350 60  0000 C CNN
F 3 "" H 2950 4350 60  0000 C CNN
	1    2950 4350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR215
U 1 1 559F3748
P 2300 5000
F 0 "#PWR215" H 2300 4850 50  0001 C CNN
F 1 "+5V" H 2300 5140 50  0000 C CNN
F 2 "" H 2300 5000 60  0000 C CNN
F 3 "" H 2300 5000 60  0000 C CNN
	1    2300 5000
	1    0    0    -1  
$EndComp
Text HLabel 1600 5300 0    60   Input ~ 0
CH2_LED
Text HLabel 2900 4800 0    60   Output ~ 0
CH2_SW
$Comp
L CONN_01X04 P206
U 1 1 559F3750
P 3550 4950
F 0 "P206" H 3550 5200 50  0000 C CNN
F 1 "CH2" H 3550 4700 50  0000 C CNN
F 2 "" H 3550 4950 60  0000 C CNN
F 3 "" H 3550 4950 60  0000 C CNN
F 4 "1830729" H 3550 4950 60  0001 C CNN "Farnell"
	1    3550 4950
	-1   0    0    -1  
$EndComp
$Comp
L PUSH_ILLUM U203
U 1 1 559F3756
P 4150 4700
F 0 "U203" H 3850 4700 60  0000 C CNN
F 1 "GREEN" H 3900 4200 60  0000 C CNN
F 2 "" H 4150 4700 60  0000 C CNN
F 3 "" H 4150 4700 60  0000 C CNN
F 4 "SW04848" H 4150 4700 60  0001 C CNN "Farnell"
	1    4150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4350 2950 4400
Wire Wire Line
	2950 4800 2950 4700
Connection ~ 2950 4800
Wire Wire Line
	2300 5500 2300 5700
Wire Wire Line
	1950 5650 1950 5700
Wire Wire Line
	1900 5300 2000 5300
Wire Wire Line
	1950 5300 1950 5350
Connection ~ 1950 5300
$Comp
L GND #PWR213
U 1 1 559F3764
P 2950 4850
F 0 "#PWR213" H 2950 4600 50  0001 C CNN
F 1 "GND" H 2950 4700 50  0001 C CNN
F 2 "" H 2950 4850 60  0000 C CNN
F 3 "" H 2950 4850 60  0000 C CNN
	1    2950 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4800 3200 4800
Wire Wire Line
	2300 5000 3200 5000
Wire Wire Line
	2950 4850 3050 4850
Wire Wire Line
	3050 4850 3050 4900
Wire Wire Line
	3050 4900 3200 4900
Wire Wire Line
	2300 5100 3200 5100
$Comp
L CONN_01X04 P203
U 1 1 559F3AAA
P 7900 2150
F 0 "P203" H 7900 2400 50  0000 C CNN
F 1 "CH3" H 7900 1900 50  0000 C CNN
F 2 "" H 7900 2150 60  0000 C CNN
F 3 "" H 7900 2150 60  0000 C CNN
F 4 "1830737" H 7900 2150 60  0001 C CNN "Farnell"
	1    7900 2150
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q202
U 1 1 559F3AB1
P 6700 2500
F 0 "Q202" H 7000 2550 50  0000 R CNN
F 1 "BSS138BK" H 7300 2450 50  0000 R CNN
F 2 "" H 6900 2600 29  0000 C CNN
F 3 "" H 6700 2500 60  0000 C CNN
F 4 "2053833" H 6700 2500 60  0001 C CNN "Farnell"
	1    6700 2500
	1    0    0    -1  
$EndComp
$Comp
L R R204
U 1 1 559F3AB8
P 6250 2500
F 0 "R204" V 6350 2500 50  0000 C CNN
F 1 "180R" V 6150 2500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6180 2500 30  0001 C CNN
F 3 "" H 6250 2500 30  0000 C CNN
F 4 "2331786" H 6250 2500 60  0001 C CNN "Farnell"
	1    6250 2500
	0    1    1    0   
$EndComp
$Comp
L R R206
U 1 1 559F3ABF
P 6450 2700
F 0 "R206" V 6550 2700 50  0000 C CNN
F 1 "100k" V 6350 2700 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6380 2700 30  0001 C CNN
F 3 "" H 6450 2700 30  0000 C CNN
F 4 "2331783" H 6450 2700 60  0001 C CNN "Farnell"
	1    6450 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR209
U 1 1 559F3AC5
P 6450 2900
F 0 "#PWR209" H 6450 2650 50  0001 C CNN
F 1 "GND" H 6450 2750 50  0000 C CNN
F 2 "" H 6450 2900 60  0000 C CNN
F 3 "" H 6450 2900 60  0000 C CNN
	1    6450 2900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR210
U 1 1 559F3ACB
P 6800 2900
F 0 "#PWR210" H 6800 2650 50  0001 C CNN
F 1 "GND" H 6800 2750 50  0000 C CNN
F 2 "" H 6800 2900 60  0000 C CNN
F 3 "" H 6800 2900 60  0000 C CNN
	1    6800 2900
	1    0    0    -1  
$EndComp
$Comp
L R R202
U 1 1 559F3AD2
P 7450 1750
F 0 "R202" V 7550 1750 50  0000 C CNN
F 1 "10k" V 7350 1750 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7380 1750 30  0001 C CNN
F 3 "" H 7450 1750 30  0000 C CNN
F 4 "2331808" H 7450 1750 60  0001 C CNN "Farnell"
	1    7450 1750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR202
U 1 1 559F3AD8
P 7450 1550
F 0 "#PWR202" H 7450 1400 50  0001 C CNN
F 1 "+3V3" H 7450 1690 50  0000 C CNN
F 2 "" H 7450 1550 60  0000 C CNN
F 3 "" H 7450 1550 60  0000 C CNN
	1    7450 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR206
U 1 1 559F3ADE
P 6800 2200
F 0 "#PWR206" H 6800 2050 50  0001 C CNN
F 1 "+5V" H 6800 2340 50  0000 C CNN
F 2 "" H 6800 2200 60  0000 C CNN
F 3 "" H 6800 2200 60  0000 C CNN
	1    6800 2200
	1    0    0    -1  
$EndComp
Text HLabel 6100 2500 0    60   Input ~ 0
CH3_LED
Text HLabel 7400 2000 0    60   Output ~ 0
CH3_SW
$Comp
L CONN_01X04 P204
U 1 1 559F3AE6
P 8050 2150
F 0 "P204" H 8050 2400 50  0000 C CNN
F 1 "CH3" H 8050 1900 50  0000 C CNN
F 2 "" H 8050 2150 60  0000 C CNN
F 3 "" H 8050 2150 60  0000 C CNN
F 4 "1830729" H 8050 2150 60  0001 C CNN "Farnell"
	1    8050 2150
	-1   0    0    -1  
$EndComp
$Comp
L PUSH_ILLUM U202
U 1 1 559F3AEC
P 8650 1900
F 0 "U202" H 8350 1900 60  0000 C CNN
F 1 "BLUE" H 8400 1400 60  0000 C CNN
F 2 "" H 8650 1900 60  0000 C CNN
F 3 "" H 8650 1900 60  0000 C CNN
F 4 "SW04849" H 8650 1900 60  0001 C CNN "Farnell"
	1    8650 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1550 7450 1600
Wire Wire Line
	7450 2000 7450 1900
Connection ~ 7450 2000
Wire Wire Line
	6800 2700 6800 2900
Wire Wire Line
	6450 2850 6450 2900
Wire Wire Line
	6400 2500 6500 2500
Wire Wire Line
	6450 2500 6450 2550
Connection ~ 6450 2500
$Comp
L GND #PWR204
U 1 1 559F3AFA
P 7450 2050
F 0 "#PWR204" H 7450 1800 50  0001 C CNN
F 1 "GND" H 7450 1900 50  0001 C CNN
F 2 "" H 7450 2050 60  0000 C CNN
F 3 "" H 7450 2050 60  0000 C CNN
	1    7450 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2000 7700 2000
Wire Wire Line
	6800 2200 7700 2200
Wire Wire Line
	7450 2050 7550 2050
Wire Wire Line
	7550 2050 7550 2100
Wire Wire Line
	7550 2100 7700 2100
Wire Wire Line
	6800 2300 7700 2300
$Comp
L CONN_01X04 P207
U 1 1 559F3DDE
P 8000 4950
F 0 "P207" H 8000 5200 50  0000 C CNN
F 1 "CH4" H 8000 4700 50  0000 C CNN
F 2 "" H 8000 4950 60  0000 C CNN
F 3 "" H 8000 4950 60  0000 C CNN
F 4 "1830737" H 8000 4950 60  0001 C CNN "Farnell"
	1    8000 4950
	1    0    0    -1  
$EndComp
$Comp
L Q_NMOS_DGS Q204
U 1 1 559F3DE5
P 6800 5300
F 0 "Q204" H 7100 5350 50  0000 R CNN
F 1 "BSS138BK" H 7400 5250 50  0000 R CNN
F 2 "" H 7000 5400 29  0000 C CNN
F 3 "" H 6800 5300 60  0000 C CNN
F 4 "2053833" H 6800 5300 60  0001 C CNN "Farnell"
	1    6800 5300
	1    0    0    -1  
$EndComp
$Comp
L R R210
U 1 1 559F3DEC
P 6350 5300
F 0 "R210" V 6450 5300 50  0000 C CNN
F 1 "180R" V 6250 5300 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6280 5300 30  0001 C CNN
F 3 "" H 6350 5300 30  0000 C CNN
F 4 "2331786" H 6350 5300 60  0001 C CNN "Farnell"
	1    6350 5300
	0    1    1    0   
$EndComp
$Comp
L R R212
U 1 1 559F3DF3
P 6550 5500
F 0 "R212" V 6650 5500 50  0000 C CNN
F 1 "100k" V 6450 5500 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 6480 5500 30  0001 C CNN
F 3 "" H 6550 5500 30  0000 C CNN
F 4 "2331783" H 6550 5500 60  0001 C CNN "Farnell"
	1    6550 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR219
U 1 1 559F3DF9
P 6550 5700
F 0 "#PWR219" H 6550 5450 50  0001 C CNN
F 1 "GND" H 6550 5550 50  0000 C CNN
F 2 "" H 6550 5700 60  0000 C CNN
F 3 "" H 6550 5700 60  0000 C CNN
	1    6550 5700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR220
U 1 1 559F3DFF
P 6900 5700
F 0 "#PWR220" H 6900 5450 50  0001 C CNN
F 1 "GND" H 6900 5550 50  0000 C CNN
F 2 "" H 6900 5700 60  0000 C CNN
F 3 "" H 6900 5700 60  0000 C CNN
	1    6900 5700
	1    0    0    -1  
$EndComp
$Comp
L R R208
U 1 1 559F3E06
P 7550 4550
F 0 "R208" V 7650 4550 50  0000 C CNN
F 1 "10k" V 7450 4550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 7480 4550 30  0001 C CNN
F 3 "" H 7550 4550 30  0000 C CNN
F 4 "2331808" H 7550 4550 60  0001 C CNN "Farnell"
	1    7550 4550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR212
U 1 1 559F3E0C
P 7550 4350
F 0 "#PWR212" H 7550 4200 50  0001 C CNN
F 1 "+3V3" H 7550 4490 50  0000 C CNN
F 2 "" H 7550 4350 60  0000 C CNN
F 3 "" H 7550 4350 60  0000 C CNN
	1    7550 4350
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR216
U 1 1 559F3E12
P 6900 5000
F 0 "#PWR216" H 6900 4850 50  0001 C CNN
F 1 "+5V" H 6900 5140 50  0000 C CNN
F 2 "" H 6900 5000 60  0000 C CNN
F 3 "" H 6900 5000 60  0000 C CNN
	1    6900 5000
	1    0    0    -1  
$EndComp
Text HLabel 6200 5300 0    60   Input ~ 0
CH4_LED
Text HLabel 7500 4800 0    60   Output ~ 0
CH4_SW
$Comp
L CONN_01X04 P208
U 1 1 559F3E1A
P 8150 4950
F 0 "P208" H 8150 5200 50  0000 C CNN
F 1 "CH4" H 8150 4700 50  0000 C CNN
F 2 "" H 8150 4950 60  0000 C CNN
F 3 "" H 8150 4950 60  0000 C CNN
F 4 "1830729" H 8150 4950 60  0001 C CNN "Farnell"
	1    8150 4950
	-1   0    0    -1  
$EndComp
$Comp
L PUSH_ILLUM U204
U 1 1 559F3E20
P 8750 4700
F 0 "U204" H 8450 4700 60  0000 C CNN
F 1 "WHITE" H 8500 4200 60  0000 C CNN
F 2 "" H 8750 4700 60  0000 C CNN
F 3 "" H 8750 4700 60  0000 C CNN
F 4 "SW04850" H 8750 4700 60  0001 C CNN "Farnell"
	1    8750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4350 7550 4400
Wire Wire Line
	7550 4800 7550 4700
Connection ~ 7550 4800
Wire Wire Line
	6900 5500 6900 5700
Wire Wire Line
	6550 5650 6550 5700
Wire Wire Line
	6500 5300 6600 5300
Wire Wire Line
	6550 5300 6550 5350
Connection ~ 6550 5300
$Comp
L GND #PWR214
U 1 1 559F3E2E
P 7550 4850
F 0 "#PWR214" H 7550 4600 50  0001 C CNN
F 1 "GND" H 7550 4700 50  0001 C CNN
F 2 "" H 7550 4850 60  0000 C CNN
F 3 "" H 7550 4850 60  0000 C CNN
	1    7550 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4800 7800 4800
Wire Wire Line
	6900 5000 7800 5000
Wire Wire Line
	7550 4850 7650 4850
Wire Wire Line
	7650 4850 7650 4900
Wire Wire Line
	7650 4900 7800 4900
Wire Wire Line
	6900 5100 7800 5100
Text Notes 3450 2500 2    60   ~ 0
HEADER
Text Notes 3500 2500 0    60   ~ 0
HOUSING
Text Notes 7950 2500 2    60   ~ 0
HEADER
Text Notes 8000 2500 0    60   ~ 0
HOUSING
Text Notes 8050 5300 2    60   ~ 0
HEADER
Text Notes 8100 5300 0    60   ~ 0
HOUSING
Text Notes 3450 5300 2    60   ~ 0
HEADER
Text Notes 3500 5300 0    60   ~ 0
HOUSING
$EndSCHEMATC
