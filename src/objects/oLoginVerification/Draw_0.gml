/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);
if (msg != "") {
	switch (msg) {
		case "Username does not exist":
			draw_set_color(c_red);
			break;
			
		case "Password is incorrect":
			draw_set_color(c_red);
			break;
			
		default:
			draw_set_color(c_green);
			break;
	}
}