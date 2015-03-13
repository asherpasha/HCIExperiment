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
    if @$('#email').val() != ''
      @model.set('email', @$('#email').val())
      xhr = @model.save()
      @$('button').attr('disabled', true)
      xhr.success =>
        @remove()
        description_view = new HCI.ExperimentDescriptionView(model: @model)
        $('#experiment').html(description_view.render().el)        

