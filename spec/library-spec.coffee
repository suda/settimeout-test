Library = require '../lib/library'

fdescribe 'Library test', ->
  library = new Library
  promise = null

  it 'waits for promise to be resolved', ->
    jasmine.unspy(window, 'setTimeout')
    promise = library.foo()

    waitsFor ->
      (promise != null) && (promise.inspect().state != 'pending')

    runs ->
      expect(promise).not.toBe(null)
      expect(promise.inspect().state).toBe('fulfilled')
