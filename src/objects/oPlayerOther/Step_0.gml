/// @description Insert description here
// You can write your code in this editor


//if (move != 0) {
//	image_xscale = move;
//	if (skeleton_animation_get() != "run") {
//      skeleton_animation_set("run");
//	  image_speed = 2;
//    }
//} else {
//	if (skeleton_animation_get() != "idle") {
//      skeleton_animation_set("idle");
//	  image_speed = 0.5;
//    }
//}

if (skeleton_animation_get() != animation) {
	skeleton_animation_set(animation)
}


switch(skeleton_animation_get()) {
	case "idle":
		image_speed = 0.5;
		break;
	case "run":
		image_speed = 2;
		break;
	case "attack_sword_1":
		image_speed = 2;
		break;
	case "run":
		image_speed = 0.5;
		break;
	case "idle":
		image_speed = 0.5;
		break;
}