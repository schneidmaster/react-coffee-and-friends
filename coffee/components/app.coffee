React = require('react')

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div>
      {@props.children}
    </div>
