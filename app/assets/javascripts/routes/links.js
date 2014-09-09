Ch.LinksRoute = Ember.Route.extend({
  model: function () {
    return this.store.find('link');
  },
  renderTemplate: function () {
    this._super.apply(this, arguments);

    var categoriesController = this.controllerFor('categories');
    categoriesController.set('model', this.store.find('category'));

    return this.render('sidebar', {
      outlet: 'sidebar',
      into: 'application',
      controller: categoriesController
    });
  }
})