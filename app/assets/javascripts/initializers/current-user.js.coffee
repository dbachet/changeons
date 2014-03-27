Ember.Application.initializer
  name: 'currentUser'

  initialize: (container) ->
    store = container.lookup('store:main')
    $.ajax(
      url: '/web_api/users/current'
      async: false
      type: 'GET'
    ).done((data) ->
      userData = data.user

      if userData
        user = store.push('user', store.serializerFor(Ch.User).normalize(Ch.User, userData))
        container.lookup('controller:currentUser').set('model', user)
      else
        container.lookup('controller:currentUser').set('model', null)
    )