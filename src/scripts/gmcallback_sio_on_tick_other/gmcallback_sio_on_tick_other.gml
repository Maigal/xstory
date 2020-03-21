var data = json_decode(argument[0]);

//with(instance_create_depth(data[? "x"], data[? "y"], 0, oPlayerOther)) {	
//	playerId = data[? "id"];
//	username = data[? "username"];
//}

with(oPlayerOther){
	if (playerId = data[? "id"]) {
		x = data[? "x"]
		y = data[? "y"]
		image_xscale = data[? "dir"]
		animation = data[? "animation"]
	}
}