<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="teacher" class="com.vickcle.model.Teacher" scope="request" />
<html>
<head>
	<title>学生成绩管理及分析平台-教师平台</title>
</head>
<meta charset="utf-8">
<meta name="keywords" value ="firstpage,login">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body id = "body">
<div>
	<jsp:include page="teacher_head.jsp"/>
	<div class="col-md-2 "><jsp:include page="teacher_menu.jsp"/>
		<div class="col-md-9 col-md-offset-1">
			更改教师信息：
			<br>
			<div class="col-md-offset-1">
				<table class="show_info" border="1">
					<sf:form method="post" modelAttribute="teacher"
							 action="${pageContext.request.contextPath }/update_teacher_password_database">
						<sf:input path="teacher_id" type="hidden"/>
						<div class="div-jan"><sf:input path="teacher_code" type="hidden"/></div>
						<div class="div-jan"><sf:input path="teacher_name" type="hidden"/></div>
						<div class="div-jan"><sf:input path="teacher_pwd" type="hidden"/></div>
						<div class="div-jan">旧的密码:<input type="password" name = "old_password"></div><br>
						<div class="div-jan">新的密码:<input type="password" name = "new_password"></div><br>
						<div class="div-jan">确认密码:<input type="password" name = "confirm_password"></div><br>
						<input type="submit" id="submit_change" value="修改" class="update btn btn-info">
					</sf:form>
				</table>
			</div>
		</div>
	</div>
</body>
<style type="text/css">
	.update{
		padding: 6px 12px;
		margin-bottom: 0;
		font-size: 14px;
		font-weight: 400;
		text-align: center;
		border: 1px solid transparent;
		border-radius: 4px;
		width: 250px;
	}
	.div-jan{
		margin-top: 13px;
	}
	.div-jan input{
		margin-left: 10px;
	}
</style>
<script type="text/javascript" >
    <%--$("#submit_change").click(function () {--%>
    <%--var password = "${teacher.teacher_pwd}";--%>
    <%--var old_password = $('.div-jan input[name="old_password"]').val();--%>
    <%--var new_password = $('.div-jan input[name="old_password"]').val();--%>
    <%--var confirm_password = $('.div-jan input[name="old_password"]').val();--%>
    <%--window.location.href = "/teacher_main";--%>
    <%--});--%>
</script>
</html>
