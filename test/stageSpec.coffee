stage   = require('../index').stage
expect  = require('chai').expect
stub    = require('sinon').stub

describe 'ewg-stage', ->
  describe '#current()', ->
    it 'returns production if argv --production isset', ->
      stub(stage, 'argv').returns ['--production']

      expect( stage.current() ).to.equal 'production'

      stage.argv.restore()

    it 'returns test if argv --test isset', ->
      stub(stage, 'argv').returns ['--test']

      expect( stage.current() ).to.equal 'test'

      stage.argv.restore()

    it 'returns developemnt if argv --developemnt isset', ->
      stub(stage, 'argv').returns ['--development']

      expect( stage.current() ).to.equal 'development'

      stage.argv.restore()

    it 'returns developemnt if no argv is given', ->
      stub(stage, 'argv').returns []

      expect( stage.current() ).to.equal 'development'

      stage.argv.restore()
