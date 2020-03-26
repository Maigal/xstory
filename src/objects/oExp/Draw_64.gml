/// @description Insert description here
// You can write your code in this editor

draw_exp_ring(x+50,y+50,40,10,100,100,90,360,-1,c_olive)
draw_exp_ring(x+50,y+50,40,10,100,((global.xp * 100) / requiredExp[global.level]) ,90,360,-1,c_orange)

draw_set_color(c_white); 
draw_set_font(fLevel);
draw_set_halign(fa_center); 
draw_set_valign(fa_center);
draw_text(x+50, y+20, global.level);
draw_text(x+50, y+20, global.level);


