Ch.CategoryRoute = Ch.AuthenticatedRoute.extend

  model: (params) ->
    @store.find 'category', params.category_id

  beforeModel: ->
    @store.find('category').then (categories) =>
      @controllerFor('CategoryCategories').set('model', categories.toArray())

  afterModel: ->
    @modelFor('category').get('links').then (links) =>
      @controllerFor('CategoryLinks').set('model', links.toArray())

  renderTemplate: ->
    @_super()

    @render('category/categories',
      outlet: 'categories',
      into: 'category',
      controller: 'CategoryCategories'
    )

    @render('category/links',
      outlet: 'links',
      into: 'category',
      controller: 'CategoryLinks'
    )