class HCI.PrimingView extends Backbone.View
  template: JST['priming']
  
  events:
    'click button': 'showExperiment'

  className: 'dialog-form'

  render: ->
    @$el.html(@template(model: @model))
    this

  showExperiment: ->
    experiment_view = new HCI.ExperimentView(model: @model)
    @remove()
    $('#experiment').html(experiment_view.render().el)
