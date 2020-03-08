// const db = require('../db.js')
let state = require('../state.js')
// const Player = require('../Classes/Player');

module.exports = function(client) {
  client.on('tick', (data) => {

    const tickData = JSON.parse(data);
    console.log('td', tickData)

    //const player = state.onlinePlayers.find(ply => ply.id === data.userId);
    const playerIndex = state.onlinePlayers.findIndex(player => player.id === tickData.userId)

    console.log('pi', playerIndex)

    if (playerIndex !== -1) {
      let targetPlayer = state.onlinePlayers[playerIndex]
      state.onlinePlayers[playerIndex] = {
        ...targetPlayer,
        x: tickData.x || targetPlayer.x,
        y: tickData.y || targetPlayer.y
      }
      console.log('op', state.onlinePlayers)
    }
    
  });
}