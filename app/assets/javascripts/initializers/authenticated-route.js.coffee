Ch.AuthenticatedRoute = Ember.Route.extend

  actions:
    logout: (user) ->
      $.ajax(
        url: '/web_api/sessions'
        async: false
        type: 'DELETE'
      ).done =>
        @controllerFor('currentUser').set('model', null)
        @transitionTo('sessions.new')