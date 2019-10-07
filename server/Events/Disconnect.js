let state = require('../state.js')

module.exports = function(client, player) {
  client.on('disconnect', (data) => {
    console.log(`Client disconnected.. > '${client.id}'`);

    state.onlinePlayers.splice(state.onlinePlayers.indexOf(player), 1);
    console.log('remaining players', state.onlinePlayers)
  });
}