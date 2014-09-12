class PikaPicassa.Models.Picture extends Backbone.Model
  idAttribute: 'picture_id'

  fetch: ->
    @url = "/albums/#{@get('album_id')}/pictures/#{@get('id')}"
    super()
