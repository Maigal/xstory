/// @description Get exp

if (global.xp >= requiredExp[global.level]) {
	var overflowExp = global.xp - requiredExp[global.level];
	global.level += 1;
	global.maxHp += global.level*10;
	event_user(3)
	global.xp = overflowExp;
}