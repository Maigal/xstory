/// @description Set colors

if (role == "gm") {
	skeleton_slot_color_set("armor", c_black, 0);
	skeleton_slot_color_set("machete", c_red, 1);
	usernameTag = "[GM] "
}


var skinColor;
show_debug_message(sColor)
if (sColor != "default") {
	show_debug_message("ENTRANDO")
	skinColor = make_colour_rgb(sColor[? "r"], sColor[? "g"], sColor[? "b"]);
} else {
	skinColor = -1
}

var eyeColor;
show_debug_message(eColor)
if (eColor != "default") {
	eyeColor = make_colour_rgb(eColor[? "r"], eColor[? "g"], eColor[? "b"]);
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