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
    linear_extrude(height=6)gasket();
}
module gasket() {
    difference() {
        offset(r=4)platformSquares();
        platformSquares();
    }
}
module gasketMold() {
    difference() {
        translate([0,0,0.5])cube([100,80,3],center=true);
        tensionerExtrusion();
        cube([70,50,5],center=true);
    }
}
module vat() {
    
tensionerBase();
tensionerExtrusion();
gasketMold();
!
