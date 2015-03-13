class HCI.ConfirmView extends Backbone.View
  template: JST['confirm_choice']
  
  events: ->
    'changeStimuli': 'changeStimuli'
    'selectStimuli': 'confirmStimuli'
    'click #back': 'back'

  className: 'experiment'

  initialize: (options) ->
    @result = options.result
    @stimuli_id = options.stimuli_id
    @current_stimuli = @stimuli_id

  render: ->
    @$el.html(@template())
    @stimuli_view = new HCI.StimuliView(active_stimuli: @stimuli_id)
    @controls_view = new HCI.ConfirmControlsView(active_stimuli: @stimuli_id)
    @$('#stimuli').html(@stimuli_view.render().el)
    @$('#controls').html(@controls_view.render().el)
    @$('h3').text('Confirm selection')
    this

  changeStimuli: (event) ->
    @current_stimuli = $(event.target).attr('data-stimuli-number')
    @stimuli_view.showStimuli($(event.target).attr('data-stimuli-number'))

  selectStimuli: (event) ->
    @end()
    @remove()
    if @model.results.size() == 5
      post_test_view = new HCI.PostTestQuestionnaireView(model: @model)
    else
      experiment_view = new HCI.ExperimentView(model: @model)
      $('#experiment').html(experiment_view.render().el)
    # confirm_view = new HCI.ConfirmView(model: @model, stimuli_id: $(event.target).attr('data-stimuli-number'))

  end: ->
    @result.set('end_time', new DateTime())
    @result.set('answer', @current_stimuli)
    @result.save()

  back: ->
    experiment_view = new HCI.ExperimentView(model: @model)
    @remove()
    $('#experiment').html(experiment_view.render().el)
