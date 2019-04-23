<%--
  Created by IntelliJ IDEA.
  User: Rainard
  Date: 2019/4/15
  Time: 13:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="teacher" class="com.vickcle.model.Teacher" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-9 col-md-offset-1" style="float: left;">
    <div class="container col-md-12">
        填写教师信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="teacher"
                     action="${pageContext.request.contextPath }/add_teacher_database">
                <div class="div-jan">教师工号:<sf:input path="teacher_code"/></div>
                <sf:errors path="teacher_code" cssClass="error"></sf:errors><br>
                <div class="div-jan">教师姓名:<sf:input path="teacher_name"/></div>
                <sf:errors path="teacher_name" cssClass="error"></sf:errors><br>
                <div class="div-jan">教师电话:<sf:input path="teacher_tel"/></div>
                <sf:errors path="teacher_tel" cssClass="error"></sf:errors><br>
                <div class="div-jan">教师邮箱:<sf:input path="teacher_email"/></div>
                <sf:errors path="teacher_email" cssClass="error"></sf:errors><br>
                <div class="div-jan">教师职称:<sf:input path="teacher_honor"/></div>
                <sf:errors path="teacher_honor" cssClass="error"></sf:errors><br>
                <input type="submit" value="增加" class="update btn btn-info">
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
