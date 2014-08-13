Library = require '../lib/library'

fdescribe 'Library test', ->
  library = new Library
  promise = null

  it 'waits for promise to be resolved', ->
    promise = library.foo()
    console.log promise

  waitsFor ->
    (promise != null) && (promise.inspect().state != 'pending')

  runs ->
    expect(promise).not.toBe(null)
    expect(promise.inspect().state).toBe('fulfilled')
