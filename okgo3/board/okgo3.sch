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
LIBS:er-tft024-3
LIBS:rgb_bl
LIBS:bq24232ha
LIBS:touch_r
LIBS:ar1021
LIBS:okgo3-cache
EELAYER 26 0
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
L ER-TFT024-3 U?
U 1 1 58B5E9C3
P 9950 2250
F 0 "U?" H 9850 3397 60  0000 C CNN
F 1 "ER-TFT024-3" H 9850 3291 60  0000 C CNN
F 2 "" H 7150 400 60  0001 C CNN
F 3 "" H 7150 400 60  0001 C CNN
	1    9950 2250
	1    0    0    -1  
$EndComp
$Comp
L RGB_BL U?
U 1 1 58B5EB00
P 9900 3850
F 0 "U?" H 10077 3908 60  0000 L CNN
F 1 "RGB_BL" H 10077 3802 60  0000 L CNN
F 2 "" H 3500 -1200 60  0001 C CNN
F 3 "" H 3500 -1200 60  0001 C CNN
	1    9900 3850
	1    0    0    -1  
$EndComp
$Comp
L BQ24232HA IC?
U 1 1 58B5EB6D
P 4450 2400
F 0 "IC?" H 4450 3225 50  0000 C CNN
F 1 "BQ24232HA" H 4450 3134 50  0000 C CNN
F 2 "agg:QFN-16-EP-TI" H -2150 -3750 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/bq24232ha.pdf" H -2150 -3850 50  0001 L CNN
F 4 "2576286" H -2150 -3950 50  0001 L CNN "Farnell"
	1    4450 2400
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 58B5EC09
P 1800 1250
F 0 "P?" H 1719 975 50  0000 C CNN
F 1 "BATT" H 1719 1066 50  0000 C CNN
F 2 "" H -1800 -1400 50  0000 C CNN
F 3 "" H -1800 -1400 50  0000 C CNN
	1    1800 1250
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 58B5ED3D
P 1800 1850
F 0 "P?" H 1719 1575 50  0000 C CNN
F 1 "SW_PWR" H 1719 1666 50  0000 C CNN
F 2 "" H -2700 900 50  0000 C CNN
F 3 "" H -2700 900 50  0000 C CNN
	1    1800 1850
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X02 P?
U 1 1 58B5EED0
P 1850 2450
F 0 "P?" H 1769 2175 50  0000 C CNN
F 1 "SW_KEY" H 1769 2266 50  0000 C CNN
F 2 "" H -100 300 50  0000 C CNN
F 3 "" H -100 300 50  0000 C CNN
	1    1850 2450
	-1   0    0    1   
$EndComp
$Comp
L TOUCH_R U?
U 1 1 58B5F2A6
P 9900 4400
F 0 "U?" H 10077 4458 60  0000 L CNN
F 1 "TOUCH_R" H 10077 4352 60  0000 L CNN
F 2 "" H -100 -50 60  0001 C CNN
F 3 "" H -100 -50 60  0001 C CNN
	1    9900 4400
	1    0    0    -1  
$EndComp
$Comp
L AR1021 IC?
U 1 1 58B5F561
P 8000 5300
F 0 "IC?" H 8000 6125 50  0000 C CNN
F 1 "AR1021" H 8000 6034 50  0000 C CNN
F 2 "agg:SSOP-20" H 1700 -300 50  0001 L CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/40001393C.pdf" H 1700 -400 50  0001 L CNN
F 4 "2218568" H 1700 -500 50  0001 L CNN "Farnell"
	1    8000 5300
	1    0    0    -1  
$EndComp
$EndSCHEMATC
