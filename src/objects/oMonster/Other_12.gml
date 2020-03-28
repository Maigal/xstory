/// @description Getting hit by another player


with(instance_create_depth(x,y-20,0, oDamageToMob)) {
	ob = other
	dmg = other.damageAmount
	clr = c_blue
}

