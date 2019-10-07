/// @description Insert description here
// You can write your code in this editor


draw_sprite(sprite_index, isLocalplayer, x,y);
draw_set_color(c_white); draw_set_font(ftArial);
draw_set_halign(fa_center); draw_set_valign(fa_bottom);
draw_text(x, y - 42, string(username));