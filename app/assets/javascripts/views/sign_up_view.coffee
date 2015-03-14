class HCI.SignUpView extends Backbone.View
  template: JST['sign_up']

  events:
    'click button': 'showConsentForm'

  className: 'dialog-form'

  init: ->

  render: ->
    @$el.html(@template())
    this

  showConsentForm: ->
    @model.set('name', @$('#name').val())
    @model.set('efp_experience', +@$('#efp_experience').val())
    consent_view = new HCI.ConsentView(model: @model)
    @remove()
    $('#experiment').html(consent_view.render().el)
