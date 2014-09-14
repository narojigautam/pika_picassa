class PictureCommentsController < ApplicationController

  def index
    comments = picasa_requester.get_comments_of params[:album_id],
      params[:picture_id]
    render json: comments
  end

  def create
    response = picasa_requester.comment_on params[:album_id],
      params[:picture_id], params[:comment]
    render :json => response, :status => 200
  end
end
