/*
    Millennium Blades
    395mmx292mm

    cardBox1 - 197

    podelne 2x cardBox1 zaplní vodorovnou řadu
    pak na štorc další cardbox1

*/

cardWidth=68;
cardHeight=92;
boxWidth=cardHeight+3;
boxHeight=62;

moneyHeight=64;
moneyWidth=140;

boxLength=197;
boxLength2=184;

/* FINAL SETUp */
/*

color("blue") {

   translate ([boxLength,0,0]) rotate([0,0,90]) cardBox(boxWidth, boxLength, boxHeight,3, true, cutouts=15);
   translate ([boxLength*2+1,0,0]) rotate([0,0,90]) cardBox(boxWidth, boxLength, boxHeight,3, true, cutouts=15);
   translate ([0,boxWidth+1,0])  cardBox(boxWidth, boxLength, boxHeight,3, true, cutouts=15);
}
color("green") {
   translate ([boxLength2+boxWidth+1,boxWidth+5,0]) rotate([0,0,90]) cardBox(boxWidth, boxLength2, boxHeight,3, true, cutouts=15);
   translate ([boxLength2+boxWidth+1,boxWidth*2+8,0]) rotate([0,0,90]) cardBox(boxWidth, boxLength2, boxHeight,3, true, cutouts=15);
}
color("red") {
    translate ([boxLength2+boxWidth+56+2,boxWidth+52,0]) rotate([0,0,90]) moneyBox("Money 1", moneyWidth+6, 50+6, moneyHeight+1.5, corner=3, hexBottom=true);
    translate ([boxLength2+boxWidth+56+56+4,boxWidth+52,0]) rotate([0,0,90]) moneyBox("Money 5 & 10", moneyWidth+6, 50+6, moneyHeight+1.5, corner=3, hexBottom=true);
}
color("yellow") {
    translate ([boxLength2+boxWidth+2,boxWidth+2,0]) moneyBox("Tokens", 114, 48, 62, corner=3, hexBottom=true, containers=2);    
}
*/


divider("Player", cardHeight-1, cardWidth, 1.4, 3);
//divider("Core", cardHeight-1, cardWidth, 1.4, 3);
//cardBox(boxWidth, boxLength, boxHeight,3, true, cutouts=13);
//moneyBox("Money 1", moneyWidth+6, 50+6, moneyHeight+1.5, corner=3, hexBottom=true);
//moneyBox("Money 5 & 10", moneyWidth+6, 50+6, moneyHeight+1.5, corner=3, hexBottom=true);
//roundedBox(boxWidth, boxLength, boxHeight, 5 );
//moneyBox("Tokens", 114, 48, 62, corner=3, hexBottom=true, containers=2);


/*
for (j=[0:4])
    for (i=[1:10])
        translate([i*30,j*40,0])
        keyChain(str(i+j*10),3);

module keyChain(txtLabel, height=3) {
    difference(){
        hull(){
            cylinder(r=10, h=height, $fn=32);
            translate([0,20,0])
                cylinder(r=4, h=height, $fn=32);
        }
        translate([0,20,-1])
            cylinder(r=2, h=height+2, $fn=32);
        translate([0,-5,0.4])
            linear_extrude(height+2)
                #text(txtLabel,size=10, halign="center");
    }
}
*/

module hexPlane(radius, x,y, height){
    maxX=x/(radius*3.4);
    maxY=y/(radius);
    for (y=[0:maxY])
        for(x=[0:maxX])
            translate([x*radius*3.4+(y%2*radius*1.7),y*radius,0])
                cylinder(r=radius, h=height, $fn=6);
}


module moneyBox(txtlabel,x,y,z,corner,hexBottom=false, containers=1){
    if (hexBottom==false)
    {
        difference() {
            roundedBox(x,y,z,corner);
            translate([1.5,1.5,1.5])
                roundedBox(x-3,y-3,z,corner);
            translate([x/2,y/2,0.4])
                linear_extrude(2)
                    text(txtlabel,size=14, halign="center");
        }
    } else{
        difference() {
            roundedBox(x,y,z,corner);
            translate([1.5,1.5,1.5])
                roundedBox(x-3,y-3,z,corner);

            translate([5,5,-0.1])
                intersection(){
                    roundedBox(x-10, y-10, 2, corner);
                    hexPlane(8,x,y,2);
                }
        }
        translate([x/2,y/2,0])
            linear_extrude(3)
                text(txtlabel,size=15, halign="center");

    }
    if (containers>1)
    {
        for (i=[1:containers-1]){
            translate([i*x/containers,0,0]) cube([1.5,y,z]);
        }
    }


}

module cardBox(x,y,z,corner,hexBottom=false, cutouts=0){
        difference() {
            roundedBox(x, y, z, corner);
            translate([1.5,1.5,1.5])
                roundedBox(x-3, y-3, z, corner);

            if (cutouts>0){
                for (i=[1:cutouts])
                    translate([-5,20+i*10,z-20])
                        rotate([-30,0,0])
                            cube ([x+10,2,50]);
            }

            if (hexBottom==true)
            {
                translate([5,5,-0.1])
                    intersection(){
                        roundedBox(x-10, y-10, 2, corner);
                        hexPlane(8,x,y,2);
                    }
            }
        }

        translate([1.5,y-36.5,0.7])
            rotate([-30,0,0])
                cube ([x-3,1.4,z+7.8]);


}

module roundedBox(x, y, z, corner=0){
    if (corner>0){       
        hull(){
            translate([corner,corner,0])
                cylinder (r=corner, h=z, $fn=30);
            translate([x-corner,corner,0])
                cylinder (r=corner, h=z, $fn=30);
            translate([x-corner,y-corner,0])
                cylinder (r=corner, h=z, $fn=30);
            translate([corner,y-corner,0])
                cylinder (r=corner, h=z, $fn=30);
        }
    } else {
        cube([x,y,z]);
    }
}

module divider(txtLabel, x, y, z, corner){
    difference(){
        union(){
        roundedBox(x,y-4,z,corner);
        translate([-2,cardWidth-24,0])
            roundedBox(x+4,20,z,corner);
        //ousko
        translate([-2,cardWidth-5-corner*2,0])
            roundedBox(x/1.5,16,z,corner);
        }

        translate([cardHeight/4+5,cardWidth-6,0.4])
            linear_extrude(5)
                text(txtLabel,size=8, halign="center", font="Arial:style=bold");
        translate([10,10,-1])
            roundedBox(x/2-15, y-25, 5, corner);
        translate([x/2+5,10,-1])
            roundedBox(x/2-15, y-25, 5, corner);
   }
    
}
