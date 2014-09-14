class PikaPicassa.Views.PictureShow extends Backbone.View
  tagName: "li"
  className: "span3"
  template: JST['pictures/show']

  events:
    "click #create-comment": "saveComment"

  saveComment: =>
    comment_args =
      comment: @$("#comment-input").val()
    comment = new PikaPicassa.Models.PictureComment(comment_args)
    comment.url = "/albums/#{@model.get('album_id')}/pictures/#{@model.get('picture_id')}/picture_comments"
    comment.save
      success: (comment, response)->
        console.log(response)

  render: =>
    @$el.html @template(picture: @model)
    @comments_list = new PikaPicassa.Collections.PictureComments()
    @comments_list.url = "/albums/#{@model.get('album_id')}/pictures/#{@model.get('picture_id')}/picture_comments"
    @comments_list.fetch
      success: =>
        _.each @comments_list.models, (comment) =>
          @$('#comments-list ul').append("<li>#{comment.get('comment')}</li>")
    @
