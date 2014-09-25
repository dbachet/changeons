# For more information see: http://emberjs.com/guides/routing/

Ch.Router.map ()->
  @resource 'secured', ->
    @resource 'currentUser', path: '/users/current'
  @resource 'links', path: '/', ->
    @route 'new'
  @resource('users')
  @resource('categories')

  @resource 'sessions', ->
    @route('new')