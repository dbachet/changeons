Ch.SessionsNewRoute = Ember.Route.extend

  beforeModel: (transition) ->
    currentUserController = @controllerFor('currentUser')

    if currentUserController.get('isSignedIn')
      @transitionTo('application')