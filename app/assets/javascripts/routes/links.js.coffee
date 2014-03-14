Ch.LinksRoute = Ember.Route.extend

  model: ->
    @store.find('link')