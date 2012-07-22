window.Application ||= {}

class Application.MapPicker
  constructor: (container_id, center, initial_point) ->
    @map = new GMaps {
      div: container_id,
      zoom: 16,
      mapType: 'Satellite'
      lat: center[0],
      lng: center[1]
    }
    this.setPoint initial_point if initial_point
    google.maps.event.addListener @map.map, 'click', this.pickPoint

  pickPoint: (e) =>
    $('#location_latitude').val e.latLng.lat()
    $('#location_longitude').val e.latLng.lng()
    point = [e.latLng.lat(), e.latLng.lng()]
    this.setPoint point

  setPoint: (point) ->
    @map.removeMarkers()
    @map.addMarker({
      lat: point[0],
      lng: point[1],
      title: 'Selected point'
    })

