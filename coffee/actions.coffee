constants =
  ROUTE:
    TRANSITION: 'ROUTE:TRANSITION'

  AUTH:
    LOGIN: 'AUTH:LOGIN'
    LOGIN_SUCCESS: 'AUTH:LOGIN_SUCCESS'
    LOGIN_FAIL: 'AUTH:LOGIN_FAIL'

actions =
  routes:
    transition: (path, params) ->
      @dispatch(constants.ROUTE.TRANSITION, path: path, params: params)

  auth:
    login: (email, password) ->
      @dispatch(constants.AUTH.LOGIN)

      # Do something here to log in, e.g. make an API call.
      # Dispatch AUTH.LOGIN_SUCCESS with a login token on success, or
      # AUTH.LOGIN_FAIL on failure.

module.exports =
  methods: actions
  constants: constants
