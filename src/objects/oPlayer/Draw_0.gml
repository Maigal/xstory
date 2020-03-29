/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_color(c_white); 
draw_set_font(fName);
draw_set_halign(fa_center); 
draw_set_valign(fa_bottom);
if (currentMessage != "") {
	draw_text_ext(x, y - 120, currentMessage, 20, 120);
}
//draw_text(x, y - 90, move);
//draw_text(x, y - 110, vsp);
//draw_text(x, y - 130, state);
//draw_text(x, y - 150, skeleton_animation_get());
draw_text(x, y - 150, image_index);


