React = require('react')
Link = require('react-router').Link
RouteHandler = require('react-router').RouteHandler
Router = require('react-router')
Fluxxor = require('fluxxor')

module.exports = React.createClass
  displayName: 'Authenticated'
  
  mixins: [Fluxxor.FluxMixin(React), Fluxxor.StoreWatchMixin('AuthStore'), Router.Navigation]

  getInitialState: ->
    {
      loginRedirect: false
    }

  getStateFromFlux: ->
    store = @props.flux.store('AuthStore')
    
    {
      loggedIn: store.loggedIn
    }

  componentWillMount: ->
    unless @state.loggedIn
      @setState(loginRedirect: true)

      # Transition to login
      @transitionTo('login')

  render: ->
    <RouteHandler loginRedirect={@state.loginRedirect} {...@props} />
