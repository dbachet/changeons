#= require spec_helper

describe 'Logout', ->

  beforeEach ->
    server.respondWith('DELETE', '/web_api/sessions', [202, {"Content-Type":"application/json"}, '{}'])

    response = JSON.stringify
      links: [
          {
            id: 1
            name: 'Test User'
            email: 'test@test.com'
          }
        ]
    server.respondWith('GET', '/web_api/links', [200, {"Content-Type":"application/json"}, response])

    signIn()

    visit('/links')

  it 'should empty currentUser', ->
    click('button')

    andThen ->
      expect(testHelper.lookup('controller', 'currentUser').get('model')).to.eql(null)
