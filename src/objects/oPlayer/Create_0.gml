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
skeleton_animation_mix("fall", "run", 0.03)
skeleton_animation_mix("attack_sword_1", "idle", 0.03)
skeleton_animation_mix("idle", "attack_sword_1", 0.03)
skeleton_animation_set("idle")

if (global.role == "gm") {
	skeleton_slot_color_set("armor", c_black, 0);
	skeleton_slot_color_set("machete", c_red, 1);
}

var skinColor;
show_debug_message(global.skinColor)
if (global.skinColor != "default") {
	skinColor = make_colour_rgb(global.skinColor[? "r"], global.skinColor[? "g"], global.skinColor[? "b"]);
} else {
	skinColor = -1
}

var eyeColor;
show_debug_message(global.eyeColor)
if (global.eyeColor != "default") {
	eyeColor = make_colour_rgb(global.eyeColor[? "r"], global.eyeColor[? "g"], global.eyeColor[? "b"]);
} else {
	eyeColor = -1
}

skeleton_slot_color_set("head", skinColor, 1)
skeleton_slot_color_set("ear", skinColor, 1)
skeleton_slot_color_set("torso", skinColor, 1)
skeleton_slot_color_set("shoulder_front", skinColor, 1)
skeleton_slot_color_set("shoulder_back", skinColor, 1)
skeleton_slot_color_set("arm_front", skinColor, 1)
skeleton_slot_color_set("arm_back", skinColor, 1)
skeleton_slot_color_set("hand_front", skinColor, 1)
skeleton_slot_color_set("hand_back", skinColor, 1)
skeleton_slot_color_set("leg_front", skinColor, 1)
skeleton_slot_color_set("leg_back", skinColor, 1)
skeleton_slot_color_set("calf_front", skinColor, 1)
skeleton_slot_color_set("calf_back", skinColor, 1)
skeleton_slot_color_set("foot_front", skinColor, 1)
skeleton_slot_color_set("foot_back", skinColor, 1)
skeleton_slot_color_set("eyes", eyeColor, 1)

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

