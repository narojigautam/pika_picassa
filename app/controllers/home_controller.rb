require 'picasa'
class HomeController < ApplicationController
  def index
    if user_signed_in?
      @albums = Picasa.new.get_albums_for current_user.uid, current_user.token
    end
  end
end