let state = require('../state.js');
const db = require('../db.js');

module.exports = function(client, player) {
  client.on('join_room', (data) => {

    const joinRoomData = JSON.parse(data);
    player = state.onlinePlayers.find(ply => ply.id === joinRoomData.userId);


     console.log(`join room data: '${data}'`);

     client.to(player.room).broadcast.emit('create_player_other', player.toString());

     for (let i in state.onlinePlayers) {
       if (state.onlinePlayers[i] !== player && state.onlinePlayers[i].room === player.room) {
           console.log('Player correcto!!', state.onlinePlayers[i].toString());
           client.emit('create_player_other', state.onlinePlayers[i].toString());
       }
     }
    }
)};