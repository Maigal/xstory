class Player{

  constructor(data){
     this.id = data.id;
     this.username = data.username;
     this.room = data.room;
     this.x = data.x;
     this.y = data.y;
     this.level = data.level;
     this.exp = data.exp;
     this.socket = data.socket
     this.cId = data.cId;
  }
 
  toString() {
    return JSON.stringify(this, this.replacer);
  }

  replacer(key, value) {
      if (key == "socket") return undefined;
      else return value;
  }

 }

 module.exports = Player;