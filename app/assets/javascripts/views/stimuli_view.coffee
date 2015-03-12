class HCI.StimuliView extends Backbone.View
  template: JST['stimuli']

  initialize: (options) ->
    if options?
      @active_stimuli = options.active_stimuli

  render: ->
    @$el.html(@template())
    if @active_stimuli?
      @showStimuli(@active_stimuli)
    this

  showStimuli: (stimuli_number) ->
    @$('div').removeClass('show')
    @$("div.stimuli-#{stimuli_number}").addClass('show')
