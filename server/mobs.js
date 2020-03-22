class Mob {
  constructor(id, name, objectName, hp) {
    this.id = id;
    this.name = name;
    this.objectName = objectName;
    this.hp = hp;
  }
}

module.exports = {
  mob1: new Mob(0, "Box", "oBox", "100")
}