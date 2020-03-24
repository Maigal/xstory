/// @description Insert description here
// You can write your code in this editor

draw_self();
draw_set_colour(c_white);
draw_rectangle(x-20, y-40, x+20, y-45, true);
draw_set_colour(c_red);
draw_rectangle(x-19, y-41, x-19 + ((hp * 38) / 100), y-44, false);
draw_set_font(fName);
draw_set_halign(fa_center); 
draw_set_valign(fa_bottom);
draw_text(x, y - 40, hp);




//draw_self();
//draw_set_color(c_white); 
//draw_set_font(fName);
//draw_set_halign(fa_center); 
//draw_set_valign(fa_bottom);
//draw_text(x, y - 40, uid);
