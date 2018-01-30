// DB
var mysql = require('mysql');
var connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '123456',
  database: 'physics_lab'
});

connection.connect(function (error) {
    if (error) {
        console.log(error);
        console.log('Connect unsuccessfully!');
        return;
    }
    console.log('Connect successfully!');
})