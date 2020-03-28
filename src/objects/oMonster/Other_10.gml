/// @description Getting hit by player

emit_mob_damaged(uid, damageAmount, hp-damageAmount)

with(instance_create_depth(x,y-20,0, oDamageToMob)) {
	ob = other
	dmg = other.damageAmount
}
hp -= damageAmount;

