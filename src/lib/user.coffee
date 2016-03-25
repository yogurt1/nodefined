module.exports = class User
  constructor: (user) ->
    @name ?= user.name
    @id ?= user.id
    @login ?= user.login

module.exports.root = class Root extends User
  constructor: -> super id: 0, name: 'Root', login: 'root'

module.exports.guest = class Guest extends User
  constructor: (arg) ->
    super name: "Guest", id: 99
