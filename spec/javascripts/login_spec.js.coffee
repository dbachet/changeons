#= require spec_helper

describe 'Login screen', ->

  beforeEach ->
    visit('/sessions/new')

  context 'with empty form', ->
    server = testHelper.fakeServer()
    server.autoRespond = true

    server.respondWith('POST', '/web_api/sessions', [422, {"Content-Type":"application/json"}, '{}'])

    it 'has no errors on start', ->
      expect($('.alert-danger').length).to.eql(0)
      expect(testHelper.lookup('controller', 'currentUser').get('model')).to.eql(null)

    it 'shows errors', ->
      click('button')

      andThen ->
        expect($('.alert-danger').length).to.eql(1)
