React = require('react')
RouteHandler = require('react-router').RouteHandler

module.exports = React.createClass
  displayName: 'Container'

  render: ->
    <div className={'container'}>
      <div className={'clearfix'}>
        <RouteHandler {...@props} />
      </div>
    </div>
