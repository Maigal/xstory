/// @description

alarm[0] = 30;
opa = false;

mobCount = 2;
mobsHit = ds_map_create();


part_dir = dir == 1 ? 180 : 0;
part_or = dir == 1 ? -180 : 180;


Sname = part_system_create();
particle1 = part_type_create();
part_type_sprite(particle1,sSword_dash,0,0,0);
part_type_size(particle1,1,1,-0.08,0);
part_type_scale(particle1,0.9,0.9);
part_type_color3(particle1,16777215,16777215,3650668);
part_type_alpha3(particle1,0.6,0.4,0.20);
part_type_speed(particle1,1.50,2.02,0.24,7);
part_type_direction(particle1,part_dir,part_dir,0.10,0);
part_type_gravity(particle1,0,270);
part_type_orientation(particle1,part_or,part_or,0,0,0);
part_type_blend(particle1,0);
part_type_life(particle1,32,62);

emitter1 = part_emitter_create(Sname);



