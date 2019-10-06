const PORT = 3000;

const server = require('http').createServer();
const io = require('socket.io')(server);

const low = require('lowdb')
const FileSync = require('lowdb/adapters/FileSync')

const adapter = new FileSync('db.json')
const db = low(adapter)

db.defaults({ users: [] })
  .write()


server.listen(PORT, (err) => {
    if (err) throw err;
    console.log(`Listening on port.. > ${PORT}`);
});

io.on('connection', (client) => {
    console.log(`New connection.. > '${client.id}'`);

    client.emit('client_id', {
      client_id: client.id
    });

    client.on('login', (data) => {

      let loginData = JSON.parse(data)

      console.log(`login event data: > '${data}'`);

      let dbUser = db.get('users').find({username: loginData.username}).value();

      if (dbUser) {
        if (dbUser.password === loginData.password) {
          console.log('todo correcto')
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
    });
});