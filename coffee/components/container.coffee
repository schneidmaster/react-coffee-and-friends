import React from 'react'

module.exports = React.createClass
  displayName: 'Container'

  render: ->
    <div className={'container'}>
      <div className={'clearfix'}>
        {@props.children}
      </div>
    </div>
