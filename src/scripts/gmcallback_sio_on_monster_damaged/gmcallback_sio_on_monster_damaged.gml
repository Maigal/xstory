var data = json_decode(argument[0]);

with(oMonster){
	if (uid = data[? "mobUID"]) {
		damageAmount = data[? "damage"]
		event_user(2)
	}
}