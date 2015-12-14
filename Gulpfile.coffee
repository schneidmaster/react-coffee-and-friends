gulp           = require('gulp')
del            = require('del')
webpack        = require('webpack-stream')
uglify         = require('gulp-uglify')
concat         = require('gulp-concat')
copy           = require('gulp-copy')
postcss        = require('gulp-postcss')
imprt          = require('postcss-import')
nested         = require('postcss-nested')
scss           = require('postcss-scss')
nano           = require('gulp-cssnano')
minifyHTML     = require('gulp-minify-html')
minifyImg      = require('gulp-imagemin')
connect        = require('gulp-connect')

gulp.task 'clean', ->
  del(['dist/**/*'])

gulp.task 'css', ['clean'], ->
  gulp.src('css/application.css')
    .pipe(postcss([imprt, nested], {syntax: scss}))
    .pipe(concat('production.min.css'))
    .pipe(gulp.dest('dist'))

gulp.task 'cssProd', ['clean'], ->
  gulp.src('css/application.css')
    .pipe(postcss([imprt, nested], {syntax: scss}))
    .pipe(concat('production.min.css'))
    .pipe(nano())
    .pipe(gulp.dest('dist'))

gulp.task 'webpack', ['clean'], ->
  gulp.src('coffee/router.coffee')
    .pipe(webpack(require('./webpack.config.coffee')))
    .pipe(concat('production.min.js'))
    .pipe(gulp.dest('dist'))

gulp.task 'webpackProd', ['clean'], ->
  gulp.src('coffee/router.coffee')
    .pipe(webpack(require('./webpack.config.coffee')))
    .pipe(uglify())
    .pipe(concat('production.min.js'))
    .pipe(gulp.dest('dist'))

gulp.task 'copy', ['clean'], ->
  gulp.src([
    'index.html'
    'img/*'
  ]).pipe(copy('dist'))

gulp.task 'minifyHTML', ['clean'], ->
  gulp.src('index.html')
    .pipe(minifyHTML())
    .pipe(gulp.dest('dist'))

gulp.task 'minifyImg', ['clean'], ->
  gulp.src('img/*')
    .pipe(minifyImg())
    .pipe(gulp.dest('dist'))

gulp.task 'watch', ->
  gulp.watch [
    'coffee/**/*.coffee'
    'css/**/*.css'
  ], (event) ->
    gulp.src(event.path).pipe connect.reload()

  gulp.watch [
    'coffee/**/*.coffee'
    'css/**/*.css'
  ], ['default']

gulp.task 'connect', ->
  connect.server
    root: [ 'dist' ]
    port: 9010
    livereload: 
      port: 32834
    connect: 
      redirect: false

gulp.task 'default', [
  'clean'
  'css'
  'webpack'
  'copy'
]

gulp.task 'serve', [
  'default'
  'connect'
  'watch'
]

gulp.task 'build', [
  'clean'
  'cssProd'
  'webpackProd'
  'minifyHTML'
  'minifyImg'
]
