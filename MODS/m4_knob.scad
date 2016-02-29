radius=20;
$fn=200;
module bottom() {
    difference() {
        cylinder(r=radius,h=4);
        for(i=[0:20:360])rotate([0,0,i])translate([radius/13*14,0])scale([1,2,1])cylinder(r=3,h=8);
        cylinder(r1=9/2,r2=8.2/2,h=6,$fn=6);            
    }
}
module top() {
    translate([0,0,4])difference() {
        cylinder(r=7,h=3);
        //translate([0,0,0])cylinder(r=8.78/2,h=50,$fn=6);
    }
}
difference() {
    union() {
        top();
        bottom();
    }
    cylinder(r=2.5,h=50);
}
