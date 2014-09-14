class AlbumsController < ApplicationController
  respond_to :json

  def index
    if user_signed_in?
      @albums = picasa_requester.get_albums
    end
    render json: @albums
  end

  def show
    album_id = params[:id]
    @album = picasa_requester.get_album album_id
    render json: @album
  end
end
