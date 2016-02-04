import React            from 'react'
import { Router, Link } from 'react-router'
import Fluxxor          from 'fluxxor'

module.exports = React.createClass
  displayName: 'Authenticated'
  
  mixins: [Fluxxor.FluxMixin(React), Fluxxor.StoreWatchMixin('AuthStore'), Router.History]

  getStateFromFlux: ->
    store = @props.flux.store('AuthStore')
    
    {
      loggedIn: store.loggedIn
    }

  componentWillMount: ->
    unless @state.loggedIn
      noty(
        theme: 'relax'
        text: 'You must log in first.'
        layout: 'topRight'
        type: 'error'
        timeout: 3000
      )
      @history.pushState(null, '/login')

  render: ->
    <div>
      {React.cloneElement(@props.children, { loginRedirect: !@state.loggedIn })}
    </div>
