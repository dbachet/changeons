Ch.LinksNewController = Ember.ObjectController.extend({
  needs: 'categories',
  categories: Ember.computed.alias('controllers.categories.model'),
  categoryNames: function() {
    return this.get('categories').map(function(category) {
      return {
        id: category.get('id'),
        label: category.get('name')
      };
    });
  }.property('categories.@each.name'),
  languages: ['FR', 'EN'],

  actions: {
    create: function() {
      var _this = this

      this.get('model').save().then(function(link){
        // Success callback
      }, function() {
          _this.set('hasErrors', true);
      });
    }
  }
});