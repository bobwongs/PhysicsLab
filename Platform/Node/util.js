
export function createResponseObject(code, msg) {
    var resObject = {};
    code.responseCode = code;
    code.responseMsg = msg;
    return resObject;
}

// To Do: 异步回调方法的创建
export function checkAccountExisted(account, connection, success, failure) {
    let querySql = `select account from ${userInfoTable} where account='${account}'`;
    connection.query(querySql, function(error, results, fields) {
        if (results && results.length > 0) {            
            failure();
            return;
        }
        success();
    }
}