import * as myUtil from 'util';

let createResponseObject = myUtil.createResponseObject;

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

    // If you using the node-mysql module, just remove the .connect and .end. Just solved the problem myself. Apparently they pushed in unnecessary code in their last iteration that is also bugged. You don't need to connect if you have already ran the createConnection call
    // 移除connect()方法，避免第二次请求时的报错
    // connection.connect();
    let querySql = `select * from ${userInfoTable} where account='${account}'`;
    console.log('query sql: ' + querySql);
    connection.query(querySql, function(error, results, fields) {
        var resObject;
        if (!results || results.length == 0) {
            resObject = createResponseObject(2000, 'Invalid Account');
            res.json(resMsg);
            return;
        }

        if (password === results[0].password) {
            resObject = createResponseObject(0, 'Login successfully');
        } else {
            resObject = createResponseObject(2001, 'Incorrect Password');
        }
        res.json(resObject);
    });
});

app.post('/account/logout', function (req, res) {
    res.send('logout successfully!');
});

app.post('/account/register', function (req, res) {
    let body = req.body;
    console.log('register body: ' + JSON.stringify(body));
    let account = body.account;
    var resObject;

    // Check whether account is register
    let querySql = `select account from ${userInfoTable} where account='${account}'`;
    connection.query(querySql, function(error, results, fields) {
        if (results && results.length > 0) {
            resObject = createResponseObject(2100, 'Account is already existed');
            res.json(resObject);
            return;
        }

        // Check the user input whether is valid
        let password = body.password;
        let email = body.email;

        // Insert data
        let insertSql = `insert into user_info
                        (account, password, email)
                        -> values
                        -> ('${account}', '${password}', '${email}');`;
        connection.query(insertSql, function (error, result) {
            if (error) {
                resObject = createResponseObject(1000, error.message);
                res.json(resObject);
                return;
            }
            resObject = createResponseObject(0, 'Register successfully');
            res.json(resObject);
        });
    })
});

app.post('/account/forgetPassword', function (req, res) {
    res.send('forgetPassword successfully!');

});

var server = app.listen(8081, function() {
    var host = server.address().address;
    var port = server.address().port;
    console.log('Access address: http://%s:%s', host, port);
});
