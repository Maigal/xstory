/// @description Insert description here
// You can write your code in this editor


draw_set_color(c_white);
draw_set_font(fLogin);
draw_rectangle(x, y, x +200, y + 40, true);
draw_rectangle_color(x+2,y+2,x+198, y+38, $EEEEEE,$EEEEEE,$EEEEEE,$EEEEEE,false);


//draw the text
draw_set_color($333333);
draw_text(x+10, y+5, input);