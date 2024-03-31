include <BoardGameSystem.scad>;

color("lightgreen")
    tokenBox(size=[108,70,32], hexBottom=5, corner=3, txtLabel="Tokens", txtSize=16);

color("green") translate([120,0,0])
    tokenBox(size=[108,70,32], hexBottom=0, corner=3, containersX=3, containersY=2);

color("yellow") translate([0,80,0])
    cardBox(size=[76,180,60], hexBottom=6, corner=3, cutouts=13);

color("red") translate([80,80,0])
    divider(size=[92,68,1.4], corner=3, txtLabel="Basic cards", txtSize=7, txtFont="Arial:style=bold");
