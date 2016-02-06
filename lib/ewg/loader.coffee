fs   = require 'fs'
log  = require 'ewg-logging'
yaml = require 'js-yaml'

loadRawYaml = (file) ->
  unless fs.existsSync file
    throw new Error("config file #{file} not found")

  yaml.safeLoad(fs.readFileSync("#{file}", 'utf8'))

loadYaml = (file, cbOnChange) ->
  config = loadRawYaml file
  return config unless cbOnChange

  fs.watch(file, ->
    config = loadRawYaml file
    log.info "file reloaded (#{file})"
    cbOnChange(config)
  )

  return config

loadYamlSection = (file, section, cbOnChange) ->
  config = loadYaml(file, (config) ->
    unless config.hasOwnProperty section
      throw new Error("could not load section #{section} from file #{file}")

    cbOnChange?(config[section])
  )

  unless config.hasOwnProperty section
    throw new Error("could not load section #{section} from file #{file}")

  return config[section]

module.exports =
  loadYaml:        loadYaml
  loadRawYaml:     loadRawYaml
  loadYamlSection: loadYamlSection
