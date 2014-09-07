class PicCollection < Array
  def <<(pic)
   if pic.kind_of?(Hash)
    super(Picture.new(pic))
   else
     super
   end
  end
end
