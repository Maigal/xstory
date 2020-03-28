/// @description Insert description here
// You can write your code in this editor

if (!isImmune) {
	isImmune = true;
	alarm[10] = 90;
	image_alpha = 0.5;
	var playerDmgTaken = other.damage - global.level
	emit_player_damaged(playerDmgTaken)

	with(instance_create_depth(x,y-55,0, oDamageToMob)) {
		ob = other
		dmg = playerDmgTaken
		clr = c_red
	}

	with(oExp){
		dmgT = playerDmgTaken
		event_user(1)
	}
}

