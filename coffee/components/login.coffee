import ReactDOM         from 'react-dom'
import React            from 'react'
import Fluxxor          from 'fluxxor'
import { Router, Link } from 'react-router'
import Loader           from 'react-loader'
import $                from 'jquery'

module.exports = React.createClass
  displayName: 'Login'
  
  mixins: [Fluxxor.FluxMixin(React), Fluxxor.StoreWatchMixin('AuthStore'), Router.History]

  getStateFromFlux: ->
    store = @props.flux.store('AuthStore')
    
    {
      loaded: store.loaded
      loggedIn: store.loggedIn
    }

  login: (e) ->
    e.preventDefault()
    node = $(ReactDOM.findDOMNode(@))
    @props.flux.actions.auth.login(node.find('#email').val(), node.find('#password').val())

  componentDidUpdate: ->
    if @loggedIn
      @history.pushState(null, '/')

  render: ->
    <Loader loaded={@state.loaded}>
      <fieldset>
        <legend>Login</legend>
        <form className={'sm-col-12'} onSubmit={@login}>
          <label htmlFor={'email'}>Email</label>
          <input type={'email'} id={'email'} name={'email'} className={'block col-6 mb1 field'} />

          <label htmlFor={'password'}>Password</label>
          <input type={'password'} id={'password'} name={'password'} className={'block col-6 mb1 field'} />

          <button className={'btn btn-primary'}>Sign In</button>
        </form>
      </fieldset>
    </Loader>
