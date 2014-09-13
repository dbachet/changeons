Ch.UsersRoute = Ember.Route.extend({
  beforeModel: function(transition) {
    var sessionController = this.controllerFor('sessions.new');
    if (!this.currentUser.get('isSignedIn')) {
      sessionController.set('attemptedTransition', transition);
      this.transitionTo('sessions.new');
    }
  },
  model: function() {
    this.store.find('user');
  }
});