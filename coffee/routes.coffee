React   = require('react')
{Route} = require('react-router')

# Require route components.
App           = require('components/app')
Authenticated = require('components/authenticated')
Home          = require('components/home')
Login         = require('components/login')

module.exports = (
  <Route component={App}>
    <Route path='/' component={Home} />
    <Route path='login' component={Login} />
    <Route component={Authenticated}>
      # Routes that require authentication go here.
    </Route>
  </Route>
)
