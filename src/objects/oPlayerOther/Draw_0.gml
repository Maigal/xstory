/// @description Insert description here
// You can write your code in this editor


draw_self();
draw_set_color(c_yellow); 
draw_set_font(fName);
draw_set_halign(fa_center); 
draw_set_valign(fa_bottom);
draw_text(x, y - 80, "[" + string(level) + "] " + usernameTag + nickname);
//draw_text(x, y - 120, projectileCount);


if (currentMessage != "") {
	draw_set_color(c_white); 
	draw_set_halign(fa_center); 
	draw_set_valign(fa_bottom);
	draw_text_ext(x, y - 120, currentMessage, 20, 120);
}