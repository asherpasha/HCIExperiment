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
        @result.set('answer', 1)
      else if @model.results.indexOf(@result) == 1
        @result.set('answer', 2)
      else if @model.results.indexOf(@result) == 2
        @result.set('answer', 3)
      else if @model.results.indexOf(@result) == 3
        @result.set('answer', 4)
      else if @model.results.indexOf(@result) == 4
        @result.set('answer', 5)
      @start()

  render: ->
    if @model.get('experiment_group') == 1 #point and click
      console.log('group 1')
      @controls_view = new HCI.PointAndClickControlsView()
    else if @model.get('experiment_group') == 2 #automatic rsvp
      console.log('group 2')
      @controls_view = new HCI.AutomaticRSVPControlsView()
    else if @model.get('experiment_group') == 3 #hover rsvp
      console.log('group 3')
      @controls_view = new HCI.HoverControlsView()
    else if @model.get('experiment_group') == 4 #momentum rsvp
      console.log('group 4')
      @controls_view = new HCI.MomentumControlsView()
    else
      @$el.html(@template())
      @controls_view = new HCI.ControlsView()
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
    $('#experiment').html(confirm_view.render().el)