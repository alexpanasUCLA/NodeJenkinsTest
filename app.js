const express = require('express')
const app = express()

app.get('/', (req, res) => res.send('Rolling update!'))

var server = app.listen(3000, () => {
    console.log("Listening on port " + server.address().port + "...");
});

module.exports = server;
