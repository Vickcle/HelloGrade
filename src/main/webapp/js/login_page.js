//常用的元素获取
var $v_name = $("#username");
var $v_pwd = $("#userpwd");
//验证码
//设置一个全局的变量，便于保存验证码
var code;
function createCode(){
    //首先默认code为空字符串
    code = '';
    //设置长度，这里看需求，我这里设置了4
    var codeLength = 4;
    var codeV = document.getElementById('code');
    //设置随机字符
    var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
    //循环codeLength 我设置的4就是循环4次
    for(var i = 0; i < codeLength; i++){
        //设置随机数范围,这设置为0 ~ 36
        var index = Math.floor(Math.random()*36);
        //字符串拼接 将每次随机的字符 进行拼接
        code += random[index];
    }
    //将拼接好的字符串赋值给展示的Value
    codeV.value = code;
}

//下面就是判断是否== 的代码
function validate(){
    var oValue = document.getElementById('input').value.toUpperCase();
    if(oValue ===0){
        alert('请输入验证码');
        createCode();
        return false;
    }else if(oValue != code){
        alert('验证码不正确，请重新输入');
        oValue = ' ';
        createCode();
        return false;
    }else{
        return true;
    }
}

//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
window.onload = function (){
    createCode();
}
//登录按钮事件
var $login_btn = $(body).find(".login-button");
$login_btn.click(function(){

    if(validate()){
        userlogin();
    }
});
//重置按钮事件
// var $reset_button = $(body).find(".reset-button");
// $reset_button.click(function(){
//     $v_name.val("");
//     $v_pwd.val("");
//     $v_identity.val(1);
//     $("#input").val("");
//     createCode();
// });

//登录函数
function  userlogin() {
    //获取登录需要的全部信息
    //获取用户名，密码，身份
    var $v_identity = $('.div-radio input[name="identity"]:checked ');
    var username = $v_name.val();
    var password = $v_pwd.val();
    var identity = $v_identity.val();
    $.ajax({
        url:'/login',
        type:'POST',
        async:true,
        data:{
            name:username,
            password:password,
            usertype:identity,
        },
        timeout:5000,
        dataType:'json',
        success:function(data){
            if(data['state'] == 1)
            //重载界面刷新数据
            //window.location.reload();
                window.location.href = "/admin_main";
            else if(data['state'] == 2){
                window.location.href = "/teacher_main";
               // alert("账号或密码错误！请重新输入");
            }else if(data['state'] == 3){
                window.location.href = "/student_main";
            }else{
                window.confirm("密码有误，或其他错误");
            }
        },
        error:function(){
            alert("目标不存在，请稍后重试！");
        }
    });
}
//简单检验，正则
function val_length(str) {
    if (str===undefined){
        return false;
    }else if (str.length>20){
        return false;
    }else if (str.length<6){
        return false;
    }else{
        return true;
    }
}
//验证账号特性

//验证密码特性