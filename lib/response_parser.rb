require 'nokogiri'
module ResponseParser
  def parse_into_albums xml_data
    albums = []
    albums_data = Nokogiri.XML(xml_data)
    albums_data.search("feed entry").each do |entry|
      albums << Album.new(
        url: entry.search('id').first.content,
        title: entry.search('title').first.content,
        summary: entry.search('summary').first.try(:content)
      )
    end
    albums
  end
end
