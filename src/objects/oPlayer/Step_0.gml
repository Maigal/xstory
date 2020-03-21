/// @description Insert description here
// You can write your code in this editor

var prevX = x;
var prevY = y;

//if( keyboard_check( vk_up)){
//    y = y-5;
//}else if(keyboard_check( vk_down)){
//     y = y+5;
//}else if( keyboard_check( vk_left)){
//     x = x-5;
//}else if( keyboard_check( vk_right)){
//    x = x+5;
//}

// Get input 
kLeft = -keyboard_check(vk_left); 
kRight = keyboard_check(vk_right); 
kJump = keyboard_check_pressed(vk_up);

// Use input 

move = kLeft + kRight;
hsp = move * moveSpeed; 
if (vsp < 10) { vsp += grav; };

if (move != 0) {
	image_xscale = move;
	if (skeleton_animation_get() != "run") {
      skeleton_animation_set("run");
	  image_speed = 2;
    }
} else {
	if (skeleton_animation_get() != "idle") {
      skeleton_animation_set("idle");
	  image_speed = 0.5;
    }
}





if (place_meeting(x, y + 1, oSolid)) { vsp = kJump * -jumpSpeed }

// H Collisions 
if (place_meeting(x + hsp, y, oSolid)) { while (!place_meeting(x + sign(hsp), y, oSolid)) { x += sign(hsp); } hsp = 0; } x += hsp;

// v Collisions 
if (place_meeting(x, y + vsp, oSolid)) { while (!place_meeting(x, y + sign(vsp), oSolid)) { y += sign(vsp); } vsp = 0; } y += vsp;

if (move != 0 || vsp !=0) {
	isIdle = false;
}

if (x != prevX || y != prevY) {
	animation = skeleton_animation_get();
	emit_tick();
} else if (!isIdle){
	animation = skeleton_animation_get();
	emit_tick();
	isIdle = true;
}
