alt      = require('altBase')
actions  = require('actions/authActions')
{notify} = require('react-notify-toast')

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
    notify.show('Logged in!', 'success')
    payload = payload[0]
    localStorage.setItem('authToken', payload.token)
    localStorage.setItem('role', payload.user.role)
    localStorage.setItem('id', payload.user.id)
    @setState(loggedIn: true, authToken: payload.token, role: payload.user.role, id: payload.user.id)

  onReceiveLoginError: ->
    notify.show('Incorrect email or password; please try again', 'error')

module.exports = alt.createStore(AuthStore, 'AuthStore')

