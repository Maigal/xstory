/// @description Insert description here
// You can write your code in this editor

if (isVisible) {
	draw_set_color(c_white);
	draw_set_font(fLogin);
	draw_rectangle(300, 500, 700, 530, true);
	draw_rectangle_color(300, 500, 700, 530, $EEEEEE,$EEEEEE,$EEEEEE,$EEEEEE,false);


	//draw the text
	draw_set_color($333333);
	draw_set_valign(fa_middle);
	draw_set_halign(fa_left);
	draw_text(310, 515, input);
}


