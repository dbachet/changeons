Ch.AuthenticatedRoute = Ember.Route.extend

  beforeModel: (transition) ->
    @authorize(transition)

  authorize: (transition) ->
    sessionController = @controllerFor('sessions.new')
    currentUserController = @controllerFor('currentUser')

    if !currentUserController.get('isSignedIn')
      sessionController.set('attemptedTransition', transition)

  actions:
    logout: (user) ->
      $.ajax(
        url: '/web_api/sessions'
        async: false
        type: 'DELETE'
      ).done =>
        @controllerFor('currentUser').set('model', null)
        @transitionTo('links')