import Fluxxor   from 'fluxxor'
import constants from 'constants/all'

module.exports = Fluxxor.createStore
  initialize: ->
    if typeof(localStorage) isnt 'undefined' && localStorage.getItem('authToken')
      @loggedIn = true
      @authToken = localStorage.getItem('authToken')
    else
      @loggedIn = false
      @authToken = null
    @loaded = true
    @error = false
 
    @bindActions(constants.AUTH.LOGIN, @onLogin)
    @bindActions(constants.AUTH.LOGIN_SUCCESS, @onLoginSuccess)
    @bindActions(constants.AUTH.LOGIN_FAIL, @onLoginFail)

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
