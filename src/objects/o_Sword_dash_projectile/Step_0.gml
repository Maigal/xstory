/// @description Insert description here
// You can write your code in this editor

x += 6 * dir;
image_xscale = dir;

if (opa) {
	image_alpha -= 0.04;
}

if (image_alpha <= 0) {
	ds_map_destroy(mobsHit)
	instance_destroy()
}