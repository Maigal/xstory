const PORT = 3000;
const Player = require('./Classes/Player');

const server = require('http').createServer();
const io = require('socket.io')(server);

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')

const adapter = new FileSync('db.json')
const db = low(adapter)

db.defaults({ users: [] })
  .write();

var onlinePlayers = []


server.listen(PORT, (err) => {
    if (err) throw err;
    console.log(`Listening on port.. > ${PORT}`);
});

io.on('connection', (client) => {
    console.log(`New connection.. > '${client.id}'`);

    var player;

    client.emit('client_id', {
      client_id: client.id
    });

    client.on('login', (data) => {

      let loginData = JSON.parse(data)

      console.log(`login event data: > '${data}'`);

      let dbUser = db.get('users').find({username: loginData.username}).value();
      console.log('user data ' + JSON.stringify(dbUser));

      if (dbUser) {
        if (dbUser.password === loginData.password) {
          
          if (!onlinePlayers.find(user => user.id === dbUser.id)) {
            player = new Player({
              socket: client,
              id: dbUser.id,
              username: dbUser.username,
              map: dbUser.location.map,
              x: dbUser.location.x,
              y: dbUser.location.y
            });
            onlinePlayers.push(player);
            
            console.log(player.toString())
            client.emit("login", player.toString())

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

    client.on('disconnect', (data) => {
        console.log(`Client disconnected.. > '${client.id}'`);

        onlinePlayers.splice(onlinePlayers.indexOf(player), 1);
        console.log('remaining players', onlinePlayers)
    });
});