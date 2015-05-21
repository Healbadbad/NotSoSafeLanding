//Testing area, environment variables are weird
var GooglePlaces = require("googleplaces");
var googlePlaces = new GooglePlaces(process.env.GOOGLE_PLACES_API_KEY2, process.env.GOOGLE_PLACES_OUTPUT_FORMAT);
var sql = require('mssql');
var parameters;
console.log("The server file is running")
console.log(process.env.IP)

/////////////////////////////////////////////////////////////////////////
//
// # SimpleServer
//
// A simple chat server using Socket.IO, Express, and Async.
//
/////////////////////////////////////////////////////////////////////////

var http = require('http');
var path = require('path');

var async = require('async');
var socketio = require('socket.io');
var express = require('express');

//
// ## SimpleServer `SimpleServer(obj)`
//
// Creates a new instance of SimpleServer with the following options:
//  * `port` - The HTTP port to listen on. If `process.env.PORT` is set, _it overrides this value_.
//
var router = express();
var server = http.createServer(router);
var io = socketio.listen(server,{log:false});

/////////////////////////////////////////////////////////////////////////////////////
// Begin Database Stuffs
//

var mysql      = require('mysql');
var pool = mysql.createPool({
  connectionLimit:12,
  host     : 'localhost',
  user     : 'moderator',//sqlslave
  password : 'thebestpasswordever', //'thebestpasswordthereis',//process.env.SLAVE_PASSWORD,
  database : 'NotSoSafeLanding'
});


/////////////////////////////////////////////////////////////////////////////////////
//The Database front end! yay!
//
router.use('/landing.html',function(req,res,next){
  console.log('/landing.html '+ req.query.q );

// Log the Query
  pool.query('call LogInsert(' + pool.escape(req.query.q) + ',2); ', function(err, rows, fields) {
    if (err) console.log(err);
    //console.log('The solution is: ', rows[0].solution);
  });

  // Move to the next stage of processing the request
  next();
});




//////////////////////////////////////////////////////////////////////////////////////
//  Google Maps API Requests
/**
 * Place search - https://developers.google.com/places/documentation/#PlaceSearchRequests
 */

//Load Dummy Data
var dummydata;
var fs = require('fs');
fs.readFile('testhaute.txt', 'utf8', function (err,data) {
  if (err) {
    return console.log(err);
  }
  dummydata = JSON.parse(data);
});

//Query Google maps API 
// Find local Airports, Amusement parks, Establishments, Health facilities, schools, and places of worship
var types = ['ariport ','amusement_park ','establishment ','health ','place_of_worship ','school '];
function PlacesArray(location, callback) {
    "use strict";
    //console.log('Gmaps Request');
    
    //build the 6 queries
    for(var k=0;k<6;k++){
      var parameters = {
          query: types[k] + location
      };
      //console.log(types[k] + location);
      
      //The actual Algorithm, DO NOT DELETE
      googlePlaces.textSearch(parameters, function (error, response) {
          if (error) console.log(error);
          console.log("# of places for: in " + location +' '+response.results.length );
          console.log(response.results);
          
          callback(response.results);// Populate the information
      });
      
      //Testing The callback and filewriting
      // callback(dummydata[k]);
    }
}



//////////////////////////////////////////////////////////////////////////////////////
// Socket Server Information Relay
//

router.use(express.static(path.resolve(__dirname, 'client')));
//Information Relay
var messages = [];
var sockets = [];
var request = require('request');

io.on('connection', function (socket) {
  console.log('client connected with ' + socket);
  //Wait for connection, on recieving location, 
  // query Gmaps, Database, Then return results as a JSON string
  
  socket.on('LandingZone',function(LZ){
    console.log('Data Request');
    var LandingZones = [];
    var zones = 0;
    //Extract the GPS coordinates of the searched location
    if(LZ == undefined || LZ == '')LZ = 'undefined';
    console.log(LZ)
    request('http://maps.googleapis.com/maps/api/geocode/json?address=' +LZ, function (error, response, body) {
      console.log('error: ' + error)
      if (!error && response.statusCode == 200 && JSON.parse(body).results[0] != undefined) {
        
        console.log('GPS ' + JSON.stringify(JSON.parse(body).results[0].geometry.location.lat));
        console.log('testing')
        //console.log(body) // Show the HTML for the Google homepage. 
        var lzcount =0;
        PlacesArray(LZ, function(data){ // data is the data from the google maps request - Contains all places information
          //console.log('Thecallback');
          LandingZones.push(data); // Push the new places into the array
          if(zones>0)buildingsInsert(data);
          zones = zones+1;
          lzcount += data.length
          
          if(zones >5) { // Maps request is done, access database
            //logMapData(LandingZones); //FOR TESTING PURPOSES
            //Populate Database yay
            airportsInsert(LandingZones[0]);
            
            //database is done, send off the final information
            // likely a callback
            var GPSX = JSON.parse(body).results[0].geometry.location.lat
            var GPSY = JSON.parse(body).results[0].geometry.location.lng
            console.log('sending the shits')
            socket.emit('glocations',LandingZones);
            var impactlist = [];
            var viplist = []
            //getAllCountries(socket);
            getAllPlanes(socket);
            getAirportGPS(GPSX,GPSY,socket,function(impacts){
              impactlist.push(impacts[0]);
              
              
              getBuildingGPS(GPSX,GPSY,socket,function(impacts2){
                impactlist.push(impacts2[0]);
                
                console.log("this impact: " + impactlist.length + '/' + lzcount+' ' +JSON.stringify(impacts2))
                
                if(impactlist.length == lzcount-1){
                  console.log('what is going on')
                  socket.emit('Impacts',impactlist);
                  console.log('sending data back:' + JSON.stringify(impactlist))
                  getVIPGPS(GPSX,GPSY,socket,function(impacts3){
                    //viplist.push(impacts3[0]);
                    socket.emit('VIPImpactData',impacts3);
                    
                    
                  });
                  
                }
              });
              
            });

            //getAllImpacts(socket);
          }
        });
      }
    });
    
    //console.log(LandingZones);
    console.log('finish socket');
  });
      //sockets.push(socket); // Testing dicks  //dicks
});

function broadcast(event, data) {
  sockets.forEach(function (socket) {
    socket.emit(event, data);
  });
}

server.listen(process.env.PORT || 3000, process.env.IP || "0.0.0.0", function(){
  var addr = server.address();
  console.log("Request server listening at", addr.address + ":" + addr.port);
});

function logMapData(object){
  var fs = require('fs');
  fs.writeFile("test.txt", JSON.stringify(object), function(err) {
      if(err) {
          return console.log(err);
      }
      console.log("The file was saved!");
  }); 
}
function getVIPGPS(GPSX,GPSY,socket,callback){
  console.log('VIP query');
  pool.query('call VIPCalcArea('+ GPSX +','+GPSY+'); ', function(err, rows, fields) {
      if (err) console.log(err);
      var vipimpactlist = []
      console.log('rows?: ' + JSON.stringify(rows))
      for(var k in rows[0]){
        pool.query('call ImpactByIID('+ pool.escape(rows[0][k].VIPID)+');', function(err, rows2, fields) {
          if (err) console.log(err);
          vipimpactlist.push(rows2[0]);
          // callback(rows2[0])
        });
      }
      callback(vipimpactlist);
      socket.emit('VIPData',rows[0])
    
  });
  //return rows[0].length;
}

function getAirportGPS(GPSX,GPSY,socket,callback){
  console.log('Airport query');
  pool.query('call AirportGPSCalc('+ GPSX +','+GPSY+'); ', function(err, rows, fields) {
      if (err) console.log(err);
      for(var k in rows[0]){
        pool.query('call ImpactByIID('+ pool.escape(rows[0][k].AID)+');', function(err, rows2, fields) {
          if (err) console.log(err);
          callback(rows2[0])
        });
      }
      socket.emit('data',rows[0])
      
  });
}
function airportsInsert(airports){
  //INSERT INTO Airport(AID, Name, Zip, GPSX, GPSY, IID)
  var airport,aid,name,zip,gpsx,gpsy,iid;
  
  for(var a in airports){
    airport = airports[a];
    console.log(airport);
    aid = airport.id;
    name = airport.name;
    zip = 47803; //TODO FIX THE ZIP CODE
    gpsx = airport.geometry.location.lat;
    gpsy = airport.geometry.location.lng;
    iid = 0;
    
    //INSERT query
    pool.query('call AirportInsert(' + pool.escape(aid)+','+pool.escape(name)+','+zip+','+gpsx+','+gpsy+')' ,function(err, rows, fields) {
      if (err) console.log(err);
    });
  }
}

function getBuildingGPS(GPSX,GPSY,socket,callback){
  pool.query('call BuildingGPSCalc('+ GPSX +','+GPSY+');', function(err, rows, fields) {
      if (err) console.log(err);
      if(rows == undefined)return;
      console.log("rows: "+rows[0][0].BID)
      
      for(var k=0; k<rows[0].length;k++){
        //console.log('Query IID: '+rows[0][k].BID);
        pool.query('call ImpactByIID('+ pool.escape(rows[0][k].BID)+');', function(err, rows2, fields) {
          if (err) console.log(err);
          //console.log('result: ' +JSON.stringify(rows2[0]));
          callback(rows2[0])
        });
        //callback();
      }
      socket.emit('data',rows[0])
  });
}
function buildingsInsert(buildings){
  //INSERT INTO Building(BID, Name, Area, Capacity, City, holder, Value, SIntegrity, GPSX, GPSY, IID)
  var bid,name,area,capacity,city,holder,value,sintegrity,gpsx,gpsy,iid;
  var building;
  for(var b in buildings){
    building = buildings[b];
    bid = building.id;
    name = building.name;
    area = 0; //TODO FIGURE OUT WHAT TO DO
    capacity = 0;//TODO
    city = building.formatted_address.split(',')[building.formatted_address.split(',').length-3];
    holder = ''; //TODO
    value = 42; //TODO
    sintegrity = 100; //TODO
    gpsx = building.geometry.location.lat;
    gpsy = building.geometry.location.lng;
    iid = 0;
    //INSERT query // TODO Set ID
    pool.query('call BuildingInsert(' + pool.escape(bid) +','+pool.escape(name)+','+area+','+capacity+','+ pool.escape(city) + ','+
            pool.escape(holder)+','+value+','+sintegrity+','+gpsx+','+gpsy+')' ,function(err, rows, fields) {
      if (err) {}
      //console.log(err);
    });
    
  }
}

function getAllCities(){
  pool.query('call AirportbyPK(); ', function(err, rows, fields) {
      if (err) console.log(err);
      //console.log('here2')
      //console.log('The solution is: ', rows[0]);
      return rows[0];
  });
}
function getAllCountries(socket){
  var data=0;
  pool.query('call CountrybyPK('+ pool.escape('india') +'); ', function(err, rows, fields, data) {
      if (err) console.log(err);
      //console.log('The solution is: ', rows);
      data = data +1
      //console.log('socket: '+(socket));
      socket.emit('data',rows[0][0])
      //socket.emit('data',rows[0]);
  });
  //console.log('socket: '+(socket));
  //console.log("therows: "+rows);
}
function getAllImpacts(socket){
  pool.query('call ImpactStar(); ', function(err, rows, fields) {
      if (err) console.log(err);
      socket.emit('Impacts',rows[0])
  });
}
function getAllLandingZones(socket){
  pool.query('call LandingZonebyPK(); ', function(err, rows, fields) {
      if (err) console.log(err);
      //console.log('The solution is: ', rows[0]);
      return rows[0];
  });
  
}
function getAllPlanes(socket){
  pool.query('call PMStar(); ', function(err, rows, fields) {
      if (err) console.log(err);
      //console.log('The solution is: ', rows[0]);
      //return rows[0];
      socket.emit('planes',rows[0])
      //console.log(rows)
  });
}
//console.log("this is the server" + getAllCountries())
