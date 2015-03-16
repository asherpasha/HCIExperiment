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
      question = ": Which image is most red in "
      @result = new HCI.Result(subject_id: @model.get('id'))
      @model.results.add(@result)
      if @model.results.indexOf(@result) == 0
        @result.set('answer', 1)
        @result.set('stimuli_number', 1)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "the shoot apex inflorescence?")
      else if @model.results.indexOf(@result) == 1
        @result.set('answer', 2)
        @result.set('stimuli_number', 2)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "the sep/pet/stem/carp?")
      else if @model.results.indexOf(@result) == 2
        @result.set('answer', 3)
        @result.set('stimuli_number', 3)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "bulb image 10 and 11?")
      else if @model.results.indexOf(@result) == 3
        @result.set('answer', 4)
        @result.set('stimuli_number', 4)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "the senescent leaf?")
      else if @model.results.indexOf(@result) == 4
        @result.set('answer', 5)
        @result.set('stimuli_number', 5)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "the cotyledons?")
      else if @model.results.indexOf(@result) == 5
        @result.set('answer', 3)
        @result.set('stimuli_number', 6)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "seed silique embryo #6?")
      else if @model.results.indexOf(@result) == 6
        @result.set('answer', 5)
        @result.set('stimuli_number', 7)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "leaf #2?")
      else if @model.results.indexOf(@result) == 7
        @result.set('answer', 1)
        @result.set('stimuli_number', 8)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "the root?")
      else if @model.results.indexOf(@result) == 8
        @result.set('answer', 2)
        @result.set('stimuli_number', 9)
        $('a.navbar-brand').text($('a.navbar-brand').text() + question + "entire rosette after transition to flowering?")
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

    # @controls_view = new HCI.PointAndClickControlsView(active_stimuli: @stimuli_id)
    # @controls_view = new HCI.AutomaticRSVPControlsView(active_stimuli: @stimuli_id)
    # @controls_view = new HCI.HoverControlsView(active_stimuli: @stimuli_id)
    # @controls_view = new HCI.SliderControlsView(active_stimuli: @stimuli_id)

    @$el.html(@template())
    @stimuli_view = new HCI.StimuliView(active_stimuli: @stimuli_id, stimuli_number: @result.get('stimuli_number'))
    @$('#stimuli').html(@stimuli_view.render().el)
    @$('#controls').html(@controls_view.render().el)
    this

  start: =>
    @result.set('start_time', new Date())
    @result.save()

  changeStimuli: (event) ->
    @active_stimuli = $(event.target).attr('data-stimuli-number')
    @stimuli_view.showStimuli($(event.target).attr('data-stimuli-number'))

  selectStimuli: (event) =>
    confirm_view = new HCI.ConfirmView(model: @model, result: @result, stimuli_id: @active_stimuli)
    @remove()
    @stimuli_view.remove()
    @controls_view.remove()
    $('#experiment').html(confirm_view.render().el)