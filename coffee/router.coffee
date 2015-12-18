# React/Router/Flux depepdencies
ReactDOM = require('react-dom')
React = require('react')
Router = require('react-router').Router
Fluxxor = require('fluxxor')
createBrowserHistory = require('history/lib/createBrowserHistory')

# Actions and routes
actions = require('./actions.coffee')
routes = require('./routes.coffee')

# Stores
RouteStore = require('./stores/route_store.coffee')
AuthStore = require('./stores/auth_store.coffee')

# Create and initialize router and Flux
createFluxComponent = (Component, props) ->
  <Component {...props} flux={flux} />

router = <Router routes={routes} flux={flux} createElement={createFluxComponent} history={createBrowserHistory()} />
stores =
  RouteStore: new RouteStore(router: router)
  AuthStore: new AuthStore()

flux = new Fluxxor.Flux(stores, actions.methods)

ReactDOM.render(router, document.getElementById('app'))
