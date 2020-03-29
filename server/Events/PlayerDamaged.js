module.exports = function(client) {
  client.on('player_damaged', (data) => {

    const damageData = JSON.parse(data)

    //console.log('dmgData', damageData)

    client.to(damageData.room).broadcast.emit('player_damaged_other', {playerId: damageData.playerId, damage: damageData.damage});

  });
}