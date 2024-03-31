include <BoardGameSystem.scad>;

tokenBox(size=[108,70,32], hexBottom=5, corner=3, txtLabel="Cards", txtSize=16);

translate([120,0,0])
tokenBox(size=[108,70,32], hexBottom=0, corner=3, containersX=3, containersY=2);
