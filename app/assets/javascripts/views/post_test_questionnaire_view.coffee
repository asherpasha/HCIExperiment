class HCI.PostTestQuestionnaireView extends Backbone.View
  template: JST['post_test_questionnaire']

  className: 'dialog-form'

  events: ->
    'click button': 'submit'

  render: ->
    @$el.html(@template(model: @model))
    this

  submit: ->
    @model.set('interaction_rating', +@$('#interaction_rating').val())
    @model.set('display_helpfulness', +@$('#display_helpfulness').val())
    @model.set('rsvp_experience', @$('#rsvp_experience').val())
    @model.set('experience_difficulty', @$('#experience_difficulty').val())
    @model.save()
    @$el.html('Thank you for participating!')