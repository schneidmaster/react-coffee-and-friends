module.exports = 
  module:
    loaders: [
      {
        test: /\.coffee$/
        loaders: ['coffee', 'cjsx']
      }
    ]
  resolve:
    extensions: ['', '.js', '.json', '.coffee'] 
