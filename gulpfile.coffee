gulp = require 'gulp'
source = require 'vinyl-source-stream'
buffer = require 'vinyl-buffer'
browserify = require 'browserify'
uglify = require 'gulp-uglify'

gulp.task 'build', ->
  browserify
    entries: ['./example.coffee']
    extensions: ['.coffee']
  .transform 'coffeeify'
  .bundle()
  .pipe source 'bundle2.js'
  .pipe buffer()
  .pipe uglify()
  .pipe gulp.dest 'build'

gulp.task 'watch', ->
  gulp.watch '*.coffee', ['build']

gulp.task 'default', ['build']
