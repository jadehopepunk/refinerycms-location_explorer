window.Application ||= {}

class Application.LocationsMap
  constructor: (container_id, center, options = {}) ->
    @map = new GMaps {
      div: container_id,
      zoom: options.zoom || 16,
      mapType: 'Satellite'
      lat: center[0],
      lng: center[1]
    }

  updateLocation: (location, e) =>
    $('#location_preview').show()
    $('#location_preview .location_name').text(location['name'])
    $('#location_preview .description_preview').text(location['description_preview'])
    $('#location_preview .more_details').attr('href', location['detail_url'])
    if location['preview_image_url']
      $('#location_preview .image_container').html("<img src=\"#{location['preview_image_url']}\" class=\"location_image\"/>")
    else
      $('#location_preview .image_container').html("")

  addLocations: (locations) ->
    @locations = locations
    for location in @locations
      this.addLocation location

  addLocation: (location) ->
    pinColor = location['colour'] || "FE7569"
    pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
        new google.maps.Size(21, 34),
        new google.maps.Point(0,0),
        new google.maps.Point(10, 34))

    @map.addMarker {
      lat: location['latitude'],
      lng: location['longitude'],
      icon: pinImage,
      title: location['name'],
      infoWindow: {content: location['name']}
      click: (e)=>
        this.updateLocation(location, e)
    }
