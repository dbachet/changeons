Ch.ApplicationRoute = Ember.Route.extend

  actions:
    logout: (user) ->
      $.ajax(
        url: '/web_api/sessions'
        async: false
        type: 'DELETE'
      ).done(Ember.run.bind(@, (() ->
        @currentUser.set('content', null)
        @transitionTo('links')
      )))