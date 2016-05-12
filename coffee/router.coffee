ReactDOM                                                            = require('react-dom')
React                                                               = require('react')
ReactDOMServer                                                      = require('react-dom/server')
{Router, RouterContext, match, browserHistory, createMemoryHistory} = require('react-router')
ReactGA                                                             = require('react-ga')
routes                                                              = require('routes')
Root                                                                = require('components/root')

if typeof document isnt 'undefined'
  if __PROD__
    ReactGA.initialize('UA-#########-#')
    logPageView = -> ReactGA.pageview(window.location.pathname)
  else
    logPageView = ->
      #
  ReactDOM.render(<Router routes={routes} history={browserHistory} onUpdate={logPageView} />, document.getElementById('app'))

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
