#General Layout
 * Two boxes, *Control* (people end) and *Ignition* (rocket end)
 * 4 generic channels
 * AVR or Arduino pro-mini for control on each side.
 * Probably make each board with a custom PCB with everything onboard
 * Both boxes IP64/65 -- dust tight, protected against casual water ingress
 * Might be cute if the boxes can attach to a camera tripod -- apparent the
  thead on this is "1/4-20 UNC" for standard consumer tripods.

#Radio Link
 * Up to 500m apart on vaguely flat terrain with no particularly gnarly
  blockages inbetween
 * SMA-mount swivel rubber ducky antennas on each end.
 * LORA sounds like a good thing for the radio link -- spread spectrum
   goodness.
 * 868MHz would be nicer than 433MHz so we can stay away from FRS/ham radios
 * Might as well go with 20dBm = 100mW if we can.
 * [HopeRF RFM95W-868](http://www.hoperf.co.uk/shop/RFM95W-868S2-RFM95W_868S2.html)
   is 20dBm 868MHz LORA, sounds thoroughly excellent.  Not cheap though.

#Power Supply
 * Both boxes with integrated LiPOs
    * Probably 3-4S in ignition to approximate the 12V most things want
    * 1S in control (makes it easier because control doesn't need balance
      charging, and 1S will happily LDO down to 3v3).
 * Charged by external standard balance charger
 * Exposing balance charge connections via custom 4-contact connection
  (only need about an amp per contact).
 * Make special cable from custom connector to 3S balance + two banana
  jacks

#Control Box
 * Nice key-switch to power the box and arm.
 * Indication of link status / arm -- bi-colour red/green LED
 * Indication of continuity per-channel -- bi-colour red/green LED in/on or
  next to each firing button.

#Ignition Box
 * Current arming system with beeper and extra loud/quiet switch
 * No integrated current limiting for e-matches, all 4 channels are
  generic 12V some amps brought out to banana screwdowns.
 * For connecting to e-matches use a banana to croc clip lead with
  integrated current limit resistor.  Firey end has banana plugs with
  replacable croc clips for when they get gnarly.

#Micros
 * STM32F071CBT6 seems legit, costs about £2.50, LQFP-48.
 * [The Insider's Guide to the STM32](http://www.hitex.com/fileadmin/pdf/insiders-guides/stm32/isg-stm32-v18d-scr.pdf)
   seems like a helpful getting started document.
 * [Onecall](http://onecall.farnell.com/stmicroelectronics/stm32f071cbt6/mcu-32bit-cortex-m0-48mhz-lqfp/dp/2432093)
   and [datasheet](http://www.farnell.com/datasheets/1835716.pdf).
 * I should read [this](http://www.st.com/web/en/resource/technical/document/application_note/CD00221665.pdf) about STM32 oscillators
 * RFM95W seems to have listed pin directions backwards for MISO/MOSI in
   datasheet.
