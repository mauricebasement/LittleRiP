$fn=50;
//Bukoff
module profile(h=50) {
	import("profile.dxf");
}

//Option: FDM Printed Glider
module glider(x=23,y=10,ex=10,b=5) {
	translate([0,-2.5])square([x,y],center=true);
	translate([0,ex/2])square([b,ex],center=true);
}

module glider_cut(b) {
	intersection() {
		translate([0,10])profile();
		translate([0,-2.5])glider(b=b);
	}
}
module glider1(b) {
	difference() {
		translate([0,-2.5])glider(b=b);
		glider_cut(b=b);
	}
}
module z_glider(h=40,screw_d=5,screw_dy=6.5,screw_r=1.7,rot=30,screw_dx=5) {
    
    difference() {
        linear_extrude(height=h)offset(r=-.2)glider1(b=5); 
        translate([0,0,1])resize([0,0,38])linear_extrude(height=h)offset(r=-1.1)glider1(b=5);
        screw(h,screw_d,screw_dy,screw_r,11,0);
        for(i=[screw_d,h-screw_d])for(j=[screw_dy,-screw_dy])translate([j,0.1,i])rotate(a=[90,rot,0])cylinder(h=3,r=3.3,$fn=6);
        for(j=[-7,0,7])for(i=[-5,3])translate([j,i,0])cylinder(h=h,r=0.9);
        for(i=[screw_dx,screw_dx*2,screw_dx*3,h/2,h-screw_dx,h-screw_dx*2,h-screw_dx*3])translate([0,-5,i])rotate(a=[0,90,0])cylinder(r=0.9,center=true,h=30);
    }
    difference(){
        screw(h,screw_d,screw_dy,3.5,9.8,-.1);
        screw(h,screw_d,screw_dy,screw_r,11,0);
        for(i=[screw_d,h-screw_d])for(j=[screw_dy,-screw_dy])translate([j,0.1,i])rotate(a=[90,rot,0])cylinder(h=3,r=3.3,$fn=6);
    }
}
module screw(h,screw_d,screw_dy,screw_r,h2,o) {
    for(i=[screw_d,h-screw_d])for(j=[screw_dy,-screw_dy])translate([j,o,i])rotate(a=[90,0,0])cylinder(h=h2,r=screw_r);
    }
z_glider();
*translate([0,20])projection(cut=true)translate([0,0,9])rotate([90,0,0])z_glider();