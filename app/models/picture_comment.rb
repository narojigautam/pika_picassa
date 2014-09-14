class PictureComment
  include Virtus.model

  attribute :picture_id, String
  attribute :comment_id, String
  attribute :comment, String
end
