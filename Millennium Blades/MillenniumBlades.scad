/*
    Millennium Blades by beavisCZ
    395mmx292mm
*/

include <..\BoardGameSystem.scad>;


cardWidth=68;
cardHeight=92;
boxWidth=cardHeight+3;
boxHeight=62;

moneyHeight=64;
moneyWidth=140;

boxLength=197;
boxLength2=184;

hexSize=6;

/* FINAL SETUp */
/*
color("blue") {

    translate ([boxLength,0,0]) rotate([0,0,90]) 
        cardBox([boxWidth, boxLength, boxHeight],corner=3, hexBottom=hexSize, cutouts=15);
   translate ([boxLength*2+1,0,0]) rotate([0,0,90]) 
        cardBox([boxWidth, boxLength, boxHeight],corner=3, hexBottom=hexSize, cutouts=15);
   translate ([0,boxWidth+1,0])  
        cardBox([boxWidth, boxLength, boxHeight],corner=3, hexBottom=hexSize, cutouts=15);
}

color("green") {
    translate ([boxLength2+boxWidth+1,boxWidth+5,0]) rotate([0,0,90]) 
        cardBox([boxWidth, boxLength2, boxHeight], corner=3, hexBottom=hexSize, cutouts=13);
    translate ([boxLength2+boxWidth+1,boxWidth*2+8,0]) rotate([0,0,90]) 
        cardBox([boxWidth, boxLength2, boxHeight], corner=3, hexBottom=hexSize, cutouts=13);

}
*/

color("red") {
//    translate ([boxLength2+boxWidth+56+2,boxWidth+52,0]) rotate([0,0,90]) 
//        tokenBox([moneyWidth+6, 50+6, boxHeight], corner=3, hexBottom=hexSize, txtLabel="Money 1", txtSize=14);
//    translate ([boxLength2+boxWidth+56+56+4,boxWidth+52,0]) rotate([0,0,90]) 
//        tokenBox([moneyWidth+6, 50+6, boxHeight], corner=3, hexBottom=hexSize, txtLabel="Money 5 & 10", txtSize=14);

}


color("yellow") {
//    translate ([boxLength2+boxWidth+2,boxWidth+2,0]) 
//        tokenBox([114, 48, boxHeight], corner=3, hexBottom=hexSize, txtLabel="Tokens", txtSize=14, containersX=2);  
}


dividers=["Player","Core","Expansion","Master","Meta","Premium","Promo","ProPlayer","Starter"];

translate([0,-80,0])
{
    for (i=[0:len(dividers)-1])
    {
        translate([i*(cardHeight+5),0,0]) 
            divider([cardHeight-1, cardWidth, 1.4], 3, txtLabel=dividers[i]);

    }
}


