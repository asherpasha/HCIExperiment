class HCI.PostTestQuestionnaireView extends Backbone.Model
  template: JST['post_test_questionnaire']
  
  init: ->
  
  render: ->
    @$el.html(@template())
    this

  submit: ->
    @model.save()