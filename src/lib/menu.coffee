class Link
  links: []
  constructor: (@name, @path = "#", @section = "") ->
    ###link =
      path: @path
      name: @name
      section: @section###
    @links.push
      path: @path
      name: @name
      section: @section

#common
new Link "home", "/"
new Link "wall", "/bot"

module.exports = Link
