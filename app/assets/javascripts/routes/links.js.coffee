Ch.LinksRoute = Ch.AuthenticatedRoute.extend

  beforeModel: ->
    @store.find('category').then (categories) =>
      @controllerFor('LinksCategories').set('model', categories.toArray())

  renderTemplate: ->
    @_super()

    @render('links/categories',
      outlet: 'categories',
      into: 'links',
      controller: 'LinksCategories'
    )