# #= require spec_helper

# describe 'Fecth currentUser if signed in while transitioning on authenticatedRoute', ->

#   beforeEach ->
#     response = JSON.stringify
#       user:
#         id: 1
#         name: 'Test User'
#         email: 'test@test.com'

#     server.respondWith('GET', '/web_api/users/current', [200, {"Content-Type":"application/json"}, response])

#     visit('/links')

#   it 'should receive the currentUser in request', ->
#     expect(testHelper.lookup('controller:currentUser').get('model.name')).to.eql('Test User')