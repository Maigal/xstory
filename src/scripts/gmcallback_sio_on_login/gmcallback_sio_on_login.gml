var data = json_decode(argument0);

global.userId = data[? "id"];
global.username = data[? "username"];
global.currentRoom = data[? "map"];
global.x = data[? "x"];
global.y = data[? "y"];

var rm = asset_get_index(global.currentRoom);
room_goto(rm);



//show_debug_message("login " + string(global.clientId));