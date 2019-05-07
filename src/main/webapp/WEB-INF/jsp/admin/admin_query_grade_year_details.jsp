<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/05/07
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\xcConfirm.css">
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2"><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <table class="table" id="tableL01"></table>
            <div id="myConfirm"></div>

        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}\js\jquery.base64.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\xcConfirm.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\base64.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\tableExport.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-export.js" type="text/javascript" ></script>

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

        $.ajax({
            url:'/get_personal_year_grade',
            type:'POST',
            async:true,
            data:{
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
            {
                title: '序号',
                align: 'center',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'student_code', title: '学号', sortable: true},
            {field: 'student_name', title: '姓名', },
            {field: 'class_name', title: '班级'},
            {field: 'course_code', title: '课程编号'},
            {field: 'course_name', title: '课程名称'},
            {field: 'grade_total', title: '课程成绩', sortable: true},
            {field: 'lesson_duration', title: '学期',},
        ];
        $('#tableL01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL01').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data, //通过ajax返回的数据
            width:300,
            height:400,
            dataType: "json",
            method: 'get',
            pageSize: 5,
            pageNumber: 1,
            toolbar: '#toolbar',
            cache: false,
            striped: true,
            pagination: true,
            sidePagination: 'client',
            pageList: [3 ,5 ,7 ],
            showColumns: false,
            onDblClickRow: function (row) {
                $.ajax({
                    url:'/save_school_year_details',
                    type:'POST',
                    async:true,
                    data:{
                        student_code:row.student_code,
                        student_name:row.student_name,
                        class_name:row.class_name,
                        school_year:row.school_year,
                    },
                    timeout:5000,
                    dataType:'json',
                    success:function(data){
                        var str = data["data"];

                            window.location.href = "/admin_query_year_details";

                    },
                    error:function(){
                        alert("请求失败");
                    }
                });
            }
        });
    }

    $("#search_btn").click(function () {
        getGradeInfo();
    });

</script>
</html>