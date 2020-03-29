/// @description Insert description here
// You can write your code in this editor



part_dir = dir == 1 ? 180 : 0;
part_or = dir == 1 ? 0 : 180;

x += 6 * dir;
image_xscale = dir;

if (opa) {
	image_alpha -= 0.05;
}

if (image_alpha <= 0) {
	event_user(0)
}

part_type_alpha3(particle1,image_alpha-0.2,image_alpha-0.3,image_alpha-0.4);
part_emitter_region(Sname,emitter1,x+(-5*image_xscale),x+(-5*image_xscale),y-5,y+15,0,0);
part_emitter_stream(Sname,emitter1,particle1,1);
part_type_direction(particle1,part_dir,part_dir,0.10,0);
part_type_orientation(particle1,part_or,part_or,0,0,0);
