/*
    Tiny Epic Galaxies
    166mmx107mmx35mm
*/

include <..\BoardGameSystem.scad>;

//gamebox
color("orange")
//tokenBox(size=[171,112,37]);

//cardBox
translate([72,2,2]) rotate([0,0,90])
    tokenBox(size=[107,70,32], hexBottom=5, corner=3, txtLabel="Cards", txtSize=16);

//playerBox 
color("red")
translate([2+70+35,2,2]) rotate([0,0,90])
    tokenBox(size=[53,35,32], hexBottom=5, corner=3, txtLabel="Red", txtSize=10);


color("yellow")
translate([2+70+35,2+54,2]) rotate([0,0,90])
    tokenBox(size=[53,35,32], hexBottom=5, corner=3, txtLabel="Yellow", txtSize=10);


color("green")
translate([2+70+35+35,2,2]) rotate([0,0,90])
    tokenBox(size=[53,35,32], hexBottom=5, corner=3, txtLabel="Green", txtSize=10);


color("blue")
translate([2+70+35+35,2+54,2]) rotate([0,0,90])
    tokenBox(size=[53,35,32], hexBottom=5, corner=3, txtLabel="Blue", txtSize=10);

//diceBox
translate([2+70+70+25,2,2]) rotate([0,0,90])
    tokenBox(size=[108,25,32], hexBottom=5, corner=3, txtLabel="Dice", txtSize=10);

/*
*/