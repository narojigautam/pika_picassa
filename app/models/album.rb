class Album
  include Virtus.model

  attribute :url, String
  attribute :title, String
  attribute :summary, String
  attribute :pics, PicCollection[Picture]
end
