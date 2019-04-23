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
<jsp:useBean id="major" class="com.vickcle.model.Major" scope="request" />
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
                    <th>专业编号</th>
                    <th>专业名称</th>
                    <th>专业类型</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead><tbody>
            <% int num = 0 ;%>
            <c:forEach items="${list}" var="major" >
                <tr>
                    <% num = num + 1 ;
                        out.print("<td>"+ num +"</td>");
                    %>
                    <td>${major.major_code}</td>
                    <td>${major.major_name}</td>
                    <td>${major.major_type}</td>
                    <td><a href="${pageContext.request.contextPath}/admin_update_major?major_id=${ major.major_id}">修改</a></td>
                    <td><a href="${pageContext.request.contextPath}/delete_major_database?major_id=${ major.major_id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            </table>

        </div>
    </div>
</div>
</body>

</html>