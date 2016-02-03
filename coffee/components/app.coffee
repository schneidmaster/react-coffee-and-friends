React = require('react')

require('scss/app')

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div>
      {@props.children}
    </div>
