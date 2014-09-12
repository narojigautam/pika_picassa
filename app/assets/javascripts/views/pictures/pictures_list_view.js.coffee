class PikaPicassa.Views.PicturesListView extends Backbone.View
  tagName: 'ul'
  className: 'thumbnails'

  initialize: ->
    _.bindAll(@, 'add')
    @on "reset", => @reset_collection()

  render: ->
    @reset_collection()
    $("#pictures").append(@$el)

  reset_collection: ->
    _(@pictureViews).each (picture_v) ->
      picture_v.off()
      picture_v.remove()
    @pictureViews = []
    _(@collection.models).each(@add)

  add: (_model) ->
    pictureView = new PikaPicassa.Views.PictureShow(model: (_model))
    @pictureViews.push(pictureView)
    @$el.append(pictureView.render().$el)
