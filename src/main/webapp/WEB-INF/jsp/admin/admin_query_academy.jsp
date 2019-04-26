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
<jsp:useBean id="academy" class="com.vickcle.model.Academy" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-10">
            <table class="table table-condensed" id="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学校编号</th>
                    <th>学校名称</th>
                    <th>学校地址</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead><tbody>
            <% int num = 0 ;%>
            <c:forEach items="${list}" var="academy" >
                <tr>
                    <% num = num + 1 ;
                        out.print("<td>"+ num +"</td>");
                    %>
                    <td>${academy.academy_code}</td>
                    <td>${academy.academy_name}</td>
                    <td>${academy.academy_address}</td>
                    <td><a href="${pageContext.request.contextPath}/admin_update_academy?academy_id=${ academy.academy_id}">修改</a></td>
                    <td><a href="${pageContext.request.contextPath}/delete_academy_database?academy_id=${ academy.academy_id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            </table>

        </div>
    </div>
</div>
</body>

</html>
