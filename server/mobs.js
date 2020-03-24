
class Mob {
  constructor(id, name, objectName, hp, exp, speed, movement, direction) {
    this.id = id;
    this.name = name;
    this.objectName = objectName;
    this.maxHp = hp;
    this.hp = hp;
    this.exp = exp;
    this.speed = speed;
    this.movement = movement;
    this.direction = direction;
    this.attackers = {}
  }


}

module.exports = {
  mob1: new Mob(0, "Box", "oBox", 100, 5, 2, "horizontal", "right")
}