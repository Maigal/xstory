/// @description Insert description here
// You can write your code in this editor

skeleton_attachment_set("armor", -1);

skeleton_animation_mix("idle", "run", 0.2)
skeleton_animation_mix("idle", "jump", 0.03)
skeleton_animation_mix("run", "idle", 0.03)
skeleton_animation_mix("run", "jump", 0.03)
skeleton_animation_mix("run", "fall", 0.03)
skeleton_animation_mix("jump", "fall", 0.03)
skeleton_animation_mix("fall", "idle", 0.03)
skeleton_animation_mix("attack_sword_1", "idle", 0.03)
skeleton_animation_mix("idle", "attack_sword_1", 0.03)
skeleton_animation_set("idle")

//skeleton_slot_color_set("armor", c_black, 0)

grav = 0.3; 
hsp = 0; 
vsp = 0; 
jumpSpeed = 7; 
moveSpeed = 4;
image_speed = 0.5;
animation = "idle";
prevState = "";
state = "idle";
x_lock = false;
y_lock = false;
col_list = ds_list_create()
punch_count = 1;
currentMessage = "";

isImmune = false;

