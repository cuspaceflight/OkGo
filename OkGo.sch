EESchema Schematic File Version 2  date 25/11/2012 13:21:58
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
LIBS:special
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
LIBS:OkGo-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "25 nov 2012"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 550  4750 0    60   ~ 0
IGNITION
Text Notes 700  3550 0    60   ~ 0
OXID\nVALVE
$Comp
L R R?
U 1 1 50B219E4
P 1000 4750
F 0 "R?" V 1080 4750 50  0000 C CNN
F 1 "R" V 1000 4750 50  0000 C CNN
	1    1000 4750
	1    0    0    -1  
$EndComp
$Comp
L R R?
U 1 1 50B219DE
P 1000 3550
F 0 "R?" V 1080 3550 50  0000 C CNN
F 1 "R" V 1000 3550 50  0000 C CNN
	1    1000 3550
	1    0    0    -1  
$EndComp
$Comp
L RELAY_2RT K?
U 1 1 50B219CD
P 2400 4850
F 0 "K?" H 2350 5250 70  0000 C CNN
F 1 "RELAY_2RT" H 2550 4350 70  0000 C CNN
	1    2400 4850
	1    0    0    -1  
$EndComp
$Comp
L RELAY_2RT K?
U 1 1 50B219C6
P 2400 3600
F 0 "K?" H 2350 4000 70  0000 C CNN
F 1 "RELAY_2RT" H 2550 3100 70  0000 C CNN
	1    2400 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2700 4250 2700
Wire Wire Line
	4250 2700 4250 2400
Wire Wire Line
	3650 2400 3650 2700
Wire Wire Line
	3650 2700 3850 2700
$Comp
L CONN_2 P?
U 1 1 50B21968
P 3950 3300
F 0 "P?" V 3900 3300 40  0000 C CNN
F 1 "CONN_2" V 4000 3300 40  0000 C CNN
	1    3950 3300
	0    1    -1   0   
$EndComp
$Comp
L CONN_2 P?
U 1 1 50B21962
P 3950 3050
F 0 "P?" V 3900 3050 40  0000 C CNN
F 1 "CONN_2" V 4000 3050 40  0000 C CNN
	1    3950 3050
	0    1    1    0   
$EndComp
$Comp
L BATTERY BT?
U 1 1 50B2192F
P 3950 2400
F 0 "BT?" H 3950 2600 50  0000 C CNN
F 1 "BATTERY" H 3950 2210 50  0000 C CNN
	1    3950 2400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
