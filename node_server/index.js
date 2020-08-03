const server = require('http').createServer();
const io = require('socket.io')(server);

io.on('connection', client => {
  let state = 1;

  client.on('connect', () => { console.log('connected'); });

  client.on('increment', () => {
    state += 1;
    console.log('State Incremented');
    client.emit('incremented', state);
  });

  client.on('getData', (pos) => { 
    client.emit('data', JSON.stringify(state));
  });

  client.on('disconnect', () => { console.log('disconnected'); });
});

server.listen(3000);