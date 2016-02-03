path              = require('path')
HtmlWebpackPlugin = require('html-webpack-plugin')

module.exports =
  entry: './coffee/router'

  output:
    filename: '[name].[chunkhash].js'
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
        loaders: ['style', 'css', 'resolve-url', 'sass']
      }
      {
        test: /\.(ttf|otf|png|ico)$/
        loaders: ['file']
      }
    ]

   plugins: [
      new HtmlWebpackPlugin(
        template: 'index.html'
        minify:
          collapseWhitespace: true
      )
    ]

  resolve:
    root: [path.resolve('./coffee'), path.resolve('./'), path.resolve('./node_modules')]
    extensions: ['', '.js', '.json', '.coffee', '.scss', '.svg']
