var data = json_decode(argument[0]);
show_debug_message(argument[0]);

//with(instance_create_depth(data[? "x"], data[? "y"], 0, oPlayerOther)) {	
//	playerId = data[? "id"];
//	username = data[? "username"];
//}

with(oPlayerOther){
	if (playerId = data[? "userId"]) {
		currentMessage = data[? "msg"]
		alarm[11] = 200
	}
}