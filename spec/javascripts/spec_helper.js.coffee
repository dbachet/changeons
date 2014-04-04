#= require application
#= require sinon
#= require ember-mocha-adapter

Ember.Test.registerHelper 'signIn', (app, param, user) ->
  Ember.run ->
    unless user?
      store = testHelper.lookup('store','main')
      user = store.createRecord('user')

    currentUserController = testHelper.lookup('controller', 'currentUser')
    currentUserController.set('model', user)


Ember.Test.adapter = Ember.Test.MochaAdapter.create()
Ch.setupForTesting()
Ch.injectTestHelpers()

# Making mocha work nicely with Ember
mocha.globals(['Ember', 'DS', 'App', 'MD5'])
mocha.timeout(2000)
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

  # currentUserResponse = JSON.stringify
  #   user:
  #     id: 1
  #     name: 'Test User'
  #     email: 'test@test.com'

  server.respondWith('GET', '/web_api/users/current', [200, {"Content-Type":"application/json"}, ''])

afterEach ->
  Ch.reset()
  window.server.restore()
