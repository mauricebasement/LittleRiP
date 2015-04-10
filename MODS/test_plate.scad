$fn=50;
squareX = 117;
difference() {
    square([squareX,80],center=true);
    for(j=[-1,1])for(k=[5,10])for(i=[-1,1])translate([i*(squareX/2-2.5),j*k])slot_hole();   
}
module slot_hole(r=1.5,d=0.25) {
    hull()for(i=[-1,1])translate([d*i,0])circle(r=r);
}
            