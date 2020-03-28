/// emit_mob_damaged(uid, damage, remainingHp)

var data = ds_map_create();
  data[? "playerId"] = global.userId;
  data[? "room"] = global.rm;
  data[? "damage"] = argument0;
  sio_emit("player_damaged", json_encode(data));
ds_map_destroy(data);