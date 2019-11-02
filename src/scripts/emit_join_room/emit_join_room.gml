/// emit_join_room()
/// @param room:string


var data = ds_map_create();
  data[? "userId"] = global.userId;
  data[? "room"] = argument0;
  sio_emit("join_room", json_encode(data));
ds_map_destroy(data);