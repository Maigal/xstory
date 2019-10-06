/// emit_login()
/// @param username:string
/// @param password:string

var data = ds_map_create();
  data[? "username"] = argument0;
  data[? "password"] = argument1;
  sio_emit("login", json_encode(data));
ds_map_destroy(data);