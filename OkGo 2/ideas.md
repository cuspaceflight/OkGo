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
    * Radio link, 433MHz or 868MHz, 10mW or 100mW or so
    * SMA-mount swivel rubber ducky antennas on each end.
    * Radios something like the [RFM98W-433S2](http://ava.upuaut.net/store/index.php?route=product/product&path=71_63&product_id=110)
      or the [RFM69W-868S2](http://ava.upuaut.net/store/index.php?route=product/product&path=71_63&product_id=109).

#Power Supply
    * Both boxes with integrated LiPOs -- probably 3S in ignition and
      1-2S in control.
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
