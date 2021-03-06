//var gm = require('googlemaps');
console.log("Script started");
console.log(process.env.GOOGLE_PLACES_API_KEY)
var util = require('util');
var GooglePlaces = require("googleplaces");

var googlePlaces = new GooglePlaces(process.env.GOOGLE_PLACES_API_KEY, process.env.GOOGLE_PLACES_OUTPUT_FORMAT);
var parameters;


//gm.config({'key':'AIzaSyC1MG4VO1wvHFuTAAgXAyfqF3iFpnqcDvU'});
//console.log(ENV["GOOGLE_MAPS_API_KEY"]);
//console.log(gm.places('31.470656,74.412929'));
//function(err, data){util.puts(JSON.stringify(data));});

parameters = {
  location:[-33.8670522, 151.1957362],
  types:"doctor"
};

googlePlaces.placeSearch(parameters, function (error, response) {
  if (error) throw error;
  console.log(response.results);
});
console.log("Request made");




//Places api https://developers.google.com/maps/documentation/javascript/places



/* HTML version of the code, likely usable later
var map;
var infoWindow;
var service;

function initialize() {
  map = new google.maps.Map(document.getElementById('map-canvas'), {
    center: new google.maps.LatLng(-33.8668283734, 151.2064891821),
    zoom: 15,
    styles: [
      {
        stylers: [
          { visibility: 'simplified' }
        ]
      },
      {
        elementType: 'labels',
        stylers: [
          { visibility: 'off' }
        ]
      }
    ]
  });

  infoWindow = new google.maps.InfoWindow();
  service = new google.maps.places.PlacesService(map);

  google.maps.event.addListenerOnce(map, 'bounds_changed', performSearch);
}

function performSearch() {
  var request = {
    bounds: map.getBounds(),
    keyword: 'best view'
  };
  service.radarSearch(request, callback);
}

function callback(results, status) {
  if (status != google.maps.places.PlacesServiceStatus.OK) {
    alert(status);
    return;
  }
  for (var i = 0, result; result = results[i]; i++) {
    createMarker(result);
  }
}

function createMarker(place) {
  var marker = new google.maps.Marker({
    map: map,
    position: place.geometry.location,
    icon: {
      // Star
      path: 'M 0,-24 6,-7 24,-7 10,4 15,21 0,11 -15,21 -10,4 -24,-7 -6,-7 z',
      fillColor: '#ffff00',
      fillOpacity: 1,
      scale: 1/4,
      strokeColor: '#bd8d2c',
      strokeWeight: 1
    }
  });

  google.maps.event.addListener(marker, 'click', function() {
    service.getDetails(place, function(result, status) {
      if (status != google.maps.places.PlacesServiceStatus.OK) {
        alert(status);
        return;
      }
      infoWindow.setContent(result.name);
      infoWindow.open(map, marker);
    });
  });
}

google.maps.event.addDomListener(window, 'load', initialize);

*/