loader = require './loader'
stage  = require './stage'

# self reloading config holder with callback on reload and stages
class Config
  constructor: (@file, onChange) ->
    @config   = loader.loadYamlSection(@file, stage.current(), onChange)

module.exports = Config
