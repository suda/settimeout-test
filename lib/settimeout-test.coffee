SettimeoutTestView = require './settimeout-test-view'

module.exports =
  settimeoutTestView: null

  activate: (state) ->
    @settimeoutTestView = new SettimeoutTestView(state.settimeoutTestViewState)

  deactivate: ->
    @settimeoutTestView.destroy()

  serialize: ->
    settimeoutTestViewState: @settimeoutTestView.serialize()
