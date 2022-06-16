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

function funcwait(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

async function sleep() {
    await funcwait(3000);
}

const testInsertProduct = (addSql, addSqlParams) => {
        var mysql      = require('mysql');
        var connection = mysql.createConnection({
          host     : 'localhost',
          user     : 'root',
          password : 'root',
          database : 'phenglei'
        });
        connection.connect();
        connection.query(addSql,addSqlParams,function (err, result) {
            if(err){
                console.log('[INSERT ERROR] - ',err.message);
                return;
            }        
         console.log("插入成功")
         
    });
     
    connection.end();
}


const testGETMaxId = (sql, values) => {
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
                    results
                });
            }
    });
    })
};



const testInsertPersonParam = (addSql, addSqlParams) => {
    var mysql      = require('mysql');
    var connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : 'root',
      database : 'phenglei'
    });
    connection.connect();
    for (let i = 0; i < addSqlParams.length; i++) {
        connection.query(addSql,addSqlParams[i],function (err, result) {
            if(err){
                console.log('[INSERT ERROR] - ',err.message);
                return;
                    }        
                console.log("插入成功")
        });
    }

 
connection.end();
}


const updateProducts = (updateSql, updateSqlParams) => {
    var mysql      = require('mysql');
    var connection = mysql.createConnection({
      host     : 'localhost',
      user     : 'root',
      password : 'root',
      database : 'phenglei'
    });
    connection.connect();
    connection.query(updateSql,updateSqlParams,function (err, result) {
        if(err){
         console.log('[INSERT ERROR] - ',err.message);
         return;
        }        
        console.log("更新成功")
      
        });
    
 
connection.end();
}

module.exports = { testQuery, testInsertProduct, testInsertPersonParam,
    testGETMaxId, updateProducts };