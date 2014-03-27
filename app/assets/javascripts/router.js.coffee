# For more information see: http://emberjs.com/guides/routing/

Ch.Router.map ()->
  @resource 'links', ->
    @route 'categories'

  @resource('categories')

  @resource 'currentUser', path: '/users/current'

  @resource('users')

  @resource 'sessions', ->
    @route 'new'
