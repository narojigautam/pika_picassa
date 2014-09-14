class PicCommentCollection < Array
  def <<(comment)
   if comment.kind_of?(Hash)
    super(PictureComment.new(comment))
   else
     super
   end
  end
end
