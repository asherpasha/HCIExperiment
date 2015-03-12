class HCI.ExperimentDescriptionView extends Backbone.View
  template: JST['experiment_description']

  events:
    'click button': 'showExperiment'

  className: 'dialog-form'

  init: ->

  render: ->
    @$el.html(@template())
    this

  showExperiment: ->
    experiment_view = new HCI.ExperimentView(model: @model)
    @remove()
    $('#experiment').html(experiment_view.render().el)
