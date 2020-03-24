/// emit_mob_damaged(uid, damage, remainingHp)

var data = ds_map_create();
  data[? "UID"] = argument0;
  data[? "damage"] = argument1;
  data[? "remainingHp"] = argument2;
  data[? "room"] = global.rm;
  data[? "playerId"] = global.userId;
  sio_emit("mob_damaged", json_encode(data));
ds_map_destroy(data);