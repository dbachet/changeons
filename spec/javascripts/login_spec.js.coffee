#= require spec_helper

describe 'Login screen', ->

  beforeEach ->
    visit('/sessions/new')

  context 'with empty form', ->

    beforeEach ->
      server.respondWith('POST', '/web_api/sessions', [422, {"Content-Type":"application/json"}, ''])

    it 'has no errors on start', ->
      expect($('.alert-danger').length).to.eql(0)
      expect(testHelper.lookup('controller', 'currentUser').get('model')).to.eql(null)

    it 'shows errors', ->
      click('button')

      andThen ->
        expect($('.alert-danger').length).to.eql(1)

  context 'filling in the form', ->
    beforeEach ->
      response = JSON.stringify
        session:
          id: 1
          email: 'test@test.com'
          name: 'Test User'

      server.respondWith('POST', '/web_api/sessions', [200, {"Content-Type":"application/json"}, response])

    it 'fetches current user and set it in the currentUser model', ->

      fillIn('#email', 'test@test.com')
      fillIn('#password', 'testtest')
      click('#btn-login')

      andThen ->
        expect(testHelper.lookup('controller:currentUser').get('model.name')).to.eql('Test User')

