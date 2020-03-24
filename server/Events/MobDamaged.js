let state = require('../state.js')

module.exports = function(client) {
  client.on('mob_damaged', (data) => {

    const damageData = JSON.parse(data)

    let targetRoomMobs = state.rooms[damageData.room].mobs

    targetRoomMobs = targetRoomMobs.map(mob => {
      if (mob.UID == damageData.UID) {
        mob.hp = Math.max(0, mob.hp - damageData.damage)

        const atts = {...mob.attackers}
        if (atts[damageData.playerId]) {
          atts[damageData.playerId] += damageData.damage;
        } else {
          atts[damageData.playerId] = damageData.damage
        }

        mob.attackers = atts;
        return mob
      } else {
        return mob
      }
    })

  });
}