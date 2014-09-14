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
    binding.pry
    pics_response = self.class.get(pics_url_for(album_id), {token: @token})
    # an album is complete if it has pics data as well as its own data
    parse_into_complete_album(pics_response)
  end

  def comment_on album_id, pic_id, comment
    self.class.post(
      post_comment_url_for(album_id, pic_id),
      body: form_comment_req(comment),
      headers: post_req_headers
    )
  end

  private

  def albums_url
    "/data/feed/api/user/#{@user_id}"
  end

  def pics_url_for album_id
    "/data/feed/api/user/#{@user_id}/albumid/#{album_id}"
  end

  def post_comment_url_for album_id, pic_id
    "/data/feed/api/user/#{@user_id}/albumid/#{album_id}/photoid/#{pic_id}"
  end

  def form_comment_req comment
    "<entry xmlns='http://www.w3.org/2005/Atom'>" +
    "<content>#{comment}</content>" +
    "<category scheme='http://schemas.google.com/g/2005#kind'" +
    " term='http://schemas.google.com/photos/2007#comment'/></entry>"
  end

  def post_req_headers
    {
      "GData-Version" => "2",
      "Content-Type" => "application/atom+xml",
      "Authorization" => "OmniAuth.token=\"#{@token}\""
    }
  end
end
