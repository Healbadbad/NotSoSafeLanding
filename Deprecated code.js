/* Detailed info
var Connection = require('tedious').Connection;
var Request = require('tedious').Request; 
var TYPES   = require('tedious').TYPES;

var config = {
server: '172.17.50.23',//[db-server].database.windows.net    137.112.104.102
  userName: 'sqlslave@172.17.50.23',
  password: process.env.SLAVE_PASSWORD,
  database: 'NotSoSafeLanding',
  port: '1453',
  encrypt: true, // for Azure users
  options:{port:3306,
    debug:{packet:true}
  }
}


function executeStatement() {
  
  request = new Request( " exec [LogInsert] ", function(err, rowCount) {
    if (err) {
      console.log(err);
    } else {
       console.log(rowCount + ' rows');
    }
    connection.close();
  });
  request.addParameter('Location', TYPES.VarChar, 'Fred');
  request.addParameter('NOB', TYPES.Int, 42);
  request.VarChar(50)
  console.log(request.parameters)
  request.on('done',function(rowCount, more) {
    console.log(rowCount +' rows returned' );
  });
  connection.execSql(request);
}


var connection = new Connection(config);
// console.log(connection)
 connection.on('connect' , function(err) {
  if (err) return console.error(err); // If no error, then good to go...
  
  executeStatement();
});
*/
/*
var config = {
    user: 'sqlslave',
    password: process.env.SLAVE_PASSWORD,
    server: '172.17.50.23', // You can use 'localhost\\instance' to connect to named instance 
    database: 'NotSoSafeLanding',
    
    options: {
        encrypt: true // Use this if you're on Windows Azure 
    }
}
 
var connection = new sql.Connection(config, function(err) {
    // ... error checks 
    
    // Query 
    
    var request = new sql.Request(connection); // or: var request = connection.request(); 
    
    
    console.log(connection)
    // Stored Procedure 
    console.log("setting up request");
    var request = new sql.Request(connection);
    request.input('Location', sql.VarChar(50),"Nevada");
    request.input('NOB', sql.Int,13);
    //request.output('output_parameter', sql.VarChar(50));
    console.log(request)
    request.execute('LogInsert', function(err, recordsets, returnValue) {
        // ... error checks 
        console.log("Making the request")
        console.log(err);
        console.log(recordsets)
        //console.dir(recordsets);
    });
    
});
*/



/*request.query('select 1 as number', function(err, recordset) {
        // ... error checks 
        
        console.dir(recordset);
   });
*/