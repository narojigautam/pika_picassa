class PikaPicassa.Views.PictureShow extends Backbone.View
  tagName: "li"
  className: "span3"
  template: JST['pictures/show']

  events:
    "click #create-comment": "saveComment"

  saveComment: =>
    comment_args =
      comment: @$("#comment-input").val()
      picture_id: @model.get('picture_id')
      album_id: @model.get('album_id')
    comment = new PikaPicassa.Models.PictureComment(comment_args)
    comment.save
      success: (comment, response)->
        console.log(response)

  render: =>
    @$el.html @template(picture: @model)
    @
