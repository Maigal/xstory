const PORT = 3000;
const Player = require('./Classes/Player');
const onLogin = require('./Events/Login');
const onDisconnect = require('./Events/Disconnect');
const onJoinRoom = require('./Events/JoinRoom');
const onTick = require('./Events/Tick');
const server = require('http').createServer();
const io = require('socket.io')(server);

let state = require('./state.js')

//require('./db.js')





server.listen(PORT, (err) => {
    if (err) throw err;
    console.log(`Listening on port.. > ${PORT}`);
});

io.on('connection', (client) => {
    console.log(`New connection.. > '${client.id}'`);

    var player;

    onLogin(client, player);

    onJoinRoom(client)
    

    client.emit('client_id', {
      client_id: client.id
    });

    onTick(client)

    
    onDisconnect(client);

    
});

setInterval(updateRooms, 5000)

function updateRooms() {
  for (r in state.rooms) {
    console.log(r, state.rooms[r])
  }
  io.sockets.in(r).emit('tick_room', 'test');
}