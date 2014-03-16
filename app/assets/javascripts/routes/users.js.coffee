Ch.UsersRoute = Ch.AuthenticatedRoute.extend

  model: ->
    @store.find('user')