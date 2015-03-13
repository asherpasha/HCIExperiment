class HCI.ExperimentView extends Backbone.View
  template: JST['experiment']
  
  events: ->
    'changeStimuli': 'changeStimuli'
    'selectStimuli': 'selectStimuli'
    'click #submit': 'selectStimuli'

  className: 'experiment'

  initialize: (options) ->
    if options?.stimuli_id?
      @stimuli_id = options.stimuli_id
    if options?.result?
      @result = options.result
    else
      @result = new HCI.Result(subject_id: @model.get('id'))
      @model.results.add(@result)
      if @model.results.indexOf(@result) == 0
        $('a.navbar-brand').text('Question 1')
        @result.set('answer', 1)
      else if @model.results.indexOf(@result) == 1
        $('a.navbar-brand').text('Question 2')
        @result.set('answer', 2)
      else if @model.results.indexOf(@result) == 2
        $('a.navbar-brand').text('Question 3')
        @result.set('answer', 3)
      else if @model.results.indexOf(@result) == 3
        $('a.navbar-brand').text('Question 4')
        @result.set('answer', 4)
      else if @model.results.indexOf(@result) == 4
        $('a.navbar-brand').text('Question 5')
        @result.set('answer', 5)
      @start()

  render: ->
    if @model.get('experiment_group') == 1 #point and click
      @controls_view = new HCI.PointAndClickControlsView(active_stimuli: @stimuli_id)
    else if @model.get('experiment_group') == 2 #automatic rsvp
      @controls_view = new HCI.AutomaticRSVPControlsView(active_stimuli: @stimuli_id)
    else if @model.get('experiment_group') == 3 #hover rsvp
      @controls_view = new HCI.HoverControlsView(active_stimuli: @stimuli_id)
    else if @model.get('experiment_group') == 4 #momentum rsvp
      @controls_view = new HCI.SliderControlsView(active_stimuli: @stimuli_id)
    else
      @$el.html(@template())
      @controls_view = new HCI.ControlsView()
    # @controls_view = new HCI.AutomaticRSVPControlsView(active_stimuli: @stimuli_id)
    # @controls_view = new HCI.SliderControlsView(active_stimuli: @stimuli_id)
    @$el.html(@template())
    @stimuli_view = new HCI.StimuliView(active_stimuli: @stimuli_id)
    @$('#stimuli').html(@stimuli_view.render().el)
    @$('#controls').html(@controls_view.render().el)
    this

  start: ->
    @result.set('start_time', new Date())
    @result.save()

  changeStimuli: (event) ->
    @active_stimuli = $(event.target).attr('data-stimuli-number')
    @stimuli_view.showStimuli($(event.target).attr('data-stimuli-number'))

  selectStimuli: (event) ->
    confirm_view = new HCI.ConfirmView(model: @model, result: @result, stimuli_id: @active_stimuli)
    @remove()
    @stimuli_view.remove()
    @controls_view.remove()
    $('#experiment').html(confirm_view.render().el)