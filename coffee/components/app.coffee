React         = require('react')
Notifications = require('react-notify-toast').default

module.exports = React.createClass
  displayName: 'App'

  render: ->
    <div>
      <Notifications />
      {@props.children}
    </div>
