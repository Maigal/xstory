var data = json_decode(argument[0]);
show_debug_message(argument[0])

with(oPlayerOther){
	if (playerId = data[? "playerId"]) {
		damageTaken = data[? "damage"]
		event_user(1)
	}
}