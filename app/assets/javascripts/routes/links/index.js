Ch.LinksIndexRoute = Ember.Route.extend({
  queryParams: {
    category: {
      refreshModel: true
    }
  },
  model: function (params) {
    if (params) {
      return this.store.findQuery('link', params);
    } else {
      return this.store.find('link');
    }
  },
  renderTemplate: function () {
    this._super.apply(this, arguments);

    var currentUser          = this.currentUser.get('content');
    var categoriesController = this.controllerFor('categories');
    var linksNewController   = this.controllerFor('links.new');
    var store                = this.store;

    // Fetch categories only if it hasn't been already
    if (Ember.isEmpty(categoriesController.get('model'))) {
      categoriesController.set('model', store.find('category'));
    }

    if (Ember.isEmpty(linksNewController.get('model'))) {
      var defaultCategory = store.getById('category', 1);
      var newLink = store.createRecord('link', {user: currentUser, category: defaultCategory});

      linksNewController.set('model', newLink);
    }

    this.render('links-new', {
      outlet: 'links-new',
      into: 'application',
      controller: linksNewController
    });

    this.render('sidebar', {
      outlet: 'sidebar',
      into: 'application',
      controller: categoriesController
    });
  }
});