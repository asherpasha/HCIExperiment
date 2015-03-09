class HCI.ConsentView extends Backbone.View
  template: JST['consent_form']

  events:
    'click button': 'showExperimentDescription'

  className: 'dialog-form'

  init: ->

  render: ->
    @$el.html(@template())
    this

  showExperimentDescription: ->
    console.log('showExperimentDescription')
    description_view = new HCI.ExperimentDescription(model: @model)
    @remove()
    $('#experiment').html(description_view.render().el)
