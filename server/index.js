const PORT = 3000;
const Player = require('./Classes/Player');
const onLogin = require('./Events/Login');
const onDisconnect = require('./Events/Disconnect');
const onJoinRoom = require('./Events/JoinRoom');
const onTick = require('./Events/Tick');
const onMobDamaged = require('./Events/MobDamaged');
const server = require('http').createServer();
const io = require('socket.io')(server);
const roomSettings = require('./roomSettings')
const helpers = require('./helpers')

let state = require('./state.js')
let mobUID = 0;

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

    onMobDamaged(client)

    
    onDisconnect(client);

    
});

setInterval(updateRooms, 50)

function updateRooms() {
  for (room in state.rooms) {
    const config = roomSettings[room]
    const roomState = state.rooms[room]
    //console.log('cfg', config)
    //console.log('roomState', roomState)

    if (roomState.players.length > 0) {
      roomState.mobs = roomState.mobs.map(mob => {
        const maxCoordinates = {
          x1: config.mobs.areas[0].x1,
          y1: config.mobs.areas[0].y1,
          x2: config.mobs.areas[0].x2,
          y2: config.mobs.areas[0].y2
        }
        const newCoordinates = helpers.calculateNextCoordinates(
          {x: mob.x, y: mob.y},
          maxCoordinates,
          mob.movement,
          mob.direction,
          mob.speed
          )

        return {
          ...mob,
          x: newCoordinates.x,
          y: newCoordinates.y,
          direction: newCoordinates.direction
        }
      })
      if (roomState.mobs.length < config.mobs.amount) {
        for(let i = 0; i < config.mobs.amount - roomState.mobs.length; i++) {
          const coordinates = helpers.getAreaCoordinates(config.mobs.areas);
          roomState.mobs.push({
            ...config.mobs.mobType,
            x: coordinates.x,
            y: coordinates.y,
            UID: mobUID
          })
          mobUID++
        }
      }
      //console.log('rmobs', roomState.mobs)
      //console.log('roomstate', roomState)
      
      io.sockets.in(room).emit('tick_room', JSON.stringify(roomState.mobs));
    }
  }
  //console.log('srooms', state.rooms)
}