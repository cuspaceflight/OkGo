# OkGo 3
## Features
* Single channel
* Continuity measurement
* Constant 4A current firing for e-matches
* Built-in battery (3.7V 2Ah)
* Charge from USB (400mA)
* Small and light
* Maybe easily detachable BNC antennas?
* Config and firmware upgrade over USB?

## Parts
* Case: Hammond 1553WCGY for control. Peli 1010 clear/yellow for ignition
* Battery: Cool Components 157 (Charge 400mA discharge 4A).
* Battery management bq24232HA
* Antenna: RF00075 ? Because it'll be easily detachable? But you really want it
  to be VPOL. And it's gross to put the BNC on the top.  Maybe same pivot
  swivel as on OkGo 2 Ignition?
* USB-B for charging because it's easy to clean the gunk out of.
* Ignition and control have touchscreen: ERC12864F7-4

## Thoughts
* Make both PCBs the same? They share the radio, battery, charging,
  on/off switch, case, USB, display and touchscreen
* Differences is ignition has banana jacks, control has fire button and
  keyswitch.
* Board-mount antenna connector on one end and cable-mount USB on other end
* Board mount nana jacks on front face or on one end?
* Control has display with touchscreen mounted to PCB which is mounted to top
  of the case, making display flush with top of case.  Antenna is an end-mount
  SMA which pokes out the end-panel.  Similarly for end-mount USB-B.
  Keyswitch, power switch and fire button???
* Ignition's touchscren is mounted to the board which sits in a sled in the
  bottom half of the peli - it's only accessible when you open the case.
  Charge USB is internal use only.  End-mount SMA goes to a pigtail to the
  external panel-mounted antenna SMA.
* Both have batteries mounted to the bottom of the PCB using a double-sided
  glue pad or possibly adhesive velcros.  Control's battery is in a void in the
  case, ignition's battery sits in a cut-out in the 3d printed sled.
