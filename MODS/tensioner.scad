use<square.scad>;
use<holes.scad>;

linear_extrude(height=1.5)difference() {
    square([125,80],center=true);
    platformSquares();
    platformHoles();
}
linear_extrude(height=4)difference() {
    offset(r=2)platformSquares();
    platformSquares();
}