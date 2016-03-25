express = require 'express'
router = express.Router()
users = require '../users.coffee'

new users "tratata"

# GET users listing.
router.get '/', (req, res) ->
  #res.send 'respond with a resource'

  console.log users::users
  res.render 'user', users: users::users

module.exports = router
