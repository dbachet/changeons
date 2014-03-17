Ch.CurrentUserController = Ember.ObjectController.extend
  isSignedIn: (->
    @get('model') != null
  ).property('model')