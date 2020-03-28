/// @description Get hit

show_debug_message("ENTR");
global.hp -= dmgT;
hpPercentage = (global.hp * 100) / global.maxHp
realHp = hpPercentage * 275;

show_debug_message(realHp)
show_debug_message(fakeHp)