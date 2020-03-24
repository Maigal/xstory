const mobs = require('./mobs')

module.exports = {
  roomTest1: {
    mobs: {
      mobType: mobs.mob1,
      amount: 3,
      areas: [
        {
          x1: 100,
          y1: 400,
          x2: 600,
          y2: 400
        }
      ]
    }
  }
}

// x1: 1312,
// y1: 610,
// x2: 1784,
// y2: 610