var GooglePlaces = require("googleplaces");
var googlePlaces = new GooglePlaces(process.env.GOOGLE_PLACES_API_KEY, process.env.GOOGLE_PLACES_OUTPUT_FORMAT);
var parameters;

/**
 * Place search - https://developers.google.com/places/documentation/#PlaceSearchRequests
 */
parameters = {
  location:[-33.8670522, 151.1957362],
  types:"doctor"
};
googlePlaces.placeSearch(parameters, function (error, response) {
  if (error) throw error;
  console.log(response.results);
});