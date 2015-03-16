class HCI.SignUpView extends Backbone.View
  template: JST['sign_up']

  events:
    'click button': 'showConsentForm'
    'change input': 'inputChange'

  className: 'dialog-form'

  render: ->
    @$el.html(@template())
    this

  inputChange: ->
    @$('input').removeClass('required')

  showConsentForm: ->
    if @$('#name').val() == ""
      @$('#name').addClass('required')
    else if @$('#email').val() == ''
      @$('#email').addClass('required')
    else
      @model.set('email', @$('#email').val())
      @model.set('name', @$('#name').val())
      @model.set('efp_experience', +@$('#efp_experience').val())
      consent_view = new HCI.ConsentView(model: @model)
      @remove()
      $('#forms').html(consent_view.render().el)
