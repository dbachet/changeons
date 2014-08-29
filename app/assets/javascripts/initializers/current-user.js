Ch.CurrentUserProxy = Ember.ObjectProxy.extend({
  isSignedIn: Ember.computed.not('isNotSignedIn'),
  isNotSignedIn: Ember.computed.empty('content')
})

Ember.Application.initializer({
  name: 'currentUser',

  initialize: function (container, application) {
    application.register('user:current', Ch.CurrentUserProxy);
    application.inject('controller', 'currentUser', 'user:current');
    application.inject('route', 'currentUser', 'user:current');

    var store = container.lookup('store:main');
    var currentUser = container.lookup('user:current');

    $.ajax({
      url: '/web_api/users/current',
      type: 'GET'
    }).done(Ember.run.bind(this, function (response) {
      var user = store.push('user', store.serializerFor(Ch.User).normalize(Ch.User, response.user));
      currentUser.set('content', user);
    }))
  }
})