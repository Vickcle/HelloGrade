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
<jsp:useBean id="company" class="com.vickcle.model.Company" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        填写企业信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="company"
                     action="${pageContext.request.contextPath }/add_company_database">
                <div class="div-jan">公司编号:<sf:input path="company_code"/></div>
                <sf:errors path="company_code" cssClass="error"></sf:errors><br>
                <div class="div-jan">公司名称:<sf:input path="company_name"/></div>
                <sf:errors path="company_name" cssClass="error"></sf:errors><br>
                <div class="div-jan">公司类型:<sf:input path="company_type"/></div>
                <sf:errors path="company_type" cssClass="error"></sf:errors><br>
                <div class="div-jan">公司地址:<sf:input path="company_address"/></div>
                <sf:errors path="company_address" cssClass="error"></sf:errors><br>
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
