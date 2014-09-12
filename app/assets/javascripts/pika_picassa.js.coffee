window.PikaPicassa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    PikaPicassa.albumsRouter = new PikaPicassa.Routers.Albums()
    Backbone.history.start()

$(document).ready ->
  PikaPicassa.initialize()
