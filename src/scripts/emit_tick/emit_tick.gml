/// emit_tick()

var data = ds_map_create();
  data[? "userId"] = global.userId;
  data[? "username"] = global.username;
  data[? "x"] = oPlayer.x;
  data[? "y"] = oPlayer.y;
  sio_emit("tick", json_encode(data));
ds_map_destroy(data);