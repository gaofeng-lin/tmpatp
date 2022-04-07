const mysql = require('mysql')
const MYSQL_CONFIG = require('./db');

let pools = {};

// 创建连接池
//判断是否存在连接池不用每次都创建
if (!pools.hasOwnProperty('data')) {
    pools['data'] = mysql.createPool(MYSQL_CONFIG);
}

const query = (sql, values) => {
    return new Promise((resolve, reject) => {
            //初始化连接池
            pools['data'].getConnection((err, connection) => {
                    if (err) {
                        console.log(err,'数据库连接失败');
                    }
                    else{
                        console.log('数据库连接成功');
                        //操作数据库
                        connection.query(sql, values, (err, results) => {
                                if (err) {
                                    reject(err);
                                } else {
                                    connection.release();
                                    resolve({
                                        status: 200,
                                        results
                                    });
                                }
                        });
                    }
            })
    });
}

module.exports = { query };