module.exports = (base, mixins...) ->
  class Mixed extends base
  for mixin in mixins by -1
    Mixed::[name] = method for name, method of mixin::
  Mixed
