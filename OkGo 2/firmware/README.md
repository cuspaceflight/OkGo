OkGo2 Firmware
==============

# Getting started
## Grab the toolchain:
`sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded`
`sudo apt-get update`
`sudo apt-get install gcc-arm-none-eabi`

## Build libopencm3
* Run `git submodule update --init` to grab the libopencm3 repo
* Run `make` in `libopencm3/`
* **IF YOU FORGET THE PREVIOUS STEP YOU WILL GET MYSTERIOUS BUILD ERRORS LIKE**
  `No rule to make target 'main.elf'`.

# Workflow
## Building firmware
* Run `make` in `control/` or `ignition/` as appropriate

## Programming
* `make flash` in `control/` or `ignition/` to program appropriate firmware
  using a BlackMagic programmer.
