/* 
    BoardGame System v 1.0 31.3.2024 by Martin Kaspar
*/

module cardBox(size,corner=3,hexBottom=0, cutouts=10, wallThickness=2
    , cutoutThickness=2){
        difference() {
            roundedBox(size, corner);
            translate([wallThickness,wallThickness,wallThickness])
                roundedBox([size[0]-wallThickness*2, size[1]-wallThickness*2, size[2]], corner-1);

            if (cutouts>0){
                for (i=[1:cutouts])
                    translate([-5,20+i*10,size[2]-20])
                        rotate([-30,0,0])
                            cube ([size[0]+10,cutoutThickness,50]);
            }

            if (hexBottom>=1)
            {
                translate([5,5,-1])
                    intersection(){
                            roundedBox([size[0]-10, size[1]-10, wallThickness*2],corner-1);
                            hexPlane(hexBottom,size[0],size[1],wallThickness*2);
                        }
            }        
        }
        translate([2,size[1]-38.5,1])
            rotate([-30,0,0])
                cube ([size[0]-wallThickness*2,2,size[2]+8]);

}

/*full box with rounded corners*/
module roundedBox(size=[10,10,10], corner=0){
    if (corner>0){       
        $fn=32;
        hull(){
            translate([corner,corner,0])
                cylinder (r=corner, h=size[2]);
            translate([size[0]-corner,corner,0])
                cylinder (r=corner, h=size[2]);
            translate([size[0]-corner,size[1]-corner,0])
                cylinder (r=corner, h=size[2]);
            translate([corner,size[1]-corner,0])
                cylinder (r=corner, h=size[2]);
        }
    } else {
        cube(size);
    }
}

/*token box*/
module tokenBox(size=[10,10,10], hexBottom=0, corner=0, 
    containersX=1, containersY=1,
    wallThickness=2, txtLabel="", txtSize=8, txtFont="Arial"){
    if (hexBottom<1) {
        difference() {
            roundedBox(size,corner);
            translate([wallThickness,wallThickness,wallThickness])
                roundedBox([size[0]-wallThickness*2, size[1]-wallThickness*2, size[2]],corner-1);
            translate([size[0]/2,size[1]/2,0.3])
                linear_extrude(2)
                    text(txtLabel,size=txtSize, font=txtFont, halign="center", valign="center");
                    
        }
    } else{
        difference() {
            roundedBox(size,corner);
            translate([wallThickness,wallThickness,wallThickness])
                roundedBox([size[0]-wallThickness*2, size[1]-wallThickness*2, size[2]],corner-1);

 
           translate([3,3,-1])
           intersection(){
                roundedBox([size[0]-6, size[1]-6, wallThickness*2],corner-1);
                hexPlane(hexBottom,size[0],size[1],wallThickness*2);
            }

        }
        translate([size[0]/2,size[1]/2,0.3])
            linear_extrude(3)
                text(txtLabel,size=txtSize, font=txtFont, halign="center", valign="center");
    }
    if (containersX>1)
    {
        for (i=[1:containersX-1]){
            translate([i*size[0]/containersX,0,0]) cube([wallThickness,size[1],size[2]]);
        }
    }

    if (containersY>1)
    {
        for (i=[1:containersY-1]){
            translate([0,i*size[1]/containersY,0]) cube([size[0],wallThickness,size[2]]);
        }
    }
}

module hexPlane(radius, x,y, height){
    maxX=x/(radius*3.4);
    maxY=y/(radius);
    for (y=[0:maxY])
        for(x=[0:maxX])
            translate([x*radius*3.4+(y%2*radius*1.7),y*radius,0])
                cylinder(r=radius, h=height, $fn=6);
}
