/// @description Other player damage

with(instance_create_depth(x,y-55,0, oDamageToMob)) {
	ob = other
	dmg = other.damageTaken
	clr = c_purple
}