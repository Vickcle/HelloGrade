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
<jsp:useBean id="course" class="com.vickcle.model.Course" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        填写课程信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="course"
                     action="${pageContext.request.contextPath }/add_course_database">
                <div class="div-jan">课程编号:<sf:input path="course_code"/></div>
                <sf:errors path="course_code" cssClass="error"></sf:errors><br>
                <div class="div-jan">课程名称:<sf:input path="course_name"/></div>
                <sf:errors path="course_name" cssClass="error"></sf:errors><br>
                <div class="div-jan">课程学分:<sf:input path="course_degree"/></div>
                <sf:errors path="course_degree" cssClass="error"></sf:errors><br>
                <div class="div-jan">课程学时:<sf:input path="course_time"/></div>
                <sf:errors path="course_time" cssClass="error"></sf:errors><br>
                <div class="div-jan">课程属性:
                    <sf:select id="lesson_duration" class="select" style="margin-left:6px;width:178px;height:25px;" path="course_type">
                        <sf:option  value="必修">必修</sf:option>
                        <sf:option  value="选修">选修</sf:option>
                    </sf:select>
                </div>
                <sf:errors path="course_type" cssClass="error"></sf:errors><br>
                <div class="div-jan">课程性质:
                    <sf:select id="lesson_duration" class="select" style="margin-left:6px;width:178px;height:25px;" path="course_property">
                        <sf:option  value="通识教育平台课">通识教育平台课</sf:option>
                        <sf:option  value="学科基础平台课">学科基础平台课</sf:option>
                        <sf:option  value="体测">体测</sf:option>
                        <sf:option  value="实践教学环节">实践教学环节</sf:option>
                        <sf:option  value="专业核心课">专业核心课</sf:option>
                        <sf:option  value="通识教育选修课">通识教育选修课</sf:option>
                        <sf:option  value="专业任选课">专业任选课</sf:option>
                        <sf:option  value="专业方向课">专业方向课</sf:option>
                    </sf:select>
                </div>
                <sf:errors path="course_property" cssClass="error"></sf:errors><br>
                <input type="submit" vlaue="增加" class="update btn btn-info">
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
