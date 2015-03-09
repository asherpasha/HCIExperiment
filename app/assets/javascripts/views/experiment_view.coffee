class HCI.ExperimentView extends Backbone.View
  template: JST['experiment']
  
  init: ->

  render: ->
    @$el.html(@template())
    this