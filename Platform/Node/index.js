var express = require('express');
var app = express();
var bodyParser = require('body-parser');

app.use(bodyParser.json());  // for parsing application/json

// 创建 application/x-www-form-urlencoded 编码解析
// var urlencodedParser = bodyParser.urlencoded({ extended: false })

app.post('/account/login', function (req, res) {
    var body = req.body;
    console.log(req.body);
    console.log('account: %s', body.account);
    console.log('password: %s', body.password);
    // console.log('body json string: %s', JSON.stringify(body));
    // console.log('body: %s', body);
    // res.send('Login successfully!');
    res.json(req.body);
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