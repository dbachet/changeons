Ch.SessionsNewController = Ember.Controller.extend

  needs: ['currentUser']

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
      attemptedTransition   = @get('attemptedTransition')
      currentUserController = @get('controllers.currentUser')
      store = currentUserController.store

      $.ajax(
        url: '/web_api/sessions'
        async: false
        type: 'POST'
        data:
          session:
            email: @get('email')
            password: @get('password')

      ).done( (data) =>
        user = store.push('user', store.serializerFor(Ch.User).normalize(Ch.User, data.session))
        currentUserController.set('model', user)
        @send('clear')

        if Em.isBlank(attemptedTransition) || (attemptedTransition.targetName == 'sessions.new')
          @transitionToRoute('links')
        else
          attemptedTransition.retry()
          @set('attemptedTransition', null)

      ).fail (data) =>
        @set("hasErrors", true)
        $('input#password').focus()
