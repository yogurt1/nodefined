production = process.env.NODE_ENV is 'production'
path = require 'path'
fs = require 'fs'
#{extend} = require 'underscore'
merge = require 'webpack-merge'
webpack = require 'webpack'
production = process.env.NODE_ENV is 'production'
OfflinePlugin = require 'offline-plugin'

common =
output:
  path: path.join __dirname, 'dist'
  publicPath: "public"
  libraryTarget: "commonjs2"
  filename: "[name].js"
plugins: [
  new webpack.DefinePlugin(production: production),
  new webpack.optimize.OccurenceOrderPlugin(),
  new webpack.optimize.AggressiveMergingPlugin(),
  new webpack.optimize.UglifyJsPlugin(compress: warnings: false)
] if production
devtool: if production then 'source-map' else off
resolve: extensions: [ '.coffee', '.cson', '.js', '.cjsx' ]
module: loaders: [{
  test: /\.coffee$/
  loader: 'coffee-loader'
  exclude: /node_modules/
  #query: cacheDirectory: !production
},{
  test: /\.cson$/
  loader: "cson-loader"
}, {
  test: /\.cjsx$/
  loader: 'cjsx-loader'
  exclude: /node_modules/
}]

backend = merge common,
name: 'backend'
entry: './src/backend'
target: 'async-node'
externals: /^[a-z\-0-9]+$/
output: filename: 'backend.js'

frontend = merge common,
name: 'frontend'
target: 'web'
entry: './src/frontend'
output: filename: 'frontend.js'
node: process: off
plugins: [
  new OfflinePlugin()
]

module.exports = [ backend, frontend ]
