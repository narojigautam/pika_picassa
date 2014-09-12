class PikaPicassa.Models.Album extends Backbone.Model
  idAttribute: 'album_id'

  pics: ->
    @pictures or= new PikaPicassa.Collections.Pictures()
    @pictures.url = "/albums/#{@get('id')}/pictures"
    _.each @get('pics') , (pic) =>
      @pictures.add new PikaPicassa.Models.Picture(pic)
    @pictures
