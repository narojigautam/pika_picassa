require 'nokogiri'
module ResponseParser
  def parse_into_albums xml_data
    albums = []
    albums_data = Nokogiri.XML(xml_data)
    albums_data.search("feed entry").each do |album_data|
      albums << get_album_from(album_data)
    end
    albums
  end

  def parse_into_complete_album xml_data
    album_pics_data = Nokogiri.XML(xml_data)
    album_data = album_pics_data.search("feed").first
    album = get_album_from album_data

    pics = PicCollection.new
    album_pics_data.search("feed entry").each do |pic_data|
      pics << get_pic_from(pic_data, album.album_id)
    end
    album.pics = pics
    album
  end

  def parse_into_comments comments_data, picture_id
    comments_parsed = Nokogiri.XML(comments_data)
    comments = PicCommentCollection.new
    comments_parsed.search("feed entry").each do |comment_data|
      comments << get_comment_from(comment_data, picture_id)
    end
    comments
  end

  private

  def get_album_from album_data
    Album.new(
      album_id: album_data.search("id").first.content.split("/albumid/")[1],
      title: album_data.search('title').first.content,
      summary: album_data.search('summary').first.try(:content)
    )
  end

  def get_pic_from pic_data, album_id
    Picture.new(
      picture_id: pic_data.search("id").first.content.split("/photoid/")[1],
      title: pic_data.search('title').first.content,
      summary: pic_data.search('summary').first.try(:content),
      image_url: pic_data.search("content")[0]['src'],
      album_id: album_id
    )
  end

  def get_comment_from comment_data, picture_id
    PictureComment.new(
      picture_id: picture_id,
      comment_id: comment_data.search("id").first.content.split("/commentid/")[1],
      comment: comment_data.search('content').first.content
    )
  end
end
