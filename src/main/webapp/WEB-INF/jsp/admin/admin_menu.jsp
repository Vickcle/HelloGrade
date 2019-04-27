<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>学生成绩管理及分析平台-管理员后台</title>
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
                <a href="#systemSchool" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    学校管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemSchool" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_school"><i class="glyphicon glyphicon-user"></i>查询学校</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_school"><i class="glyphicon glyphicon-th-list"></i>增加学校</a></li>
                </ul>
            </li>
            <li>
                <a href="#systemAcademy" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    学院管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemAcademy" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_academy"><i class="glyphicon glyphicon-user"></i>查询学院</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_academy"><i class="glyphicon glyphicon-th-list"></i>增加学院</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemMajor" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    专业管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemMajor" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_major"><i class="glyphicon glyphicon-user"></i>查询专业</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_major"><i class="glyphicon glyphicon-th-list"></i>增加专业</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemClass" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    班级管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemClass" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_class"><i class="glyphicon glyphicon-user"></i>查询班级</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_class"><i class="glyphicon glyphicon-th-list"></i>增加班级</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemStudent" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-cog"></i>
                    学生管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemStudent" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_student"><i class="glyphicon glyphicon-user"></i>查询学生</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_student"><i class="glyphicon glyphicon-th-list"></i>增加学生</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_import_student"><i class="glyphicon glyphicon-edit"></i>学生读入</a></li>
                </ul>
            </li>
            <li>
                <a href="#systemTeacher" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-credit-card"></i>
                    教师管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemTeacher" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_teacher"><i class="glyphicon glyphicon-user"></i>查询教师</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_teacher"><i class="glyphicon glyphicon-th-list"></i>增加教师</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_import_teacher"><i class="glyphicon glyphicon-edit"></i>读入文件</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_export_teacher"><i class="glyphicon glyphicon-edit"></i>导出文件</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemCourse" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-globe"></i>
                    课程管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemCourse" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_course"><i class="glyphicon glyphicon-user"></i>查询课程</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_course"><i class="glyphicon glyphicon-th-list"></i>增加课程</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_import_course"><i class="glyphicon glyphicon-edit"></i>读入文件</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemGrade" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-calendar"></i>
                    成绩管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemGrade" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_grade"><i class="glyphicon glyphicon-user"></i>查询成绩</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_grade"><i class="glyphicon glyphicon-th-list"></i>增加成绩</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_import_grade"><i class="glyphicon glyphicon-edit"></i>读入文件</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_export_grade"><i class="glyphicon glyphicon-edit"></i>导出文件</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemCompany" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-fire"></i>
                    就业单位管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemCompany" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_company"><i class="glyphicon glyphicon-user"></i>查询就业单位</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_company"><i class="glyphicon glyphicon-th-list"></i>增加就业单位</a></li>
                </ul>
            </li>

            <li>
                <a href="#systemCreer" class="nav-header collapsed" data-toggle="collapse">
                    <i class="glyphicon glyphicon-fire"></i>
                    就业管理
                    <span class="pull-right glyphicon glyphicon-chevron-down"></span>
                </a>
                <ul id="systemCreer" class="nav nav-list collapse secondmenu" style="height: 0px;">
                    <li><a href="${pageContext.request.contextPath}/admin_query_creer"><i class="glyphicon glyphicon-user"></i>查询就业</a></li>
                    <li><a href="${pageContext.request.contextPath}/admin_add_creer"><i class="glyphicon glyphicon-th-list"></i>增加就业</a></li>
                </ul>
            </li>
        </ul>
        <!--主页位置，需要用到栅格系统-->
    </div>
</div>
</div>
</body>
<script src="${pageContext.request.contextPath}\js\jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\jquery.mousewheel.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap.min.js" type="text/javascript" ></script>
<script type="text/javascript" >
</script>
</html>
