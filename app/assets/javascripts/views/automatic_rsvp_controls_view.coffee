class HCI.AutomaticRSVPControlsView extends Backbone.View
  template: JST['automatic_rsvp_controls']
  
  initialize: (options) ->
    @timer = undefined
    @rsvp = false
    if options?.active_stimuli?
      @active_stimuli = options?.active_stimuli
    else
      @active_stimuli = 1
    $('body').on('keydown', @keyDown)

  events: ->
    'click .stimuli-button': 'clickStimuli'
    'click #rsvp': 'toggleRSVP'
  
  render: ->
    @$el.html(@template())
    @$("button[data-stimuli-number='#{@active_stimuli}']").addClass('btn-primary')
    this

  clickStimuli: (event) ->
    clearTimeout(@timer)
    @active_stimuli = @$(event.target).attr('data-stimuli-number')
    @$('button.btn-primary').removeClass('btn-primary')
    @$(event.target).addClass('btn-primary')
    @$(event.target).trigger('changeStimuli')

  toggleRSVP: ->
    if @rsvp
      @$('#rsvp').text('Start RSVP')
      clearTimeout(@timer)
    else
      @$('#rsvp').text('Stop RSVP')
      @advanceRSVP()
    @rsvp = !@rsvp

  startRSVP: ->
    @timer = setTimeout( =>
        @advanceRSVP()
      , 200) 

  advanceRSVP: =>
    if @$("button[data-stimuli-number='#{@active_stimuli}']").next('.stimuli-button').length > 0
      @$("button[data-stimuli-number='#{@active_stimuli}']").next('.stimuli-button').trigger('click')
    else
      @$("button[data-stimuli-number='1']").trigger('click')
    @startRSVP()

  keyDown: (event) =>
    if event.keyCode == 32
      @toggleRSVP()

  close: =>
    $('body').off('keydown', @keyDown)
    @remove()

