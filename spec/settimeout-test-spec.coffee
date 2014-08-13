{WorkspaceView} = require 'atom'
SettimeoutTest = require '../lib/settimeout-test'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "SettimeoutTest", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView
    activationPromise = atom.packages.activatePackage('settimeout-test')

  describe "when the settimeout-test:toggle event is triggered", ->
    it "attaches and then detaches the view", ->
      expect(atom.workspaceView.find('.settimeout-test')).not.toExist()

      # This is an activation event, triggering it will cause the package to be
      # activated.
      atom.workspaceView.trigger 'settimeout-test:toggle'

      waitsForPromise ->
        activationPromise

      runs ->
        expect(atom.workspaceView.find('.settimeout-test')).toExist()
        atom.workspaceView.trigger 'settimeout-test:toggle'
        expect(atom.workspaceView.find('.settimeout-test')).not.toExist()
