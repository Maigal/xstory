const db = require('../db.js')
let state = require('../state.js')
const Player = require('../Classes/Player');

module.exports = function(client, player) {
  client.on('login', (data) => {

    let loginData = JSON.parse(data)

    console.log(`login event data: > '${data}'`);

    let dbUser = db.get('users').find({username: loginData.username}).value();
    console.log('user data ' + JSON.stringify(dbUser));

    if (dbUser) {
      if (dbUser.password === loginData.password) {
        
        if (!state.onlinePlayers.find(user => user.id === dbUser.id)) {
          player = new Player({
            socket: client,
            id: dbUser.id,
            username: dbUser.username,
            room: dbUser.room,
            x: dbUser.x,
            y: dbUser.y
          });
          state.onlinePlayers.push(player);
          console.log('Online players', state.onlinePlayers.map(el => el.toString()))

          client.join(player.room)
          client.emit("login", player.toString())

          client.to(player.room).broadcast.emit('create_player_other', player.toString());

          for (let i in state.onlinePlayers) {
            if (state.onlinePlayers[i] !== player && state.onlinePlayers[i].room === player.room) {
                console.log('Player correcto!!', state.onlinePlayers[i].toString());
                client.emit('create_player_other', state.onlinePlayers[i].toString());
            }
        }

        } else {
          client.emit("login_failure", "User is already online");
        }

      } else {
        client.emit("login_failure", "Invalid password");
      }
    } else {
      client.emit("login_failure", "Username does not exist");
    }
    //client.emit("login", data);
  });
}