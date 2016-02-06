process = require 'process'

stage = {
  current: ->
    return 'production' if stage.isProduction()
    return 'test'       if stage.isTest()
    'development'

  isProduction: ->
    '--production' in stage.argv()

  isTest: ->
    '--test' in stage.argv()

  isDevelopment: ->
    (!stage.isProduction() && !stage.isTest())

  argv: ->
    process.argv
}

module.exports = stage
