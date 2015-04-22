use<square.scad>;
use<holes.scad>;

module tensionerBase() {
    linear_extrude(height=1.5)difference() {
        square([125,80],center=true);
        platformSquares();
        platformHoles();
    }
}
module tensionerExtrusion() {
    intersection(){
        minkowski() {
            linear_extrude(height=4)gasket();
            sphere(r=2,$fn=20);
        }
        translate([0,0,20])cube([500,500,40],center=true);
    }
}
module tensioner() {
    tensionerBase();
    tensionerExtrusion();
}
module gasket() {
    difference() {
        offset(r=2.5)platformSquares();
        offset(r=2)platformSquares();
    }
}
module gasketMold() {
    difference() {
        translate([0,0,0.5])cube([100,80,3],center=true);
        tensionerExtrusion();
        cube([70,50,5],center=true);
    }
}
//module vat() {

tensioner();    
*gasketMold();

