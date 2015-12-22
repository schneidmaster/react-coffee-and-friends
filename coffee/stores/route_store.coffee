Fluxxor = require('fluxxor')
actions = require('../actions')

module.exports = Fluxxor.createStore
  initialize: (options) ->
    @router = options.router
    @bindActions(actions.constants.ROUTE.TRANSITION, @handleRouteTransition)

  handleRouteTransition: (payload) ->
    path = payload.path
    params = payload.params
    @router.transitionTo(path, params)
