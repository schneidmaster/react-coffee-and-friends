React = require('react')
Route = require('react-router').Route

# Require route components.
App = require('./components/app.coffee')
Authenticated = require('./components/authenticated.coffee')
Container = require('./components/container.coffee')
Home = require('./components/home.coffee')
Login = require('./components/login.coffee')

module.exports = (
  <Route component={App}>
    <Route component={Container}>
      <Route path='/' component={Home} />
      <Route path='login' component={Login} />
      <Route component={Authenticated}>
        # Routes that require authentication go here.
      </Route>
    </Route>
  </Route>
)
