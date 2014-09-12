require 'httparty'
require 'response_parser'
class Picasa
  include ResponseParser
  include HTTParty
  base_uri 'https://picasaweb.google.com'

  def initialize user_id, token
    @user_id = user_id
    @token = token
  end

  def get_albums
    @albums_response ||= self.class.get(albums_url, {token: @token})
    parse_into_albums(@albums_response.body)
  end

  def get_album album_id
    pics_response = self.class.get(pics_url_for(album_id), {token: @token})
    # an album is complete if it has pics data as well as its own data
    parse_into_complete_album(pics_response)
  end

  private

  def albums_url
    "/data/feed/api/user/#{@user_id}"
  end

  def pics_url_for album_id
    "/data/feed/api/user/#{@user_id}/albumid/#{album_id}"
  end
end
