class PikaPicassa.Views.PictureShow extends Backbone.View
  tagName: "li"
  className: "span3"
  template: JST['pictures/show']

  render: =>
    @$el.html @template(picture: @model)
    @
