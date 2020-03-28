var data = json_decode(argument[0]);
//show_debug_message("Creating another user" + data[? "username"])
show_debug_message("TTTTTTTTTTTTTTTTTTTTTTTTTTT");
show_debug_message(argument[0]);

show_debug_message(data[? "skinColor"])

with(instance_create_depth(data[? "x"], data[? "y"], 0, oPlayerOther)) {	
	playerId = data[? "id"];
	nickname = data[? "nickname"];
	sColor = data[? "skinColor"];
	eColor = data[? "eyeColor"];
	role = data[? "role"];
	level = data[? "level"];
	event_user(15)
}