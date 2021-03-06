gml_pragma("global", "sio_init()");

#region macros
	#macro URL "http://localhost:3000"
#endregion

#region SocketIO
	sio_connect_by_url(URL);
#endregion

#region SocketIO:Events
	//sio_addEvent("pong");
	sio_addEvent("client_id");
	sio_addEvent("login");
	sio_addEvent("login_failure");
	sio_addEvent("status");
	sio_addEvent("create_player_other");
	sio_addEvent("join_room");
	sio_addEvent("remove_player_other");
	sio_addEvent("tick");
	sio_addEvent("tick_other");
	sio_addEvent("tick_room");
	sio_addEvent("mob_damaged");
	sio_addEvent("monster_damaged");
	sio_addEvent("chat");
	sio_addEvent("chat_other");
	sio_addEvent("player_damaged");
	sio_addEvent("player_damaged_other");
#endregion