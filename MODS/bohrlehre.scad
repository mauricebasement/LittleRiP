//Bohrlehre
$fn=50;
*difference() {
    cube([60,90,20],center=true);
    translate([0,10,2.5]) {
        cube([40.5,70,15],center=true);
        cylinder(r=4,$fn=50,center=true,h=25);
    }
}
module top() {
    difference() {
        square([60,90],center=true);
        translate([0,10])square([40.5,70],center=true);
        holes();
    }
}
module bottom() {
    difference() {
        square([60,90],center=true);
        translate([0,10])circle(r=4,center=true);
        holes();
    }
}
module holes() {
    for(i=[-1,1])for(j=[-1,1])translate([i*25,j*35])circle(r=1.5);
}
//module bottom() {

top();
bottom();