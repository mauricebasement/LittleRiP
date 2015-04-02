$fn=50;
//Bukoff
module profile() {
    import("profile.dxf");
    for(i=[1:3])rotate([0,0,i*90])
        translate([0,-10])for(i=[0,1])mirror([i,0,0])
            polygon(points=[[-10,0],[0,0],[0,7],[-4,7],[-8,2],[-10,2]]);
     circle(r=2.5);
}    
module glider() {
    difference() {
        union() {
            translate([0,5])square([12,10],center=true);
            translate([0,-1])square([20,2],center=true);
        }
        translate([0,10])profile();
    }
}

module extrusion(h=16,m=0.5) {
    difference() {
        linear_extrude(height=h)offset(r=-0.1)glider();
        translate([0,0,m])linear_extrude(height=h-2*m)offset(r=-0.8)glider();
    }
}

extrusion();