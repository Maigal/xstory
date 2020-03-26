/// @description Insert description here
// You can write your code in this editor

if (!isVisible) {
	isVisible = true;
	keyboard_string = "";
	global.uiInteraction = true;
} else if (input != "") {
	emit_chat(input);
	global.currentMessage = input;
	isVisible = false;
	input = "";
	keyboard_string = "";
	global.uiInteraction = false;
	with(oPlayer) {
		event_user(0)
	}
} else {
	isVisible = false;
	global.uiInteraction = false;
}