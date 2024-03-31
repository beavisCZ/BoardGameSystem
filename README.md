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