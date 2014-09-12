class Album
  include Virtus.model

  attribute :title, String
  attribute :summary, String
  attribute :pics, PicCollection[Picture]
  attribute :album_id, String
end
