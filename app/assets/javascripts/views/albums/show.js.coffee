class PikaPicassa.Views.AlbumsShow extends Backbone.View
  tagName: "tr"
  template: JST['albums/show']

  render: =>
    @$el.html @template(album: @model)
    @
