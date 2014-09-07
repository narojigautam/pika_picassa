require 'httparty'
require 'response_parser'
class Picasa
  include ResponseParser
  include HTTParty
  base_uri 'https://picasaweb.google.com'

  def get_albums_for user_id, token
    albums_response = self.class.get("/data/feed/api/user/#{user_id}", {token: token})
    parse_into_albums(albums_response.body)
  end
end
