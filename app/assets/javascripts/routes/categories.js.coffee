Ch.CategoriesRoute = Ch.AuthenticatedRoute.extend

  model: ->
    @store.find('category')