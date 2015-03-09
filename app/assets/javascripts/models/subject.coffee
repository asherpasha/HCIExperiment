class HCI.Subject extends Backbone.Model
  url: ->
    if @.isNew()
      '/subjects'
    else
      "/subjects/#{@id}"