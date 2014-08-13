{View} = require 'atom'

module.exports =
class SettimeoutTestView extends View
  @content: ->
    @div class: 'settimeout-test overlay from-top', =>
      @div "The SettimeoutTest package is Alive! It's ALIVE!", class: "message"

  initialize: (serializeState) ->
    atom.workspaceView.command "settimeout-test:toggle", => @toggle()

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @detach()

  toggle: ->
    console.log "SettimeoutTestView was toggled!"
    if @hasParent()
      @detach()
    else
      atom.workspaceView.append(this)
