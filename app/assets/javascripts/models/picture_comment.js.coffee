class PikaPicassa.Models.PictureComment extends Backbone.Model
  idAttribute: 'comment_id'
  url: "/picture_comments"

  is_invalid: ->
    !@get('picture_id') or !@get('comment')
