# My PCB/PCA Rules of Thumb

After printing ~100 designs at home, and ordering ~250 boards, I've learned some good rules of thumb...

## Buying PCBs:
 * The best, most robus, etc. is [PCBWay](https://pcbway.com) 
 * If you just need a few, don't care it takes a week, and are more of a hobbyist, or if you want higher quality boards cheap, [Osh Park](https://oshpark.com/)

## PCB  Volume Pricing:
Based on PCBWay Nov 16, 2018
 * One or two-layer flex PCBs:  $0.04 to $0.05 per square centimeter stiffener included.
 * Two-layer FR4 PCB (HASL, ENIG, Etc.)  $0.01 per square centimeter.
 * Aluminium PCB ONE-LAYER: $0.015 per square centimeter
 * Aluminium PCB TWO-LAYER: $0.04 per square centimeter

## PCB Mechanicals / Kicad Setup:

General:
 * For high power boards, use aluminium, make everything on one layer if at all possible. 
 * Always avoid 4-or-more-layers unless cost and time truly doesn't matter.  PROTIP: If you think it doesn't matter, you're lying.  Just sometimes you really do need those 4 layers.
 * Adding more than a handful of parts to the back of PCBs **does** add cost.  And more than you'd expect.  If they can be hand-soldered for one or two parts it's not that bad, but if you need a bunch, try to push them all to the same side.  This makes your device able to sit on surfaces more easily.
 
Width/Spacing:
 * Bare minimum: 6.5/6.5 mil .16/.16mm width/spacing Anything less than this runs the risk of failing to work iwth the cheap PCB services.
 * If you have a QFN: 7.5 / 7.5 .19/.19mm 
 * If you don't, 15 / 9 .38/.23mm

Ground planes:
 * Front/back GND plane
 * Recommend 15mil/20mil minimum width / clearance

Holes:
 * 13mil / 0.3mm drill
 * 22mil / 0.55mm via diameter

Additional:
 * 0.1 mm solder mask clearance.

When exporting from kicad:
 * Exclude edge cuts from other layers
 * Use protel extensions
 * Use version 4.6
 * Drill file use inches, decmil format, gerber.
 * Always include F/B Copper, SilkS, Mask, Paste, and Edge Cuts
 * If ordering PCA work, **ALWAYS** Export POS files File->Frabrication Outputs->Pos file.

After placing parts:
 * If you have room, make all part values visible on silkscreen layer.

## Important Parts

### Passives Notes
 * Use KiCad's C_1206, C_0805, C_0603, C_0402 footprints for capacitors.
 * Use KiCad's R_1206, R_0805, R_0603, R_0402 footprints for resistors.
 * Use KiCad's LED_1206, LED_0805, LED_0603, LED_0402 footprints for LEDs.
 
 * 1206 for places where size doesn't matter, very easy to work with, but sometimes they're too big for convenience.
 * 0805 for where size isn't that important.  **This should be your go-to size**
 * 0603 when size matters, these can be hard to work with.
 * 0402 only when size is critical.
 
 * Use 0.1uF for bypass caps a few places around your board.  If you have two components next to each other that each need a bypass cap, multiple parts can share one 0.1uF capacitor.
 
### LEDs
 * Side-emitting LED: **SK6812-SIDE** [Datasheet](http://www.witop-tech.com/wp-content/uploads/.../SK6812-5v-Side-digital-led-chip.pdf) NOTE: Requires 0.1uF or 0.22uF bypass cap every few.
 * High reliability, built-in bypass cap: **WS2813** [Datasheet](http://www.world-semi.com/DownLoadFile/136) [Buy](http://www.szledcolor.com/productshow.asp?id=965)
 * LED with beautiful yellow, fairly robust: **SK6812-RGBY** [Datasheet](http://www.szledcolor.com/download/SK6812%20RGBY%20LED.pdf) [Buy](http://www.szledcolor.com/productshow.asp?id=946) NOTE: Requires 0.1uf or 0.22uF bypass cap every few.
 * 35mm x 35mm WS2812B: **WS2812B-MINI** [Datasheet](http://www.world-semi.com/DownLoadFile/112) / [Buy](http://www.szledcolor.com/productshow.asp?id=967)
 * NOTE: DO NOT USE SK6812 mini style, they are VERY FRAGILE, may fail unless reflow curves are adhered to VERY strictly
 * NOTE: All LEDs listed here are one-layer friendly. 
 * NOTE: These LEDs may have problems if they are run at 5.5V, and you drive them with a 3.3V signal.  Try to operate your logic at 3.6V to avoid the need for a level-shifter.
 
### Electromech
 * 10x10 Tactile Button [PTS645SM43SMTR92 LFS Datasheet](https://www.ckswitches.com/media/1471/pts645.pdf) NOTE: Part number PTS645S?/?SMTR92LFS valid. [Digikey](https://www.digikey.com/product-detail/en/c-k/PTS645SM43SMTR92-LFS/CKN9112CT-ND/1146934) 
 * The best USB Micro B Pure SMT: **10118192-0001LF** [Datasheet](http://www.amphenol-icc.com/media/wysiwyg/files/drawing/10118192.pdf) /  [Digikey](https://www.digikey.com/product-detail/en/amphenol-fci/10118192-0001LF/609-4613-1-ND/2785378)
 * The best USB Micro B With THT: **10118194-0001LF** [Datasheet](http://www.amphenol-icc.com/media/wysiwyg/files/drawing/10118194.pdf) /  [Digikey](https://www.digikey.com/product-detail/en/amphenol-fci/10118194-0001LF/609-4618-1-ND/2785382)
 
### ESPs
 * ESP-12F - No pad on back, exposes GPIO 9/10 + memory GPIOs [Electrodragon, Buy](https://www.electrodragon.com/product/esp-12f-esp8266-wifi-board/)
 * ESP-12S - Has pad on back, does not expose the GPIO that is usually unused.  Does not need pullup on GPIO 0 or 2 (not sure if this is 100%, but always tested to be true).  Supposadly better at WIFI [Electrodragon, Buy](https://www.electrodragon.com/product/esp-12s-wifi-module-esp8266/)

### Regulators
 * 1117 - series regulators. These are the standard as far as regulators go for SOT-223.  Look at the AMS1117 for a pretty solid set.
 * If you need 3.6V, use a TLV70036.

## PCA
Based roughly on Elecrow / PCBWay assembly services.
 * $0.01 / SMT Pad
 * $0.03 / THT Pad
 * Extra unique parts cost $
 * Attempt to minimize number of unique parts
 * BGAs cost $$$
 
