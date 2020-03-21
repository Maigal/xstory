/// @description Insert description here
// You can write your code in this editor

skeleton_animation_mix("idle", "run", 0.03)
skeleton_animation_mix("run", "idle", 0.03)
skeleton_animation_set("idle")

skeleton_attachment_set("armor", -1);

grav = 0.3; 
hsp = 0; 
vsp = 0; 
jumpSpeed = 7; 
moveSpeed = 4;

image_speed = 0.5;

animation = "idle";