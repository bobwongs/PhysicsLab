// DB
let mysql = require('mysql');
let connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'physics_lab'
});

let userInfoTable = 'user_info';

var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.json());  // for parsing application/json

app.post('/account/login', function (req, res) {
    let body = req.body;
    let account = body.account, password = body.password;
    console.log('request body: ' + body);
    var resMsg = {};

    // If you using the node-mysql module, just remove the .connect and .end. Just solved the problem myself. Apparently they pushed in unnecessary code in their last iteration that is also bugged. You don't need to connect if you have already ran the createConnection call
    // 移除connect()方法，避免第二次请求时的报错
    // connection.connect();
    let querySql = `select * from ${userInfoTable} where account='${account}'`;
    console.log('query sql: ' + querySql);
    connection.query(querySql, function(error, results, fields) {
        // if (error) throw error;
        if (!results || results.length == 0) {
            resMsg.responseCode = '10001';
            resMsg.responseMsg = 'Invalid Account';
            res.json(resMsg);
            return;
        }

        if (password === results[0].password) {
            resMsg.responseCode = '0';
            resMsg.responseMsg = 'Login successfully!';
        } else {
            resMsg.responseCode = '10000';
            resMsg.responseMsg = 'Incorrect Password';
        }
        res.json(resMsg);
    });
    // connection.end();
});

app.post('/account/logout', function (req, res) {
    res.send('logout successfully!');
});

app.post('/account/register', function (req, res) {
    res.send('Register successfully!');
});

app.post('/account/forgetPassword', function (req, res) {
    res.send('forgetPassword successfully!');
});

var server = app.listen(8081, function() {
    var host = server.address().address;
    var port = server.address().port;
    console.log('Access address: http://%s:%s', host, port);
});