{extend} = require 'underscore'
{readdirSync} = require 'fs'

contains = (arr, val) ->
  arr and val in arr

readDir = (dirName) ->
  try
    readdirSync dirName
  catch error
    throw error
    []

readFromPackageJson = (file) ->
  unless file?
    try
      packageJson = require './package.json'
    catch error
      throw error
      []
  else packageJson = file

  sections = [
    'dependencies',
    'devDependencies',
    'peerDependencies',
    'optionalDependencies'
  ]

  deps = {}
  for section in sections
    console.log section
    deps = extend deps, packageJson[section]

module.exports = nodeExternals = (opts) ->
  isNotBinary = (x) -> !contains opts.binaryDirs
