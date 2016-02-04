import React     from 'react'
import { Route } from 'react-router'

# Require route components.
App = require('./components/app')
Authenticated = require('./components/authenticated')
Container = require('./components/container')
Home = require('./components/home')
Login = require('./components/login')

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
