/// emit_tick(animation)
/// @param animation string

var data = ds_map_create();
  data[? "userId"] = global.userId;
  data[? "username"] = global.username;
  data[? "x"] = oPlayer.x;
  data[? "y"] = oPlayer.y;
  data[? "animation"] = oPlayer.animation;
  data[? "dir"] = oPlayer.image_xscale;
  sio_emit("tick", json_encode(data));
ds_map_destroy(data);