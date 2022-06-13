var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : 'root',
  database : 'phenglei'
});
 
connection.connect();
 
var sql = 'SELECT * FROM project';

// const test = connection.query(sql,function (err, result) {
//     if(err){
//       console.log('[SELECT ERROR] - ',err.message);
//       return;
//     }

//    console.log('--------------------------SELECT----------------------------');
//    console.log(result);
//    console.log('------------------------------------------------------------\n\n');  
//    return result;
// });

const testQuery = (sql, values) => {
    return new Promise((resolve, reject) => {
        var mysql      = require('mysql');
        var connection = mysql.createConnection({
          host     : 'localhost',
          user     : 'root',
          password : 'root',
          database : 'phenglei'
        });
 
        connection.connect();
        connection.query(sql, values, (err, results) => {
            if (err) {
                reject(err);
            } else {
                connection.end()
                resolve({
                    status: 200,
                    results
                });
            }
    });
    })
};


module.exports = { testQuery };