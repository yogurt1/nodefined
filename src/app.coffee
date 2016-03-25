express = require 'express'
path = require 'path'
#favicon = require 'serve-favicon'
logger = require 'morgan'
cookieParser = require 'cookie-parser'
bodyParser = require 'body-parser'
compression = require 'compression'
#brotli = require 'brotli'

app = express()

app.locals.ENV = process.env
isDev = app.locals.isDev = process.env.NODE_ENV isnt 'production'
app.locals.tittle = 'nodefined'
app.locals.email = 'stalinswag1@gmail.com'

app.set 'views', path.join __dirname, 'src/views'
app.set 'view engine', 'jade'
app.disable 'x-powered-by'

#app.use favicon __dirname + '/public/assets/favicon.ico'
app.use logger 'dev' if app.locals.isDev
app.use compression() unless app.locals.isDev
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: not
app.use cookieParser()
app.use express.static path.join __dirname, 'public'

app.use '/', require './routes/index'
#menu = require './lib/menu'
#app.locals.menu = menu

app.use (err, req, res, next) ->
  next unless err.status is 404
  res.status err.status or 500
  res.render 'error', error: err

module.exports = app
