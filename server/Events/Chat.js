// const db = require('../db.js')
let state = require('../state.js')
// const Player = require('../Classes/Player');

module.exports = function(client) {
  client.on('chat', (data) => {

    const chatData = JSON.parse(data);

    //console.log('chatData', chatData)

    const player = state.onlinePlayers.find(ply => ply.id === chatData.userId);

    client.to(player.room).broadcast.emit('chat_other', data);

    // const player = state.onlinePlayers.find(ply => ply.id === tickData.userId);
    // const playerIndex = state.onlinePlayers.findIndex(player => player.id === tickData.userId)

    // if (playerIndex !== -1) {
    //   let targetPlayer = state.onlinePlayers[playerIndex]
    //   state.onlinePlayers[playerIndex] = {
    //     ...targetPlayer,
    //     x: tickData.x || targetPlayer.x,
    //     y: tickData.y || targetPlayer.y
    //   }
    //   client.to(player.room).broadcast.emit('tick_other', {id: targetPlayer.id, x: targetPlayer.x, y: targetPlayer.y, dir: tickData.dir, animation: tickData.animation});
    // }
    
  });
}