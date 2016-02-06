loader = require('../index')
expect = require('chai').expect

describe 'ewg-config.loader', ->
  testYaml = './test/fixtures/test.yml'

  describe '#loadRawYaml()', ->
    it 'loads the correct yaml', ->
      yaml = loader.loadRawYaml testYaml
      
      expect( yaml.development.stage_indicator ).to.equal 'development'

    it 'throws an exception if the file doesnt exist', ->
      expect(-> loader.loadRawYaml('foo.bar') ).to.throw()

  describe '#loadYaml()', ->
    it 'loads the correct yaml', ->
      yaml = loader.loadYaml testYaml

      expect( yaml.development.stage_indicator ).to.equal 'development'

  describe '#loadYamlSection()', ->
    it 'loads the correct yaml', ->
      yaml = loader.loadYamlSection(testYaml, 'development')

      expect( yaml.stage_indicator ).to.equal 'development'

    it 'throws an exception if the section doesnt exist', =>
      expect(-> loader.loadYamlSection(testYaml, 'foo.bar') ).to.throw()
