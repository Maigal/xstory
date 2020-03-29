/// @description Insert description here
// You can write your code in this editor

x = 150;
y = 150;

if (state == "dead") {
	state = "idle"
	with(oExp) {
		global.interactionBlocked = false;
		event_user(3)
	}
}