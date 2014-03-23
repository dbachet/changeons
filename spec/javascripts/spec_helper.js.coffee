#= require application
#= require sinon
#= require ember-mocha-adapter

Ember.Test.registerHelper 'respondGET', (app, url, payload) ->
  data = JSON.stringify(payload)
  server.respondWith('GET', url, [200, {"Content-Type":"application/json"}, data])

Ember.Test.adapter = Ember.Test.MochaAdapter.create()
Ch.setupForTesting()
Ch.injectTestHelpers()

# Making mocha work nicely with Ember
mocha.globals(['Ember', 'DS', 'App', 'MD5'])
mocha.timeout 2000
chai.Assertion.includeStack = true
Konacha.reset = Ember.K

# Turn off jQuery animmations
$.fx.off = true

window.testHelper =
  lookup: (object, object_name) ->
    name = object_name || "main"
    return Ch.__container__.lookup(object + ":" + name)

  fakeServer: ->
    sinon.fakeServer.create()

beforeEach ->
  window.server = testHelper.fakeServer()
  window.server.autoRespond = true

afterEach ->
  Ch.reset()
  window.server.restore()
