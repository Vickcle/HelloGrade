<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>首页-登录</title>
</head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\login_page.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}\img\title.ico" type="image/x-icon" />
<body id="body">
	<div class="dv_body">
		<div class="dv_login">
			<div class="dv_title">
				<span id="label">登录</span>
			</div>
			<!--用户名填写-->
			<div class="dv_name">
				<div class="login-center-img"><img src="${pageContext.request.contextPath}/img/name.png"/></div>
				<div class="login-center-input">
					<input id="username" type="text" name="" value="" placeholder="请输入您的用户名" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的用户名'"/>
					<div class="login-center-input-text">用户名</div>
					<div id="myAlert1" class="alert alert-success" >
						<strong>用户账号有误</strong>请重新输入！
					</div>
				</div>
			</div>
			<!--密码填写-->
			<div class="dv_pwd">
				<div class="login-center-img"><img src="${pageContext.request.contextPath}/img/password.png"/></div>
				<div class="login-center-input">
					<input id="userpwd" type="text" name="" value="" placeholder="请输入您的密码" onfocus="this.placeholder=''" onblur="this.placeholder='请输入您的密码'"/>
					<div class="login-center-input-text">密码</div>
					<div id="myAlert2" class="alert alert-success" >
						<strong>密码有误</strong>请重新输入！
					</div>
				</div>
			</div>
			<!--单选框-->
			<div class="div-radio">
				<input  type="radio" name="identity" value="1" checked>管理员
				<input  type="radio" name="identity" value="2">教师
				<input  type="radio" name="identity" value="3">学生
			</div>
			<!--验证码-->
			<div class="div-check">
				<input type = "text" id = "input" value="" />  
				<input type = "button" id="code" onclick="createCode()"/>
			</div>
			<!--按钮-->
			<div>
				<div class="login-button">
					登录
				</div>
				<div class="reset-button">
					重置
				</div>
			</div>
		</div>
	</div>
</body>
<script src="${pageContext.request.contextPath}\js\jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\jquery.mousewheel.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\login_page.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}\js\check_input.js" type="text/javascript"></script>
<script type="text/javascript" >
	$("#myAlert1").hide();
    $("#myAlert2").hide();
//失去焦点事件：

	// function checkIsTrueName(s) {
	// 	var pattern = /^[0-9a-zA-Z]{4,10}$/;
	// 	return pattern.test(s);
	// }

	$("#username").blur(function () {
		var username = $("input[id='username']").val();
        if(checkIsTrueName(username)){
            $("#myAlert1").hide();
		}else{
            $("#myAlert1").show();
        };
    });

    $("#userpwd").blur(function () {
        var username = $("input[id='userpwd']").val();
        if(checkIsTrueName(username)){
            $("#myAlert2").hide();
        }else{
            $("#myAlert2").show();
        };
    });
</script>
</html>
