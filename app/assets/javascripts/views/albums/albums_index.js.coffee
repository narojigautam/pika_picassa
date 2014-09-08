class PikaPicassa.Views.AlbumsIndex extends Backbone.View
  template: JST['albums/index']
  tagName: 'tbody'

  initialize: ->
    _.bindAll(@, 'add')
    @on "reset", => @reset_collection()

  render: ->
    @reset_collection()
    $("#albums-list").append(@template)
    $("#albums-list table").append(@$el)

  reset_collection: ->
    _(@albumViews).each (album_v) ->
      album_v.off()
      album_v.remove()
    @albumViews = []
    _(PikaPicassa.albumsCollection.models).each(@add)

  add: (_model) ->
    albumView = new PikaPicassa.Views.AlbumsShow(model: (_model))
    @albumViews.push(albumView)
    @$el.append(albumView.render().$el)
