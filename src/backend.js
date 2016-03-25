const app = require('./app')
const config = require('./config')
var port = process.env.PORT || config.app.port
var scale = process.env.SCALE || config.app.scale

app.listen(port, console.log("Express listening on " +port ))
