//show_debug_message(argument[0]);

var data = tj_decode(argument[0]);

var i;
for (i = 0; i < array_length_1d(data); i += 1) {
	var some_ok = false;
	show_debug_message(i)
	var objMob = asset_get_index(tj_get(data[i],"objectName"))
	with (objMob) {
		if (uid == tj_get(data[i],"UID")){
			x = tj_get(data[i],"x")
			y = tj_get(data[i],"y")
			some_ok = true
		}
	}
	if (!some_ok) {
		var inst = instance_create_depth(tj_get(data[i],"x"), tj_get(data[i],"y"), 0, objMob)
		with (inst) {
			uid = tj_get(data[i],"UID")
			x = tj_get(data[i],"x")
			y = tj_get(data[i],"y")
		}
	}
}