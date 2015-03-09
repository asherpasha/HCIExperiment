class HCI.PreTestQuestionnaireView extends Backbone.Model
  template: JST['pre_test_questionnaire']
  
  events:
    '#submit': 'submit'

  init: ->

  render: ->
    @$el.html(@template())
    this

  submit: ->
    @model.save()