var data = json_decode(argument0);

show_debug_message(argument0)

global.userId = data[? "id"];
global.username = data[? "username"];
global.rm = data[? "room"];
global.nextRoom = data[? "room"];
global.x = data[? "x"];
global.y = data[? "y"];
global.hp = data[? "hp"];
global.maxHp = data[? "maxHp"];
global.level = data[? "level"];
global.xp = data[? "exp"];
global.skinColor = data[? "skinColor"];
global.eyeColor = data[? "eyeColor"];
global.role = data[? "role"];

var rm = asset_get_index(global.nextRoom);
room_goto(rm);

global.nextRoom = "";



//show_debug_message("login " + string(global.clientId));