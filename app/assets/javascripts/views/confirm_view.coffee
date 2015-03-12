class HCI.ConfirmView extends Backbone.View
  template: JST['confirm_choice']
  
  events: ->
    'changeStimuli': 'changeStimuli'
    'selectStimuli': 'confirmStimuli'
    'click #back': 'back'

  className: 'experiment'

  initialize: (options) ->
    @stimuli_id = options.stimuli_id

  render: ->
    @$el.html(@template())
    @stimuli_view = new HCI.StimuliView(active_stimuli: @stimuli_id)
    @controls_view = new HCI.ConfirmControlsView(active_stimuli: @stimuli_id)
    @$('#stimuli').html(@stimuli_view.render().el)
    @$('#controls').html(@controls_view.render().el)
    @$('h3').text('Confirm selection')
    this

  changeStimuli: (event) ->
    @stimuli_view.showStimuli($(event.target).attr('data-stimuli-number'))

  selectStimuli: (event) ->
    confirm_view = new HCI.ConfirmView(model: @model, stimuli_id: $(event.target).attr('data-stimuli-number'))

  back: ->
    experiment_view = new HCI.ExperimentView(model: @model)
    @remove()
    $('#experiment').html(experiment_view.render().el)
