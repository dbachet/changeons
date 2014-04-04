Ch.CategoryRoute = Ch.AuthenticatedRoute.extend

  model: (params) ->
    @store.find 'category', params.category_id