Ch.LinksRoute = Ember.Route.extend({
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

    var categoriesController = this.controllerFor('categories');

    // Fecth categories only if it hasn't been already
    if (Ember.isEmpty(categoriesController.get('model'))) {
      categoriesController.set('model', this.store.find('category'));
    }

    return this.render('sidebar', {
      outlet: 'sidebar',
      into: 'application',
      controller: categoriesController
    });

  }
});