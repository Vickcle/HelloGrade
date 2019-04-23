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
<jsp:useBean id="student" class="com.vickcle.model.Student" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 col-md-offset-1"><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-9" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-10">
            <table class="table table-condensed" id="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>学生电话</th>
                    <th>学生邮箱</th>
                    <th>学生住址</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead><tbody>
            <% int num = 0 ;%>
            <c:forEach items="${list}" var="student" >
                <tr>
                    <% num = num + 1 ;
                        out.print("<td>"+ num +"</td>");
                    %>
                    <td>${student.student_code}</td>
                    <td>${student.student_name}</td>
                    <td>${student.student_tel}</td>
                    <td>${student.student_email}</td>
                    <td>${student.student_address}</td>
                    <td><a href="${pageContext.request.contextPath}/admin_update_student?student_id=${ student.student_id}">修改</a></td>
                    <td><a href="${pageContext.request.contextPath}/delete_student_database?student_id=${ student.student_id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            </table>

        </div>
    </div>
</div>
</body>

</html>
