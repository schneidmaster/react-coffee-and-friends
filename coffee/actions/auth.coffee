constants = require('constants/all')

module.exports =
  login: (email, password) ->
    @dispatch(constants.AUTH.LOGIN)

    # Do something here to log in, e.g. make an API call.
    # Dispatch AUTH.LOGIN_SUCCESS with a login token on success, or
    # AUTH.LOGIN_FAIL on failure.
