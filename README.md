# BoardGameSystem
OpenSCAD template for board game inserts

## tokenBox
basic box with optional dividers

**size[x,y,z]** - defines total size of token box

**hexBottom** - 0=full bottom, >0 = bottom with honeycomb design, number defines size of honeycomb

**corner** - 0=sharp corners, >0 = diameter of rounded corner

**wallThickness** - thickness of box walls in mm (default=2)

**containersX** - how many containers in x axis (default=1)

**containersY** - how many containers in y axis (default=1)

**txtLabel** - label on bottom of box

**txtSize** - size of font used on label (default=8)

**txtFont** - font used on label (default="Arial")

### Token Box Examples
```
include <BoardGameSystem.scad>;

tokenBox(size=[108,70,32], hexBottom=5, corner=3, txtLabel="Cards", txtSize=16);

translate([120,0,0])
tokenBox(size=[108,70,32], hexBottom=0, corner=3, containersX=3, containersY=2);
```
![sample token boxes](/img/tokenbox.png)

## cardBox
card box for TCG and LCG games with cutouts for dividers

**size[x,y,z]** - defines total size of card box

**hexBottom** - 0=full bottom, >0 = bottom with honeycomb design, number defines size of honeycomb

**corner** - 0=sharp corners, >0 = diameter of rounded corner

**wallThickness** - thickness of box walls in mm (default=2)

**cutoutThickness** - thickness of cutouts for card dividers in mm (default=2)

**cutouts** - how many cutouts for dividers

### Card Box Example
```
include <BoardGameSystem.scad>;

cardBox(size=[76,180,60], hexBottom=0, corner=3, cutouts=13);
```
![sample card box](/img/cardbox.png)

## divider
cards divider used together with card box

**size[x,y,z]** - defines total size of divider

**corner** - 0=sharp corners, >0 = diameter of rounded corner

**txtLabel** - label on divider

**txtSize** - size of font used on label (default=8)

**txtFont** - font used on label (default="Arial")

### Divider Example
```
include <BoardGameSystem.scad>;

divider(size=[92,68,1.4], corner=3, txtLabel="Basic cards", txtSize=7, txtFont="Arial:style=bold");
```
![sample divider](/img/divider.png)