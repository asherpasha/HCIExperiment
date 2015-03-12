class HCI.ExperimentView extends Backbone.View
  template: JST['experiment']
  
  events: ->
    'changeStimuli': 'changeStimuli'
    'selectStimuli': 'selectStimuli'
    'click #submit': 'submit'

  className: 'experiment'

  init: ->

  render: ->
    @$el.html(@template())
    @stimuli_view = new HCI.StimuliView()
    @controls_view = new HCI.ControlsView()
    @$('#stimuli').html(@stimuli_view.render().el)
    @$('#controls').html(@controls_view.render().el)
    this

  changeStimuli: (event) ->
    @active_stimuli = $(event.target).attr('data-stimuli-number')
    @stimuli_view.showStimuli($(event.target).attr('data-stimuli-number'))

  selectStimuli: (event) ->
    confirm_view = new HCI.ConfirmView(model: @model, stimuli_id: $(event.target).attr('data-stimuli-number'))
    @remove()
    $('#experiment').html(confirm_view.render().el)

  submit: ->
    confirm_view = new HCI.ConfirmView(model: @model, stimuli_id: @active_stimuli)
    @remove()
    $('#experiment').html(confirm_view.render().el)
