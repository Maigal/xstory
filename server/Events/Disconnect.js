let state = require('../state.js')

module.exports = function(client) {
  client.on('disconnect', (data) => {
    console.log(`Client disconnected.. > '${client.id}'`);

    const player = state.onlinePlayers.find(ply => ply.cId === client.id);

    if (player) {
      client.to(player.room).broadcast.emit('remove_player_other', player.id);
    }

    state.onlinePlayers.splice(state.onlinePlayers.indexOf(player), 1);
    console.log('remaining players', state.onlinePlayers)
  });
}