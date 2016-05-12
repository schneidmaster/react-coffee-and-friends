alt = require('altBase')

class AuthActions
  @generateActions('receiveLogin', 'receiveLoginError')

  requestLogin: (email, password) ->
    # Do something here to log in, e.g. make an API call.
    # Call @receiveLogin on success and @receiveLoginError on failure.

module.exports = alt.createActions(AuthActions)
