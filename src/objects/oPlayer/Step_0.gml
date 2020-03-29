/// @description Insert description here
// You can write your code in this editor

var prevX = x;
var prevY = y;
var prevState = state;

// Get input 
kLeft = -keyboard_check(vk_left); 
kRight = keyboard_check(vk_right); 
kJump = !global.interactionBlocked && state != "skill" && (keyboard_check_pressed(vk_up) || keyboard_check_pressed(vk_space));
kAttack = !global.interactionBlocked && keyboard_check_pressed(vk_control);
kSkill1 = !global.interactionBlocked && state != "skill" && keyboard_check_pressed(vk_shift);

// Use input 

if (!global.interactionBlocked && state != "attacking" && state != "skill") {
	move = kLeft + kRight;
} else {
	move = 0;
}


hsp = move * moveSpeed; 

if (kAttack) {
	state = "attacking";
}

if (kSkill1) {
	state = "skill";
	currentSkill = "sword_dash";
	projectileCount = 1;
}

if (global.hp <= 0) {
	state = "dead"
}


if (state == "dead") {
	
} else {
	if (state == "skill") {
		switch (currentSkill) {
			case "sword_dash":
				if (image_index > 7 && projectileCount > 0) {
					var sword_dash_projectile = instance_create_depth(x+(35*image_xscale),y-40,0, o_Sword_dash_projectile)
					with (sword_dash_projectile) {
						isReal = true;
						dir = other.image_xscale;
					}
					projectileCount -= 1;
					
				}
				if (image_index + image_speed >= image_number) {
			    state = "idle";
			}
				break;
				
			default:
				break;
		}
	}
	else if (state == "attacking") {
		if (image_index + image_speed >= image_number){
		    state = "idle";
		}
		if (punch_count > 0) {
			var inst;
			var hand = skeleton_get_bounds(0)
			inst = collision_rectangle(hand[2], hand[3], hand[4], hand[5], oMonster, false, false)
			if (inst != noone){
				with(inst) {
					damageAmount = 10 + (global.level * 2);
					statusAilment = none;
					event_user(0) // Trigger user event 0 of oMonster
				}
				punch_count -= 1;
				alarm[0] = 50;
			}
		}
	
	} else {
		if (vsp > 0) {
			state = "fall";
		} else if (vsp < 0) {
			state = "jump";
		} else {
			if (move != 0) {
				state = "run";
			} else if (move == 0){
				state = "idle";
			}
		}

	}
}




if (vsp < 10) { vsp += grav; };



if (move != 0) {
	image_xscale = move;
}


switch (state) {
	case "skill":
		if (skeleton_animation_get() != "sword_skill_sword_dash"){
			skeleton_animation_set("sword_skill_sword_dash")
			image_speed = 1.2;
		}
		hsp += ((image_index - 3) / 2) * image_xscale;
		break;
		
	case "dead":
		if (skeleton_animation_get() != "die"){
			skeleton_animation_set("die")
			image_speed = 0.8;
		}
		break;
	
	case "attacking":
		if (skeleton_animation_get() != "attack_sword_1"){
			skeleton_animation_set("attack_sword_1")
			image_speed = 2;
		}
		break;
		
	case "idle":
		if (skeleton_animation_get() != "idle"){
			skeleton_animation_set("idle")
			image_speed = 0.5;
		}
		break;
		
	case "run":
		if (skeleton_animation_get() != "run"){
			skeleton_animation_set("run")
			image_speed = 2;
		}
		break;
		
	case "fall":
		if (skeleton_animation_get() != "fall"){
			skeleton_animation_set("fall")
			image_speed = 0.5;
		}
		break;
		
	case "jump":
		if (skeleton_animation_get() != "jump"){
			skeleton_animation_set("jump")
			image_speed = 0.5;
		}
		break;
}


	


if (place_meeting(x, y + 1, oSolid)) { vsp = kJump * -jumpSpeed }

// H Collisions 
if (place_meeting(x + hsp, y, oSolid)) { 
	while (!place_meeting(x + sign(hsp), y, oSolid)) {
		x += sign(hsp); 
	} hsp = 0; 
} 

x += hsp;

// v Collisions 
if (place_meeting(x, y + vsp, oSolid)) { 
	while (!place_meeting(x, y + sign(vsp), oSolid)) {
		y += sign(vsp); 
	} vsp = 0; 
} 

y += vsp;


if (move != 0 || vsp !=0) {
	isIdle = false;
}

if (x != prevX || y != prevY || state != prevState) {
	animation = skeleton_animation_get();
	emit_tick();
} else if (!isIdle){
	animation = skeleton_animation_get();
	emit_tick();
	isIdle = true;
}
