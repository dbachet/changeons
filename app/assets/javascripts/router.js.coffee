# For more information see: http://emberjs.com/guides/routing/

Ch.Router.map ()->
  @resource('categories')
  @resource 'secured', ->
    @resource 'currentUser', path: '/users/current'
  @resource('links', path: '/')
  @resource('users')

  @resource 'sessions', ->
    @route('new')