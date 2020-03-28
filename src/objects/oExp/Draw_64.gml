/// @description Insert description here
// You can write your code in this editor

var hpPercentage = (global.hp * 100) / global.maxHp

draw_set_color($333333);
draw_rectangle(125, 54, 400, 106, true)
draw_set_alpha(0.5)
draw_rectangle(125, 55, 400, 105, false)
draw_set_alpha(1)
draw_set_color(c_red);
draw_rectangle(125, 55, 125 + (hpPercentage * 275) / 100, 105, false)



draw_set_color($333333)
draw_circle(x+50, y+50, 52, false);
draw_exp_ring(x+50,y+50,40,10,100,100,90,360,-1,$039bc1)
draw_exp_ring(x+50,y+50,40,10,100,((global.xp * 100) / requiredExp[global.level]) ,90,360,-1,$00ccff)

draw_set_color(c_white); 
draw_set_font(fLevel);
draw_set_halign(fa_center); 
draw_set_valign(fa_center);
draw_text(x+50, y+50, global.level);
draw_set_font(fName);
draw_text(x+50, y+80, string(round((global.xp * 100) / requiredExp[global.level])) + "%");



