Fluxxor = require('fluxxor')
actions = require('../actions')

module.exports = Fluxxor.createStore
  initialize: ->
    if localStorage.getItem('authToken')
      @loggedIn = true
      @authToken = localStorage.getItem('authToken')
    else
      @loggedIn = false
      @authToken = null
    @loaded = true
    @error = false
 
    @bindActions(actions.constants.AUTH.LOGIN, @onLogin)
    @bindActions(actions.constants.AUTH.LOGIN_SUCCESS, @onLoginSuccess)
    @bindActions(actions.constants.AUTH.LOGIN_FAIL, @onLoginFail)

  onLogin: ->
    @loaded = false

    @emit('change')

  onLoginSuccess: (payload) ->
    @loggedIn = true
    @authToken = payload.token
    localStorage.setItem('authToken', @authToken)
    @loaded = true

    @emit('change')

  onLoginFail: ->
    @error = true

    @emit('change')
