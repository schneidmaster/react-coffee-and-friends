import React     from 'react'
import { Route } from 'react-router'

# Require route components.
import App           from 'components/app'
import Authenticated from 'components/authenticated'
import Home          from 'components/home'
import Login         from 'components/login'

module.exports = (
  <Route component={App}>
    <Route path='/' component={Home} />
    <Route path='login' component={Login} />
    <Route component={Authenticated}>
      # Routes that require authentication go here.
    </Route>
  </Route>
)
