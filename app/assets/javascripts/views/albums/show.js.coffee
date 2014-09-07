class PikaPicassa.Views.AlbumsShow extends Backbone.View
  tagName: "p"
  template: JST['albums/show']

  render: =>
    @$el.html @template(album: @model)
    @
