/// @description Respawn

global.hp = global.maxHp;
hpPercentage = (global.hp * 100) / global.maxHp
realHp = hpPercentage * 275;
fakeHp = realHp;
