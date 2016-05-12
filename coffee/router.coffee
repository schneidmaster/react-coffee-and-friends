# React/Router/Flux depepdencies
ReactDOM                                                            = require('react-dom')
React                                                               = require('react')
ReactDOMServer                                                      = require('react-dom/server')
{Router, RouterContext, match, browserHistory, createMemoryHistory} = require('react-router')
routes                                                              = require('routes')
Root                                                                = require('components/root')
Fluxxor                                                             = require('fluxxor')

actions = require('actions/all')
routes  = require('routes')
stores  = require('stores/all')

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
