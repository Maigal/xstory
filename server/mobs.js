class Mob {
  constructor(id, name, objectName, hp, speed, movement, direction) {
    this.id = id;
    this.name = name;
    this.objectName = objectName;
    this.hp = hp;
    this.speed = speed;
    this.movement = movement;
    this.direction = direction;
  }


}

module.exports = {
  mob1: new Mob(0, "Box", "oBox", 100, 2, "horizontal", "right")
}