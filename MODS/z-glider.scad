$fn=50; 
//LittleRP
module profile() {
    import("profile.dxf");
    for(i=[1:3])rotate([0,0,i*90])
        translate([0,-10])for(i=[0,1])mirror([i,0,0])
            polygon(points=[[-10,0],[0,0],[0,7],[-4,7],[-8,2],[-10,2]]);
     circle(r=2.5);
}    
module glider(blockY=8,tolerance=0.1) {
    offset(r=-tolerance)difference() {
        union() {
            translate([0,5])square([5,10],center=true);
            translate([0,-0.5*blockY])square([20,blockY],center=true);          
        }
        translate([0,10])profile();
        translate([8.5,-7])square([3,10],center=true);
     }
}
module extrusion(h=20,m=0.5,margin=0.2,d=0.1,r=1) {
    difference() {
        union(){
            difference() {
                linear_extrude(height=h)glider();
                translate([0,0,m])linear_extrude(height=h-2*m)offset(r=-margin)glider();
            }
            linear_extrude(height=h)support(true,r=r,d=d)glider();
        }
        linear_extrude(height=h)union() {
            difference() {
                honeycomb_drainholes(r=r,d=d);
                difference() {
                    offset(r=0.1)glider();
                    offset(r=-margin)glider();
                }
            }
        }
        scale([1.1,1,1])ptr()hull()pipe();
    }
    difference() {
        ptr()pipe();
        linear_extrude(height=h)union() {
            difference() {
                honeycomb_drainholes(r=r,d=d);
                difference() {
                    offset(r=0.1)glider();
                    offset(r=-margin)glider();
                }
            }
        }
    }
}
extrusion();

module ptr() {
    for(z=[4,16])translate([-1.5,-5,z])rotate([0,90,0])children();
}
module pipe(r=1.5,m=1) {
    difference() {
        cylinder(h=17,r=r+m,center=true);
        cylinder(h=17,r=r,center=true);
    }
}
module support_raw(x=20,y=20,d=1.1,t=0.15) {
    for(i=[-1,1])for(j=[0:d:x/2])translate([i*j,0])square([t,y],center=true);
    for(i=[-1,1])for(j=[0:d:x/2])translate([0,i*j])square([x,t],center=true);
}
module support(comb=false,d,r) {
    intersection() {
        if(comb==false)support_raw(d=d,r=r);
        if(comb==true)support_honeycomb(d=d,r=r);
        children();
    }
}
module support_honeycomb(x=10,y=10,r=0.7,d=0.1,fn=6) {
    for(k=[-1,1])for(l=[0:2*(r+r*sin(30)-d):x]){
        for(i=[1,-1])for(j=[0:2*r*cos(30)-d:y]) {
            translate([k*l,i*j])comb(r,d,fn);
            translate([k*(l+r+r*sin(30)-d),i*(j+cos(30)*r-0.5*d)])comb(r,d,fn);
        }
    }
}
module honeycomb_drainholes(x=10,y=10,r=0.7,d=0.1,fn=6,o1=1,o2=1,ra=0.4) {
    for(k=[-1,1])for(l=[0:(2*(r+r*sin(30)-d))*o1:x]){
        for(i=[1,-1])for(j=[0:(2*r*cos(30)-d)*o2:y]) {
            translate([k*l,i*j])circle(r=ra);
            translate([k*(l+r+r*sin(30)-d),i*(j+cos(30)*r-0.5*d)])circle(r=ra);
        }
    }
}
module comb(r,d,fn) {
    difference() {
        circle(r=r,$fn=fn);
        circle(r=r-d,$fn=fn);
    }
}