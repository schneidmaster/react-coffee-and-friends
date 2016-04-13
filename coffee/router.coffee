# React/Router/Flux depepdencies
import ReactDOM                                                              from 'react-dom'
import React                                                                 from 'react'
import ReactDOMServer                                                        from 'react-dom/server'
import { Router, RouterContext, match, browserHistory, createMemoryHistory } from 'react-router'
import routes                                                                from 'routes'
import Root                                                                  from 'components/root'
import Fluxxor                                                               from 'fluxxor'

import actions from 'actions/all'
import routes  from 'routes'
import stores  from 'stores/all'

# Create and initialize router and Flux
createFluxComponent = (Component, props) ->
  <Component {...props} flux={flux} />

if typeof document isnt 'undefined'
  flux = new Fluxxor.Flux(stores, actions)
  ReactDOM.render(<Router routes={routes} flux={flux} createElement={createFluxComponent} history={browserHistory} />, document.getElementById('app'))

module.exports = (locals, callback) -> 
  history = createMemoryHistory()
  location = history.createLocation(locals.path)

  match routes: routes, location: location, (error, redirectLocation, renderProps) ->
    html = ReactDOMServer.renderToStaticMarkup(
      <Root location={location}>
        <RouterContext {...renderProps} />
      </Root>
    )
    callback(null, html)
