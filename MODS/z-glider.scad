$fn=50; 
//LittleRP
module profile() {
    import("profile.dxf");
    for(i=[1:3])rotate([0,0,i*90])
        translate([0,-10])for(i=[0,1])mirror([i,0,0])
            polygon(points=[[-10,0],[0,0],[0,7],[-4,7],[-8,2],[-10,2]]);
     circle(r=2.5);
}    
module glider() {
    offset(r=-0.1)difference() {
        union() {
            translate([0,5])square([5,10],center=true);
            translate([0,-1])square([20,2],center=true);
        }
        translate([0,10])profile();
    }
}

module extrusion(h=20,m=0.5) {
    difference() {
        linear_extrude(height=h)glider();
        translate([0,0,m])linear_extrude(height=h-m)offset(r=-0.3)glider();
    }
    linear_extrude(height=h)support();
}

extrusion();

module support_raw(x=20,y=20,d=1.1,t=0.15) {
    for(i=[-1,1])for(j=[0:d:x/2])translate([i*j,0])square([t,y],center=true);
    for(i=[-1,1])for(j=[0:d:x/2])translate([0,i*j])square([x,t],center=true);
}
module support() {
    intersection() {
        support_raw();
        glider();
    }
}
module support_honeycomb(x=20,y=20,r=1,d=0.1) {
    difference() {
        square([x,y],center=true);
        for(i=[-1,1])for(j=[0:2*r+d*2:x])for(l=[1,-1])for(k=[0:(2*r-2*d)*2:y])
            translate([i*j,l*k])rotate([0,0,30])circle(r=r,$fn=6);      
        for(i=[-1,1])for(j=[0:2*r+d:x])for(l=[1,-1])for(k=[0:(2*r-2*d)*2:y])
            translate([i*j+r,l*k+(2*r-2*d)])rotate([0,0,30])circle(r=r,$fn=6);
    }
}
!support_honeycomb();