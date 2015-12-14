React = require('react')
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div>
      <RouteHandler {...@props} />
    </div>
