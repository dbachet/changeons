Ch.LinksNewController = Ember.ObjectController.extend({
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