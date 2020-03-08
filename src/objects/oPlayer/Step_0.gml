/// @description Insert description here
// You can write your code in this editor

var prevX = x;
var prevY = y;

if( keyboard_check( vk_up)){
    y = y-5;
}else if(keyboard_check( vk_down)){
     y = y+5;
}else if( keyboard_check( vk_left)){
     x = x-5;
}else if( keyboard_check( vk_right)){
    x = x+5;
}

if (x != prevX || y != prevY) {
	emit_tick()
}
