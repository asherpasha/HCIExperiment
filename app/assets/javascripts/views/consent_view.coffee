class HCI.ConsentView extends Backbone.View
  template: JST['consent_form']

  events:
    'click button': 'showExperimentDescription'

  className: 'dialog-form'

  render: ->
    @$el.html(@template())
    this

  showExperimentDescription: ->
    if @$('#email').val() == ''
      @$('#email').addClass('required')
    else
      @model.set('email', @$('#email').val())
      xhr = @model.save()
      @$('button').attr('disabled', true)
      xhr.success =>
        @remove()
        description_view = new HCI.ExperimentDescriptionView(model: @model)
        $('#forms').html(description_view.render().el)        

