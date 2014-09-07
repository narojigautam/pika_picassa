class PikaPicassa.Routers.Albums extends Backbone.Router
  routes:
    "": "index"

  index: ->
    PikaPicassa.albumsCollection.fetch
      success: ->
        PikaPicassa.albumsIndexView.render()
