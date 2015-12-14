React = require('react')
Fluxxor = require('fluxxor')
Router = require('react-router')
Link = require('react-router').Link
Loader = require('react-loader')
$ = require('jquery')

module.exports = React.createClass
  displayName: 'Login'
  
  mixins: [Fluxxor.FluxMixin(React), Fluxxor.StoreWatchMixin('AuthStore'), Router.Navigation]

  getStateFromFlux: ->
    store = @props.flux.store('AuthStore')
    
    {
      loaded: store.loaded
      loggedIn: store.loggedIn
    }

  login: (e) ->
    e.preventDefault()
    node = $(@getDOMNode())
    @props.flux.actions.auth.login(node.find('#email').val(), node.find('#password').val())

  componentWillUpdate: (_, nextState) ->
    if nextState.loggedIn
      @transitionTo('/') 

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
