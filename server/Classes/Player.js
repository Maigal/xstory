class Player{

  constructor(data){
     this.id = data.id;
     this.username = data.username;
     this.map = data.map;
     this.x = data.x;
     this.y = data.y;
     this.socket = data.socket
  }
 
  toString() {
    return JSON.stringify(this, this.replacer);
  }

  replacer(key, value) {
      // we don't need to send the socket object to the client
      if (key == "socket") return undefined;
      else return value;
  }

 }

 module.exports = Player;