require('coffee-script/register')

Config = require('./lib/ewg/config')
loader = require('./lib/ewg/loader')
stage  = require('./lib/ewg/stage')

module.exports = {
  stage:           stage,
  loadYaml:        loader.loadYaml,
  loadRawYaml:     loader.loadRawYaml,
  loadYamlSection: loader.loadYamlSection,
  Config:          Config
}
