
//植入常用函数进行校验
//校验EMail
function checkIsEMail(s) {
    var pattern = /^([0-9A-Za-z\-_\.]+)@([0-9A-Za-z]+\.[A-Za-z]{2,3}(\.[A-Za-z]{2})?)$/g;
    if (!pattern.exec(s)) {
        return false;
    }
    return true;
}

//校验手机号码
function checkIsMobil(s) {
    var pattern = /^0?(13[0-9]|15[012356789]|18[0236789]|14[57])[0-9]{8}$/;
    if (!pattern.exec(s)){
        return false;
    }
    return true;
}

//一般性校验，空值及长度

function checkNaN(s) {
    if(s == '')
        return false;
    if(s.length>20){
        return false;
    }
    return true;
}

//数字或者字母，4-10位
function checkIsTrueName(s) {
    var pattern = /^[0-9a-zA-Z]{4,10}$/;
    return pattern.test(s);
}