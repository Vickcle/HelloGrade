<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="course" class="com.vickcle.model.Course" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2"><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <table class="table" id="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>课程编号</th>
                    <th>课程名称</th>
                    <th>课程学分</th>
                    <th>课程学时</th>
                    <th>课程属性</th>
                    <th>课程性质</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead><tbody>
            <% int num = 0 ;%>
            <c:forEach items="${list}" var="course" >
                <tr>
                    <% num = num + 1 ;
                        out.print("<td>"+ num +"</td>");
                    %>
                    <td>${course.course_code}</td>
                    <td>${course.course_name}</td>
                    <td>${course.course_degree}</td>
                    <td>${course.course_time}</td>
                    <td>${course.course_type}</td>
                    <td>${course.course_property}</td>
                    <td><a href="${pageContext.request.contextPath}/admin_update_course?course_id=${ course.course_id}">修改</a></td>
                    <td><a href="${pageContext.request.contextPath}/delete_course_database?course_id=${ course.course_id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            </table>
        </div>
    </div>
</div>
</body>

</html>
