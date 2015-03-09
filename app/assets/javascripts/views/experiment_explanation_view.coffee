class HCI.ExperimentExplanationView extends Backbone.View
  template: JST['consent_form']

  events:
    'click button': 'showExperiment'

  className: 'dialog-form'

  init: ->

  render: ->
    @$el.html(@template())
    this

  showExperiment: ->
    console.log('showExperiment')
    description_view = new HCI.Experiment(model: @model)
    @remove()
    $('#experiment').html(description_view.render().el)
