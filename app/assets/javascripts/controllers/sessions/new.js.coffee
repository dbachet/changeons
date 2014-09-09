Ch.SessionsNewController = Ember.Controller.extend

  attemptedTransition: null
  hasErrors: false
  email: null
  password: null

  invalidatePassword: (->
    @set 'hasErrors', false
  ).observes('email', 'password')

  actions:

    clear: ->
      @set('email', null)
      @set('password', null)
      @set('hasErrors', false)

    login: ->
      @currentUser.set('content', Ember.Object.create())

      attemptedTransition = @get('attemptedTransition')

      $.ajax(
        url: '/web_api/sessions'
        async: false
        type: 'POST'
        data:
          session:
            email: @get('email')
            password: @get('password')

      ).done(Ember.run.bind(@, ((response) ->
        user = @store.push('user', @store.serializerFor(Ch.User).normalize(Ch.User, response.session))
        @currentUser.set('content', user)
        @send('clear')


        if !Ember.isBlank(attemptedTransition)
          attemptedTransition.retry()
        else
          @transitionToRoute('links')
      ))).fail(Ember.run.bind(@, (() ->
        @set("hasErrors", true)
      )))
