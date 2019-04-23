<%--
  Created by IntelliJ IDEA.
  User: Rainard
  Date: 2019/3/7
  Time: 12:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<div class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" id="logo">学生成绩管理及分析平台</a>
            <%
                String user = (String)session.getAttribute("user_name");
                out.print("欢迎您：");
                out.print("<label style='width: 60px;margin-top: 18px; margin-left: 10px; font-size: 14px;'><a href='#'>"+user+"</a></label>");
            %>
            <a href="#" id="jojo">注销</a>
        </div>
    </div>
</div>
</body>
</html>
