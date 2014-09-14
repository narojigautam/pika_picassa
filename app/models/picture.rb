class Picture
  include Virtus.model

  attribute :picture_id, String
  attribute :title, String
  attribute :summary, String
  attribute :image_url, String
  attribute :album_id, String
  attribute :comments, PicCommentCollection[PictureComment]
end
