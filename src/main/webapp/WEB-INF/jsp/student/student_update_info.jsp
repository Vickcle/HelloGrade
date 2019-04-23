<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="student" class="com.vickcle.model.Student" scope="request" />
<html>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\login_page.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}\img\title.ico" type="image/x-icon" />
<body>
<jsp:include page="student_head.jsp"/>
<div class="col-md-2"><jsp:include page="student_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10 col-md-offset-1">
        更改个人信息：
        <br>
        <table class="show_info" border="1">
            <sf:form method="post" modelAttribute="student"
                     action="${pageContext.request.contextPath }/update_info_database">
                <sf:input path="student_id" type="hidden"/>
                <div class="div-jan">学生学号:<sf:input path="student_code" readonly="true"/></div>
                <sf:errors path="student_code" cssClass="error"></sf:errors><br>
                <div class="div-jan">学生姓名:<sf:input path="student_name" readonly="true"/></div>
                <sf:errors path="student_name" cssClass="error"></sf:errors><br>
                <div class="div-jan">学生电话:<sf:input path="student_tel"/></div>
                <sf:errors path="student_tel" cssClass="error"></sf:errors><br>
                <div class="div-jan">学生邮箱:<sf:input path="student_email"/></div>
                <sf:errors path="student_email" cssClass="error"></sf:errors><br>
                <div class="div-jan">学生住址:<sf:input path="student_address"/></div>
                <sf:errors path="student_address" cssClass="error"></sf:errors><br>
                <input type="submit" value="修改" class="update btn btn-info">
            </sf:form>
        </table>
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
</html>

