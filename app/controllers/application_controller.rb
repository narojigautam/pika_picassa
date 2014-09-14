require 'picasa'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def picasa_requester
    return unless current_user
    @requester ||= Picasa.new(current_user.uid, current_user.token)
  end
end
