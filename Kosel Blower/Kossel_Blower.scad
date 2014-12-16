translate([0,0,0])rotate([90,0,0])import("E3D_Duct.stl");
translate([5,-2.5,24.5])import("E3D_v6.stl");
translate([-12,17.5,30])rotate([0,0,-90])import("grooveMount.STL");
sca = .74;
translate([-19.5,0,15])rotate([0,90,0])scale([sca,sca,sca])import("fan_40.stl");
*translate([62,0,-18])rotate([0,-90,0])import("majorFan.stl");

$fn=50;
ep = .3;
wall = 3;

fR1 = 20;
fR2 = 15;

sc_x = .5;
sc_y = .8;

bx1 = fR1*sc_x;
by1 = 0;
bz1 = 20;

mount_w = 40;
mount_t = 2;
corner_r = 2;

bolt_r = 1.5;
cnr = mount_w/2-2;

translate([40,0,0])rotate([0,90,180])
difference(){
union(){
translate([-20,-20,0])
minkowski()
{
 cube([mount_w,mount_w,mount_t]);
 cylinder(r=corner_r,h=1);
}

hull(){
cylinder(r=fR1,h=ep);
translate([bx1,by1,bz1]) scale([sc_x,sc_y,1]) cylinder(r=fR2,h=ep);
}
}

 for(i = [ [ -cnr,  -cnr,  -.5],
           [ -cnr,  cnr,  -.5],
           [ cnr,  -cnr,  -.5],
           [ cnr,  cnr,  -.5]])
{
    translate(i)
   # cylinder(r=bolt_r,h=mount_t+2);
}

hull(){
translate([0,0,-ep])cylinder(r=fR1-wall,h=ep);
translate([bx1,by1,bz1+ep])scale([sc_x,sc_y+.1,1])cylinder(r=fR2-wall,h=ep);
}


}