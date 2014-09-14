class PictureCommentsController < ApplicationController
  def create
    response = picasa_requester.comment_on params[:album_id],
      params[:picture_id], params[:comment]
    render :json => response, :status => 200
  end
end
