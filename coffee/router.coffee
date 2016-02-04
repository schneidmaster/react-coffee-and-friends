# React/Router/Flux depepdencies
import ReactDOM      from 'react-dom'
import React         from 'react'
import { Router }    from 'react-router'
import Fluxxor       from 'fluxxor'
import createHistory from 'history/lib/createBrowserHistory'

# Actions and routes
import actions from 'actions'
import routes  from 'routes'

# Stores
import RouteStore from 'stores/route_store'
import AuthStore  from 'stores/auth_store'

# Create and initialize router and Flux
createFluxComponent = (Component, props) ->
  <Component {...props} flux={flux} />

router = <Router routes={routes} flux={flux} createElement={createFluxComponent} history={createHistory()} />
stores =
  RouteStore: new RouteStore(router: router)
  AuthStore: new AuthStore()

flux = new Fluxxor.Flux(stores, actions.methods)

container = document.createElement('div')
document.body.appendChild(container)
ReactDOM.render(router, container)
