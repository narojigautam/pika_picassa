require 'nokogiri'
module ResponseParser
  def parse_into_albums xml_data
    albums_data = Nokogiri.XML(xml_data)
  end
end
