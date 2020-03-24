const PORT = 3000;
const Player = require('./Classes/Player');
const onLogin = require('./Events/Login');
const onDisconnect = require('./Events/Disconnect');
const onJoinRoom = require('./Events/JoinRoom');
const onTick = require('./Events/Tick');
const onChat = require('./Events/Chat');
const onMobDamaged = require('./Events/MobDamaged');
const server = require('http').createServer();
const io = require('socket.io')(server);
const roomSettings = require('./roomSettings')
const helpers = require('./helpers')


// CLIENT TEMP WRAPPER
const express = require('express')
const app = express();
const path = require('path');
// END CLIENT TEMP WRAPPER

let state = require('./state.js')
let mobUID = 0;

//require('./db.js')

// CLIENT TEMP WRAPPER 
app.use(express.static(path.join(__dirname, '/../client')));

app.get('*', (req,res) =>{
    res.sendFile(path.join(__dirname+'/../client/index.html'));
});

app.listen(80, () => {
    console.log('Listening on port 80!')
})
// END CLIENT TEMP WRAPPER 

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

    onChat(client)

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
      roomState.mobs = roomState.mobs.filter(mob => !mob.isDead).map(mob => {
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

        let conditionalData = {}

        if (mob.hp <= 0) {
          conditionalData.isDead = true
          conditionalData.killExp = {}
          Object.keys(mob.attackers).forEach(key => {
            conditionalData.killExp[key] = (mob.attackers[key] * 100) / mob.maxHp
          })
        }

        return {
          ...mob,
          x: newCoordinates.x,
          y: newCoordinates.y,
          direction: newCoordinates.direction,
          ...conditionalData
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