<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="gradeObject" class="com.vickcle.model.GradeObject" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\xcConfirm.css">
<body>
<jsp:include page="student_head.jsp"/>
<div class="col-md-2"><jsp:include page="student_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">教师姓名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="teacher_name"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">课程名称：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="course_name"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-9">
                        <button class="btn btn-primary" style="width: 190px;margin-top: 10px;margin-left:18px;" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table class="table" id="tableL01"></table>
            <div id="myConfirm"></div>

        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}\js\jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\jquery.mousewheel.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\xcConfirm.js" type="text/javascript" ></script>
<script>
    //全局变量：已有数据：
    //先清空数据
    //准备表头数据：


    //预加载事件
    $(function(){
        getGradeInfo();
    });
    //ajax请求数据：
    function getGradeInfo(){
        var teacher_name =  $("input[id='teacher_name']").val();
        var course_name =$("input[id='course_name']").val();
        $.ajax({
            url:'/student_query_teacher_term',
            type:'POST',
            async:true,
            data:{
                current_page:1,
                page_size: 10,
                lesson_duration:teacher_name,
                course_name:course_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var gradeObjects = data["data"];
                var str = JSON.stringify(gradeObjects);
                pushTableInfo(str);
            },
            error:function(){

            }
        });
    }

    function pushTableInfo(datas) {
        var data = JSON.parse(datas);
        var tableColumns = [
            {field: 'course_code', title: '课程编号', sortable: true},
            {field: 'course_name', title: '课程名称',},
            {field: 'teacher_name', title: '教师姓名', },
            {field: 'lesson_duration', title: '学期',},
            {field: 'grade_test', title: '实验成绩', sortable: true},
            {field: 'grade_usual', title: '平时成绩', sortable: true},
            {field: 'grade_interim', title: '期中成绩', sortable: true},
            {field: 'grade_terminal', title: '期末成绩', sortable: true},
            {field: 'grade_total', title: '总成绩', sortable: true},
        ];
        $('#tableL01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL01').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data, //通过ajax返回的数据
            width:300,
            height:400,
            method: 'get',
            pageSize: 6,
            pageNumber: 1,
            pageList: [],
            cache: false,
            striped: true,
            pagination: true,
            sidePagination: 'client',
            search: false,
            showRefresh: false,
            showExport: false,
            showFooter: true,
            // exportTypes: ['csv', 'txt', 'xml'],
            clickToSelect: true,
        });
    }

    $("#search_btn").click(function () {
        getGradeInfo();
    });


    //转到查看界面

</script>
</html>
