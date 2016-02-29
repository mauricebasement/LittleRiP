$fn=50;

difference() {
    cylinder(r=3.5,h=7);
    cylinder(r=2.5,h=7);
}
difference() {
    hull() {
        cylinder(r=3.5,h=2.5);
        translate([0,11,0])cylinder(r=3.5,h=1.5);
    }
    cylinder(r=2.5,h=2.5);
}