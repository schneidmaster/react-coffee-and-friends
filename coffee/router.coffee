# React/Router/Flux depepdencies
React = require('react')
Router = require('react-router')
Fluxxor = require('fluxxor')

# Actions and routes
actions = require('./actions.coffee')
routes = require('./routes.coffee')

# Stores
RouteStore = require('./stores/route_store.coffee')
AuthStore = require('./stores/auth_store.coffee')

# Create and initialize router and Flux
router = Router.create(routes: routes)
stores =
  RouteStore: new RouteStore(router: router)
  AuthStore: new AuthStore()

flux = new Fluxxor.Flux(stores, actions.methods)

Router.run(routes, (Handler) ->
  React.render(<Handler flux={flux} />,document.getElementById('app'))
)
