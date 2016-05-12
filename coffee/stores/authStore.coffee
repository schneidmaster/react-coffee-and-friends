alt     = require('altBase')
actions = require('actions/authActions')

class AuthStore
  displayName: 'AuthStore'

  initialize: ->
    @bindActions(actions)

    @loggedIn = (typeof(localStorage) isnt 'undefined' && localStorage.getItem('authToken') isnt null)
    if @loggedIn
      @authToken = localStorage.getItem('authToken')
      @role = localStorage.getItem('role')
      @id = localStorage.getItem('id')

  onRequestLogin: ->
    @setState(loggedIn: false)

  onReceiveLogin: (payload) ->
    alert('Logged in!')
    payload = payload[0]
    localStorage.setItem('authToken', payload.token)
    localStorage.setItem('role', payload.user.role)
    localStorage.setItem('id', payload.user.id)
    @setState(loggedIn: true, authToken: payload.token, role: payload.user.role, id: payload.user.id)

  onReceiveLoginError: ->
    alert('Incorrect email or password; please try again')

module.exports = alt.createStore(AuthStore, 'AuthStore')

