class HCI.Router extends Backbone.Router
  routes:
    '': 'showIndex'
    'experiment/:id' :'showExperiment'

  showIndex: =>
    @sign_up_view = new HCI.WelcomeView()
    $('#forms').html(@sign_up_view.render().el)

  showExperiment: (part) ->
    $('#forms').text('some text')
