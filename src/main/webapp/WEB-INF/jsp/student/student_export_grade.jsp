<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/25
  Time: 12:48
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
            url:'/student_query_teacher_term',
            type:'POST',
            async:true,
            data:{
                current_page:1,
                page_size: 10
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
            {   field:'grade_id',
                title: '序号',
                align: 'center',
                valign: 'bottom',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'lesson_duration', title: '学期',},
            {field: 'course_code', title: '课程编号', sortable: true},
            {field: 'course_name', title: '课程名称',},
            {field: 'grade_total', title: '成绩',},
            {field: 'course_degree', title: '课程学分', },
            {field: 'course_time', title: '课程学时', },
            {field: 'course_type', title: '课程类型', },
            {field: 'course_property', title: '课程性质', },
        ];
        $('#tableL01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL01').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data, //通过ajax返回的数据
            width:300,
            height:400,
            method: 'get',
            pageSize: 10,
            pageNumber: 1,
            pageList: [],
            cache: false,
            striped: true,
            pagination: true,
            sidePagination: 'client',
            search: false,
            showRefresh: false,
            showExport: true,                     //是否显示导出
            exportDataType: "all",
            exportTypes:['excel','txt'],  //导出文件类型，[ 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf']
            buttonsAlign:"right",  //按钮位置
            Icons:'glyphicon-export',
            // exportButton: $('#btn_export'),     //为按钮btn_export  绑定导出事件  自定义导出按钮(可以不用)
            exportOptions:{
                //ignoreColumn: [0,0],            //忽略某一列的索引
                ignoreColumn: [0,0],  //忽略某一列的索引
                fileName: '成绩信息报表',  //文件名称设置
                worksheetName: 'sheet1',  //表格工作区名称
                tableName: '成绩信息报表',
                excelstyles: ['background-color', 'color', 'font-size', 'font-weight']
                //onMsoNumberFormat: DoOnMsoNumberFormat,
            }
        });
    }



    //转到查看界面

</script>
</html>
