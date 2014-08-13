whenjs = require 'when'

class Library
  foo: ->
    dfd = whenjs.defer()

    setTimeout ->
      console.log 'this is never called'
      dfd.resolve 'bar'
    , 1000

    dfd.promise

module.exports = Library
