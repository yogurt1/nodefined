module.exports = (str) ->
  first = do str[..0].toUpperCase
  second = do str[1..].toLowerCase
  "#{first}#{second}"
