require('dotenv').config();

const express = require('express');
const Http = require('http');

const app = express();

const server = Http.createServer(app);
const port = process.env.PORT || 8888;

app.use(express.json());

app.use('/', require('./api'));
app.get('/test', (req, res) => {
  res.status(200).send('test hello world: 정상작동');
});

server.listen(port, () => {
  console.log(`Express Server is started on port ${port}`);
});

module.exports = server;
