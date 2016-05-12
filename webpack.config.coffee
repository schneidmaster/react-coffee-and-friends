path                      = require('path')
webpack                   = require('webpack')
StaticSiteGeneratorPlugin = require('static-site-generator-webpack-plugin')
SitemapPlugin             = require('sitemap-webpack-plugin')
ExtractTextPlugin         = require('extract-text-webpack-plugin')

# Insert list of paths here
paths = ['/']

module.exports =
  entry: './coffee/router'

  output:
    filename: 'production.min.js'
    path: './dist'
    libraryTarget: 'umd'
    publicPath: '/'

  module:
    loaders: [
      {
        test: /\.coffee$/
        loaders: ['coffee', 'cjsx']
      }
      {
        test: /\.json$/
        loaders: ['json']
      }
      {
        test: /\.scss$/
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader!resolve-url-loader!sass-loader')
      }
      {
        test: /\.(ttf|otf|png|ico)$/
        loaders: ['file?name=[name].[ext]']
      }
    ]

   plugins: [
      new StaticSiteGeneratorPlugin('main', paths)
      new ExtractTextPlugin('production.min.css', allChunks: true)
      new SitemapPlugin('https://YOURDOMAIN.com', paths)
      new webpack.DefinePlugin(
        __PROD__: process.env.BUILD_PROD is 'true'
      )
    ]

  resolve:
    root: [path.resolve('./coffee'), path.resolve('./'), path.resolve('./node_modules')]
    extensions: ['', '.js', '.json', '.coffee', '.scss']
