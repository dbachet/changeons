Ch.LinksNewController = Ember.ObjectController.extend({
  needs: 'categories',
  categories: Ember.computed.alias('controllers.categories.model'),
  languages: ['FR', 'EN'],

  categoryNames: function() {
    return this.get('categories').map(function(category) {
      return {
        id: category,
        label: category.get('name')
      };
    });
  }.property('categories.@each.name'),

  actions: {
    create: function() {
      var self = this;

      this.get('model').save().then(function(link){
        self.send('refreshLinks');
      }, function() {
        self.set('hasErrors', true);
      });
    }
  }
});