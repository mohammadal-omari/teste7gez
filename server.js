const express = require('express');
const path = require('path');
const http = require('http');
const app = express();


const PORT = process.env.PORT || 3002;

app.use(express.static(__dirname + '/e7gez_super_admin/dist'));
// app.get('/*', (req,res) => res.sendFile(path.join(__dirname + '/e7gez_super_admin/dist/index.html')));

var server = http.createServer(app);
server.listen(PORT, () => console.log(`Running ..... on http://localhost:${PORT}`));
