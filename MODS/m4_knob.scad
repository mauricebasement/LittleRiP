module bottom() {
    difference() {
        cylinder(r=13,h=4);
        for(i=[0:20:360])rotate([0,0,i])translate([14,0])scale([1,2,1])cylinder(r=3,h=8);
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

