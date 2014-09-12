class PikaPicassa.Views.AlbumDisplayView extends Backbone.View
  template: JST["albums/album_display"]
  el: "#album-display"

  empty: ->
    @$el.html('')

  render: ->
    @$el.append @template(album: @model)
    @picturesView = new PikaPicassa.Views.PicturesListView
      collection: @model.pics()
    @picturesView.render()
