chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'darts', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/memes')(@robot)

    it 'registers a respond listener', ->
      expect(@robot.respond).to.have.been.calledWith(/meme me ((.+)(\".+\"))/i)

    it 'responds to the list command', ->
      expect(@robot.respond).to.have.been.calledWith(/meme list/i)
