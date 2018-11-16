# My PCB/PCA Rules of Thumb

## Volume Pricing:
Based on PCBWay Nov 16, 2018
 * One or two-layer flex PCBs:  $0.04 to $0.05 per square centimeter stiffener included.
 * Two-layer FR4 PCB (HASL, ENIG, Etc.)  $0.01 per square centimeter.
 * Aluminium PCB ONE-LAYER: $0.015 per square centimeter
 * Aluminium PCB TWO-LAYER: $0.04 per square centimeter

## PCA
Based roughly on Elecrow / PCBWay assembly services.
 * $0.01 / SMT Pad
 * $0.03 / THT Pad
 * Extra unique parts cost $
 * Attempt to minimize number of unique parts
 * BGAs cost $$$
 
## Important Parts
 * Side-emitting LED: SK6812-SIDE [Datasheet](http://www.witop-tech.com/wp-content/uploads/.../SK6812-5v-Side-digital-led-chip.pdf) NOTE: Requires 0.1uF or 0.22uF bypass cap every few.
 * High reliability, built-in bypass cap: WS2813 [Datasheet](http://www.world-semi.com/DownLoadFile/136)
 * 10x10 Tactile Button [PTS645SM43SMTR92 LFS Datasheet](https://www.ckswitches.com/media/1471/pts645.pdf) NOTE: Part number PTS645S?/?SMTR92LFS valid. [Digikey](https://www.digikey.com/product-detail/en/c-k/PTS645SM43SMTR92-LFS/CKN9112CT-ND/1146934) 
 * 

## Mechanicals:
Width/Spacing:
 * Bare minimum: 6.5/6.5 mil width/spacing
 * If you have a QFN: 7.5 / 7.5
 * If you don't, 15 / 9

Holes:
 * 13mil / 0.3mm drill
 * 22mil / 0.55mm via diameter

Additional:
 * 0.1 mm solder mask clearance.
