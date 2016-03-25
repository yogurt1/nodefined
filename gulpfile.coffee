# $ = require 'gulp-load-plugins'
g = require 'gulp'
{watch, task, tasks, src, dest} = g

$ =
  coffee: require 'gulp-coffee'
  plumber: require 'gulp-plumber'
  sm: require 'gulp-sourcemaps'
  uglify: require 'gulp-uglify'

assetsDir = './public/assets'
stylesDir = './src/styles'
scriptsDir = './src/scripts'

g.task 'coffee', ->
  src "#{scriptsDir}/*.coffee"
    .pipe do $.plumber
    .pipe do $.coffee
    .pipe do $.sm.init
    .pipe do $.uglify
    .pipe $.sm.write '.'
    .pipe dest assetsDir

###g.task 'clean', ->
  #cleanExt = [ 'js', 'js.map', 'css', 'css.map' ]
  #cleanList = new Array
  #cleanList.push "#{assetsDir}/.#{ext}" for ext in cleanExt
  src cleanList
    .pipe do $.plumber
    .pipe do $.rimraf "${assetsDir}/*"
###

g.task 'watch', ->
  #gulp.watch
  ""

g.task 'build', [
  'coffee'
]

g.task 'default', [
  'build'
  #'develop',
  'watch'
]
