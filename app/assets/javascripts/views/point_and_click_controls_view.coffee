class HCI.PointAndClickControlsView extends Backbone.View
  template: JST['point_and_click_controls']
  
  initialize: (options) ->
    @active_stimuli = options?.active_stimuli

  events: ->
    'click .stimuli-button': 'clickStimuli'

  render: ->
    @$el.html(@template())
    @$("button[data-stimuli-number='#{@active_stimuli}']").addClass('btn-primary')
    this

  clickStimuli: (event) ->
    @active_stimuli = @$(event.target).attr('data-stimuli-number')
    @$('button.btn-primary').removeClass('btn-primary')
    @$(event.target).addClass('btn-primary')
    @$(event.target).trigger('changeStimuli')
  