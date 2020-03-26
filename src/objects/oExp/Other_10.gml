/// @description Get exp

if (global.xp >= requiredExp[global.level]) {
	var overflowExp = global.xp - requiredExp[global.level];
	global.level += 1;
	global.xp = overflowExp;
}