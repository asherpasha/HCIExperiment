class HCI.MomentumControlsView extends Backbone.View
  template: JST['controls']
  
  init: ->

  events: ->
    'mouseover .stimuli-button': 'hoverStimuli'
    'click .stimuli-button': 'clickStimuli'
  
  render: ->
    @$el.html(@template())
    this

  hoverStimuli: (event) ->
    @$('button.btn-primary').removeClass('btn-primary')
    @$(event.target).addClass('btn-primary')
    @$(event.target).trigger('changeStimuli')

  clickStimuli: (event) ->
    @$(event.target).trigger('selectStimuli')

  