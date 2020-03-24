const mobs = require('./mobs')

module.exports = {
  roomTest1: {
    mobs: {
      mobType: mobs.mob1,
      amount: 3,
      areas: [
        {
          x1: 1360,
          y1: 610,
          x2: 1750,
          y2: 610
        }
      ]
    }
  }
}

