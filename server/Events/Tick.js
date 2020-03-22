// const db = require('../db.js')
let state = require('../state.js')
// const Player = require('../Classes/Player');

module.exports = function(client) {
  client.on('tick', (data) => {

    const tickData = JSON.parse(data);

    const player = state.onlinePlayers.find(ply => ply.id === tickData.userId);
    const playerIndex = state.onlinePlayers.findIndex(player => player.id === tickData.userId)

    if (playerIndex !== -1) {
      let targetPlayer = state.onlinePlayers[playerIndex]
      state.onlinePlayers[playerIndex] = {
        ...targetPlayer,
        x: tickData.x || targetPlayer.x,
        y: tickData.y || targetPlayer.y
      }

      console.log({id: targetPlayer.id, x: targetPlayer.x, y: targetPlayer.y, dir: tickData.dir, animation: tickData.animation})
      client.to(player.room).broadcast.emit('tick_other', {id: targetPlayer.id, x: targetPlayer.x, y: targetPlayer.y, dir: tickData.dir, animation: tickData.animation});
    }
    
  });
}