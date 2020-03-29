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
	case "sword_skill_sword_dash":
		image_speed = 1.2
		if (image_index > 7 && image_index < 9 && projectileCount > 0) {
			projectileCount -= 1;
			var sword_dash_projectile = instance_create_depth(x+(25*image_xscale),y-20,0, o_Sword_dash_projectile)
			with (sword_dash_projectile) {
				isReal = false;
				dir = other.image_xscale;
			}
			
		}
		if (image_index > 9) {
			projectileCount = 1;
		}
		break;
	
	case "die":
		image_speed = 0.8;
		break;
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