require 'picasa'
class AlbumsController < ApplicationController
  respond_to :json

  def index
    if user_signed_in?
      @albums = picasa_requester.get_albums_for current_user.uid, current_user.token
    end
    render json: @albums
  end

  private

  def picasa_requester
    @requester ||= Picasa.new
  end
end
