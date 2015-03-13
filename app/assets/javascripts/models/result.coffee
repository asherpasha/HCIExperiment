class HCI.Subject extends Backbone.Model
  url: ->
    if @.isNew()
      '/results'
    else
      "/results/#{@id}"