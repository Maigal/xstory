/// emit_chat(msg)
/// @param msg string

var data = ds_map_create();
  data[? "userId"] = global.userId;
  data[? "username"] = global.username;
  data[? "msg"] = argument0;

  sio_emit("chat", json_encode(data));
ds_map_destroy(data);