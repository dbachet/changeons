Ch.LinksRoute = Ember.Route.extend({
  queryParams: {
    category: {
      refreshModel: true
    }
  },
  model: function (params) {
    return this.store.findQuery('link', params);
  },
  renderTemplate: function () {
    this._super.apply(this, arguments);

    var categoriesController = this.controllerFor('categories');

    // Fecth and render categories only if it hasn't been already
    if (Ember.isEmpty(categoriesController.get('model'))) {
      categoriesController.set('model', this.store.find('category'));


      return this.render('sidebar', {
        outlet: 'sidebar',
        into: 'application',
        controller: categoriesController
      });
    }
  }
});