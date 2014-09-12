class PikaPicassa.Routers.Albums extends Backbone.Router
  initialize: ->
    @albumsCollection = new PikaPicassa.Collections.Albums()

  routes:
    "albums/:id": "albumDetails"
    "*defaults": "index"

  albumDetails: (id)->
    album = new PikaPicassa.Models.Album()
    album.url = "/albums/#{id}"
    @albumView.off() and @albumView.empty() if @albumView
    album.fetch
      success: (album)=>
        @albumView = new PikaPicassa.Views.AlbumDisplayView(model: album)
        @albumView.render()

  index: ->
    @albumsIndexView or= new PikaPicassa.Views.AlbumsIndex
      collection: @albumsCollection
    @albumsCollection.fetch
      success: =>
        @albumsIndexView.render()
