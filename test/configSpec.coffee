{Config, stage}  = require '../index'
expect = require('chai').expect
stub   = require('sinon').stub
fs     = require 'fs'

describe 'ewg-Config', ->
  orgYaml     = './test/fixtures/test.yml.org'
  changedYaml = './test/fixtures/test.yml.changed'
  testYaml    = './test/fixtures/test.yml'
  dynamicYaml = './test/fixtures/test.dynamic.yml'

  describe '#constructor()', ->
    it 'loads the correct yaml section for stage production', ->
      stub(stage, 'argv').returns ['--production']

      config = new Config(testYaml)
      expect( config.config.stage_indicator ).to.equal 'production'

      stage.argv.restore()

    it 'loads the correct yaml section for stage development', ->
      stub(stage, 'argv').returns []

      config = new Config(testYaml)
      expect( config.config.stage_indicator ).to.equal 'development'

      stage.argv.restore()


    it 'loads the correct yaml section for stage test', ->
      stub(stage, 'argv').returns ['--test']

      config = new Config(testYaml)
      expect( config.config.stage_indicator ).to.equal 'test'

      stage.argv.restore()

    it 'calls the onChanged call back if file chages', (done)=>
      fs.writeFileSync(dynamicYaml,
        fs.readFileSync(orgYaml))

      config = new Config(dynamicYaml, (config)=>
        expect( config.changed ).to.be.true
        done()
      )

      fs.writeFileSync(dynamicYaml,
        fs.readFileSync(changedYaml))
