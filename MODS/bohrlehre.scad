//Bohrlehre
difference() {
    cube([60,90,20],center=true);
    translate([0,10,2.5]) {
        cube([40.5,70,15],center=true);
        cylinder(r=4,$fn=50,center=true,h=25);
    }
}