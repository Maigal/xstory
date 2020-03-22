
module.exports = {
  getAreaCoordinates: function(areas) {
    console.log('Areas', areas)
    const targetArea = areas[randomInRange(0, areas.length-1)]
    return {
      x: randomInRange(targetArea.x1, targetArea.x2),
      y: randomInRange(targetArea.y1, targetArea.y2)
    }
  }
}


function randomInRange(n1, n2) {
  return Math.floor(Math.random()*(n2-n1+1)+n1);
}