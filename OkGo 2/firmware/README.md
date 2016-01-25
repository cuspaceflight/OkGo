OkGo2 Firmware
==============

# Getting started
## Grab the toolchain:
`sudo add-apt-repository ppa:terry.guo/gcc-arm-embedded`
`sudo apt-get update`
`sudo apt-get install gcc-arm-none-eabi`

**IF YOU FORGET TO ADD THE TERRY.GUO REPO YOU WILL GET MYSTERIOUS BUILD ERRORS
LIKE** `arm-none-eabi-gcc: error: nano.specs: No such file or directory`

## Build libopencm3
* Run `git submodule update --init` to grab the libopencm3 repo
* Run `make` in `libopencm3/`
* **IF YOU FORGET THE PREVIOUS STEP YOU WILL GET MYSTERIOUS BUILD ERRORS LIKE**
  `No rule to make target 'main.elf'`.

## Setting a key
To authenticate both sides of the link, a symmetric pre-shared key is used.
This is stored in `common/key.h`.  An example file is provided at
`common/key_template.h`.  **The firmware will not build until a key
is set**.  To do this, copy `key_template.h` to `key.h`, change the key to
something random, and uncomment the relevant lines.

# Workflow
## Building firmware
* Run `make` in `control/` or `ignition/` as appropriate

## Programming
* `make flash` in `control/` or `ignition/` to program appropriate firmware
  using a BlackMagic programmer.

## Debugging
* More detailed info [_here_](http://darkdust.net/files/GDB%20Cheat%20Sheet.pdf)

### Getting started
* `make debug` to get an interactive debug session
* `arm-none-eabi-gdb foo.elf` or interactively `load foo.elf` and `file foo.elf`

### Printing info
* `p foo` / `print foo` to print `foo` in the current context
* `p/x foo` to print `foo` in hex

### Running
* `run` to run from beginning until break
* `start` to run until first line of `main()`
* `n` / `next` to step to next line
* `s` / `step` to step into a function
* `call myfunc()` to call a function

### Breaking
* `ctrl+c` to break wherever we happen to be
* `b function` / `b file.c:123` to add breakpoints on function call or line.
* `watch x` to break on change to variable `x`
* `d 1` to delete breakpoint 1
* `bt` / `where` for backtrace at current point

