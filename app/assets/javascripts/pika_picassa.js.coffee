window.PikaPicassa =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    PikaPicassa.albumsCollection = new PikaPicassa.Collections.Albums()
    PikaPicassa.albumsIndexView = new PikaPicassa.Views.AlbumsIndex()
    PikaPicassa.albumsRouter = new PikaPicassa.Routers.Albums()
    Backbone.history.start(pushState: true)

$(document).ready ->
  PikaPicassa.initialize()
