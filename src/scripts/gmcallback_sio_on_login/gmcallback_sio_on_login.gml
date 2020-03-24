var data = json_decode(argument0);

global.userId = data[? "id"];
global.username = data[? "username"];
global.rm = data[? "room"];
global.nextRoom = data[? "room"];
global.x = data[? "x"];
global.y = data[? "y"];

var rm = asset_get_index(global.nextRoom);
room_goto(rm);

global.nextRoom = "";



//show_debug_message("login " + string(global.clientId));