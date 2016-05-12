React = require('react')
Html  = require('react-html-document')

require('scss/app')
require('img/favicon.ico')

module.exports = React.createClass
  displayName: 'Root'

  render: ->
    pathKey = @props.location.pathname.replace(/\//g, '').toLowerCase()
    
    # Set the description and image from the path.
    description = ''
    image = ''

    metatags = [
      { name: 'viewport', content: 'width=device-width, initial-scale=1, maximum-scale=1' }
      { name: 'description', content: description }
      { name: 'og:url', content: 'https://github.com/schneidmaster/react-coffee-and-friends' }
      { name: 'og:type', content: 'website' }
      { name: 'og:title', content: 'React, Coffee, + Friends' }
      { name: 'og:description', content: description }
      { name: 'og:image', content: image }
      { name: 'twitter:card', content: 'summary_large_image' }
      { name: 'twitter:site', content: '@schneidmaster' }
      { name: 'twitter:title', content: 'React, Coffee, + Friends' }
      { name: 'twitter:description', content: description }
      { name: 'twitter:image', content: image }
    ]

    <Html title='React, Coffee, + Friends' metatags={metatags} scripts=['/production.min.js'] stylesheets=['/production.min.css']>
      <div id='app'></div>
    </Html>
