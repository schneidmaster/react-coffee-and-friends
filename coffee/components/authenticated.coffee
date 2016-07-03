React            = require('react')
{browserHistory} = require('react-router')
AuthStore        = require('stores/auth')

module.exports = React.createClass
  displayName: 'Authenticated'

  statics:
    getStores: ->
      [AuthStore]

    getPropsFromStores: ->
      {
        auth: AuthStore.getState()
      }

  componentWillMount: ->
    browserHistory.push('/login') unless @props.auth.loggedIn

  componentDidUpdate: ->
    browserHistory.push('/login') unless @props.auth.loggedIn

  render: ->
    <div>
      {@props.children}
    </div>
