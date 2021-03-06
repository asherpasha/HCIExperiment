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
    @$('select').removeClass('required')

  showConsentForm: ->
    if @$('#name').val() == ""
      @$('#name').addClass('required')
    else if @$('#email').val() == ''
      @$('#email').addClass('required')
    else if @$('#age').val() == ''
      @$('#age').addClass('required')
    else if @$('#efp_experience').val() == 'null'
      @$('#efp_experience').addClass('required')
    else if @$('#gender').val() == 'null'
      @$('#gender').addClass('required')
    else if @$('#input_type').val() == 'null'
      @$('#input_type').addClass('required')
    else
      @model.set('email', @$('#email').val())
      @model.set('name', @$('#name').val())
      @model.set('age', @$('#age').val())
      @model.set('efp_experience', +@$('#efp_experience').val())
      @model.set('gender', @$('#gender').val())
      @model.set('input_type', @$('#input_type').val())
      @model.set('color_test', @$("input[name=color]:checked").val())
      consent_view = new HCI.ConsentView(model: @model)
      @remove()
      $('#forms').html(consent_view.render().el)
