Ch.LinksIndexRoute = Ch.AuthenticatedRoute.extend

  model: ->
    @store.find('link')