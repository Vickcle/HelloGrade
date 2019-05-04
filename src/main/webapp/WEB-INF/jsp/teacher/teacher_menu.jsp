<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生成绩管理及分析平台-教师平台</title>
</head>
<meta charset="utf-8">
<meta name="keywords" value ="firstpage,login">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin_main.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body id = "body">
<div class="container-fluid">
    <div class="row ">
        <ul id="main-nav" class="nav nav-tabs nav-stacked" style="">
            <li class="active">
                <a href="#">
                    <i class="glyphicon glyphicon-th-large"></i>
                    首页
                </a>
            </li>
            <li>
                <a href="#systemPersonInfo" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    个人信息维护
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemPersonInfo" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/teacher_update_password"><i class="glyphicon glyphicon-user"></i>修改登录密码</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher_update_info"><i class="glyphicon glyphicon-th-list"></i>修改个人信息</a></li>
                </ul>
            </li>
            <li>
                <a href="#systemStudent" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-credit-card"></i>
                    学生信息查询
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemStudent" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="#"><i class="glyphicon glyphicon-user"></i>查询学生信息</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemCourse" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-globe"></i>
                    学生成绩管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemCourse" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/teacher_query_grade_fields"><i class="glyphicon glyphicon-user"></i>学生成绩查询</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher_add_grade"><i class="glyphicon glyphicon-th-list"></i>增加成绩信息</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher_import_grade"><i class="glyphicon glyphicon-edit"></i>学生成绩导入</a></li>
                    <li><a href="${pageContext.request.contextPath}/"><i class="glyphicon glyphicon-edit"></i>学生成绩导出</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemGrade" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-calendar"></i>
                    学生成绩查询
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemGrade" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/teacher_query_grade_fields"><i class="glyphicon glyphicon-user"></i>查询个人成绩</a></li>
                    <li><a href="${pageContext.request.contextPath}/teacher_query_class_grade"><i class="glyphicon glyphicon-th-list"></i>查询班级成绩</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemCreer" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-fire"></i>
                    学生就业查询
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemCreer" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="#"><i class="glyphicon glyphicon-user"></i>查询就业信息</a></li>
                </ul>
            </li>
        </ul>

        <!--主页位置，需要用到栅格系统-->
    </div>
</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/js/jquery.mousewheel.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript" ></script>
<script type="text/javascript" >
</script>
</html>
