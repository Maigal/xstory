var data = json_decode(argument0);

global.clientId = data[? "client_id"];
show_debug_message("client_id: " + string(global.clientId));