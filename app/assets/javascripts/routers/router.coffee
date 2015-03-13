class HCI.Router extends Backbone.Router
  routes:
    '': 'showIndex'
    'experiment/:id' :'showExperiment'

  showIndex: =>
    @sign_up_view = new HCI.SignUpView(model: HCI.subject)
    $('#experiment').html(@sign_up_view.render().el)

  showExperiment: (part) ->
    $('#experiment').text('some text')
