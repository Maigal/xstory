
module.exports = {
  getAreaCoordinates: function(areas) {
    console.log('Areas', areas)
    const targetArea = areas[randomInRange(0, areas.length-1)]
    return {
      x: randomInRange(targetArea.x1, targetArea.x2),
      y: randomInRange(targetArea.y1, targetArea.y2)
    }
  },
  calculateNextCoordinates: function(coordinates, maxCoordinates, movement, direction, speed) {
    switch (movement) {
      case 'horizontal':
          if (direction === 'left') {
            if (maxCoordinates.x1 <= coordinates.x - speed) {
              return {
                x: coordinates.x - speed,
                y: coordinates.y,
                direction: direction
              }
            } else {
              return {
                x: coordinates.x + speed,
                y: coordinates.y,
                direction: 'right'
              }
            }
          } else if (direction === 'right') {
            if (maxCoordinates.x2 >= coordinates.x + speed) {
              return {
                x: coordinates.x + speed,
                y: coordinates.y,
                direction: direction
              }
            } else {
              return {
                x: coordinates.x - speed,
                y: coordinates.y,
                direction: 'left'
              }
            }
          }
        break;

      default:
        return {
          x: coordinates.x,
          y: coordinates.y
        }
    }
  }
}

function randomInRange(n1, n2) {
  return Math.floor(Math.random()*(n2-n1+1)+n1);
}