#= require spec_helper

describe 'links page', ->

  beforeEach ->
    visit('/links')

    linksResponse = JSON.stringify
      users:
        [
          {
            id: 1,
            name: 'Test User',
            email: 'test@test.com'
          }
        ]
      categories:
        [
          {
            id: 1,
            name: 'Test category',
            color: '#333'
          }
        ]
      links:
        [
          {
            id: 123,
            url: 'www.test.com',
            name: 'This is a testing link',
            category_id: 1,
            user_id: 1
          }
        ]

    server.respondWith('GET', '/web_api/links', [200, {"Content-Type":"application/json"}, linksResponse])

    categoriesResponse = JSON.stringify
      categories:
        [
          {
            id: 1,
            name: 'Test category',
            color: '#333'
          }
        ]

    server.respondWith('GET', '/web_api/categories', [200, {"Content-Type":"application/json"}, categoriesResponse])

  context 'has links section with link items', ->

    it 'has link element with right text', ->
      expect($('section#links ul li:first span.link').text()).to.eql('This is a testing link')

    it 'has category element with the right text', ->
      expect($('section#links ul li:first .category').text()).to.eql('Test category')

  context 'has categories section with category items', ->

    it 'has category label with right text', ->
      expect($('section#sidebar #categories ul li:first .label.category').text()).to.eql('Test category')

