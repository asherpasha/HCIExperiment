class HCI.SidebarView extends Backbone.View
  template: JST['sidebar']
  
  init: ->
  
  render: ->
    @$el.html(@template())
    this

  