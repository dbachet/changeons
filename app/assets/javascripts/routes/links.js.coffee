Ch.LinksRoute = Ch.AuthenticatedRoute.extend

  model: ->
    @store.find('link')