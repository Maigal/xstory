// const db = require('../db.js')
let state = require('../state.js')
// const Player = require('../Classes/Player');

module.exports = function(client) {
  client.on('tick', (data) => {

    const tickData = JSON.parse(data);

    //console.log('tickData', tickData)

    const player = state.onlinePlayers.find(ply => ply.id === tickData.userId);
    const playerIndex = state.onlinePlayers.findIndex(player => player.id === tickData.userId)

    if (playerIndex !== -1) {
      let targetPlayer = state.onlinePlayers[playerIndex]
      state.onlinePlayers[playerIndex] = {
        ...targetPlayer,
        x: tickData.x || targetPlayer.x,
        y: tickData.y || targetPlayer.y,
        hp: tickData.hp || targetPlayer.hp,
        maxHp: tickData.maxHp || targetPlayer.maxHp,
        level: tickData.level || targetPlayer.level,
        exp: tickData.exp || targetPlayer.exp,
      }
      client.to(player.room).broadcast.emit('tick_other', {id: targetPlayer.id, x: targetPlayer.x, y: targetPlayer.y, dir: tickData.dir, animation: tickData.animation});
    }
    
  });
}