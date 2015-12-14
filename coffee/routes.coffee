React = require('react')
Route = require('react-router').Route
DefaultRoute = require('react-router').DefaultRoute

# Require route components.
App = require('./components/app.coffee')
Authenticated = require('./components/authenticated.coffee')
Container = require('./components/container.coffee')
Home = require('./components/home.coffee')
Login = require('./components/login.coffee')

module.exports = (
  <Route path='/' handler={App}>
    <Route handler={Container}>
      <Route path='/' handler={Home} />
      <Route name='login' handler={Login} />
      <Route handler={Authenticated}>
        # Routes that require authentication go here.
      </Route>
    </Route>
  </Route>
)
