show_debug_message(argument[0])

var resultMap = json_decode(argument[0]);
var list = ds_map_find_value(resultMap, "default");
var size = ds_list_size(list);
for (var n = 0; n < ds_list_size(list); n++;)
   {
   var map = ds_list_find_value(list, n);
   var curr = ds_map_find_first(map);
   while (is_string(curr))
      {
      global.Name[n] = ds_map_find_value(map, "name");
      curr = ds_map_find_next(map, curr);
      }
   ds_map_destroy(map);
   }
ds_list_destroy(list);
ds_map_destroy(resultMap);

show_debug_message(global.Name)