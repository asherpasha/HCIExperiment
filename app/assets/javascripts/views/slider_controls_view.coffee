class HCI.SliderControlsView extends Backbone.View
  template: JST['slider_controls']
  
  initialize: (options) ->
    @timer = undefined
    @rsvp = false
    if options?.active_stimuli?
      @active_stimuli = options?.active_stimuli
    else
      @active_stimuli = 1

  events: ->
    'click .stimuli-button': 'clickStimuli'
    'mouseenter .fast-backward': 'fastBackward'
    'mouseenter .backward': 'backward'
    'mouseenter .pause': 'stopRSVP'
    'mouseenter .forward': 'forward'
    'mouseenter .fast-forward': 'fastForward'
    'mouseleave .control': 'stopRSVP'

  render: ->
    @$el.html(@template())
    @$("button[data-stimuli-number='#{@active_stimuli}']").addClass('btn-primary')
    this

  clickStimuli: (event) ->
    @active_stimuli = @$(event.target).attr('data-stimuli-number')
    @$('button.btn-primary').removeClass('btn-primary')
    @$(event.target).addClass('btn-primary')
    @$(event.target).trigger('changeStimuli')

  toggleRSVP: ->
    if @rsvp
      clearTimeout(@timer)
    else
      @advanceRSVP()
    @rsvp = !@rsvp

  startRSVP: (timeout) ->
    @timer = setTimeout( =>
        @advanceRSVP(timeout)
      , timeout)

  startRSVPReverse: (timeout) ->
    @timer = setTimeout( =>
        @retreatRSVP(timeout)
      , timeout)

  stopRSVP: ->
    clearTimeout(@timer)
    @rsvp = false

  advanceRSVP: (timeout) =>
    if @$("button[data-stimuli-number='#{@active_stimuli}']").next('.stimuli-button').length > 0
      @$("button[data-stimuli-number='#{@active_stimuli}']").next('.stimuli-button').trigger('click')
    else
      @$("button[data-stimuli-number='1']").trigger('click')
    @startRSVP(timeout)

  retreatRSVP:(timeout) =>
    if @$("button[data-stimuli-number='#{@active_stimuli}']").prev('.stimuli-button').length > 0
      @$("button[data-stimuli-number='#{@active_stimuli}']").prev('.stimuli-button').trigger('click')
    else
      @$("button[data-stimuli-number='10']").trigger('click')
    @startRSVPReverse(timeout)

  fastBackward: ->
    unless @rsvp
      clearTimeout(@timer)
      @startRSVPReverse(200)
      @rsvp = true
  
  backward: ->
    unless @rsvp
      clearTimeout(@timer)
      @startRSVPReverse(350)
      @rsvp = true

  forward: ->
    unless @rsvp
      clearTimeout(@timer)
      @startRSVP(350)
      @rsvp = true


  fastForward: ->
    unless @rsvp
      clearTimeout(@timer)
      @startRSVP(200)
      @rsvp = true

  close: =>
    @remove()


  