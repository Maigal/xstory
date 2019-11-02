const PORT = 3000;
const Player = require('./Classes/Player');
const onLogin = require('./Events/Login');
const onDisconnect = require('./Events/Disconnect');
const onJoinRoom = require('./Events/JoinRoom');
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

    
    onDisconnect(client, player);

    
});