Ch.LinksRoute = Ch.AuthenticatedRoute.extend

  model: ->
    @store.find('link')

  renderTemplate: ->
    @_super.apply(@, arguments)

    categoriesController = @controllerFor('categories')
    categoriesController.set('model', @store.find('category'))

    @render('sidebar',
      outlet: 'sidebar',
      into: 'application',
      controller: categoriesController
    )