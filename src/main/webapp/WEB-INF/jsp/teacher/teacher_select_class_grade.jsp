<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/5/2
  Time: 11:12
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
<jsp:include page="teacher_head.jsp"/>
<div class="col-md-2"><jsp:include page="teacher_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div>
            导出当前数据
            <button id="download_btn" class="btn btn-info">从服务器导出</button>
        </div>
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
        var myArray = ${list};
        var data = myArray["data"];
        var str = JSON.stringify(data);
        pushTableInfo(str);
    });
    //ajax请求数据：

    function pushTableInfo(datas) {
        var data = JSON.parse(datas);
        var tableColumns = [
            {
                title: '序号',
                align: 'center',
                valign: 'bottom',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'student_code', title: '学号', sortable: true},
            {field: 'student_name', title: '姓名', },
            {field: 'class_name', title: '班级', },
            {field: 'course_name', title: '课程名称'},
            {field: 'grade_test', title: '实验成绩', sortable: true},
            {field: 'grade_usual', title: '平时成绩', sortable: true},
            {field: 'grade_interim', title: '期中成绩', sortable: true},
            {field: 'grade_terminal', title: '期末成绩', sortable: true},
            {field: 'grade_total', title: '总成绩', sortable: true},
            {
                field: 'grade_id',
                title: '操作',
                width: 120,
                align: 'center',
                valign: 'middle',
                formatter: actionFormatter,
            }
        ];
        $('#tableL01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格


        $('#tableL01').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data, //通过ajax返回的数据
            width:300,
            height:500,
            method: 'get',
            pageSize: 5,
            pageNumber: 1,
            pageList: [5,7,10],
            cache: false,
            striped: true,
            pagination: true,
            // exportTypes: ['csv', 'txt', 'xml'],
            showColumns: false,
            search: false,
            showRefresh: true,
            showFooter: true,
            clickToSelect: true,
            showExport: true,                     //是否显示导出
            exportDataType: "all",
            exportTypes:['excel'],  //导出文件类型，[ 'csv', 'txt', 'sql', 'doc', 'excel', 'xlsx', 'pdf']
            buttonsAlign:"right",  //按钮位置
            Icons:'glyphicon-export',
            // exportButton: $('#btn_export'),     //为按钮btn_export  绑定导出事件  自定义导出按钮(可以不用)
            exportOptions:{
                //ignoreColumn: [0,0],            //忽略某一列的索引
                ignoreColumn: [10],  //忽略某一列的索引
                fileName: '成绩信息报表',  //文件名称设置
                worksheetName: 'sheet1',  //表格工作区名称
                tableName: '成绩信息报表',
                excelstyles: ['background-color', 'color', 'font-size', 'font-weight']
                //onMsoNumberFormat: DoOnMsoNumberFormat,
            }
        });
    }

    function actionFormatter(value, row, index) {
        var id = value;
        var result = "";
        result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"EditViewById('" + id + "', view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"EditViewById('" + id + "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"DeleteById('" + id + "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
        return result;
    }

    //转到查看界面
    function EditViewById(id){
        console.log("edit"+id);
    }
    //进行删除操作
    function DeleteById(id) {
        var txt=  "确认删除此条记录？";
        var option = {
            title: "提示：",
            btn: parseInt("0011",2),
            onOk: function(){
                window.location.href = "/teacher_delete_grade_database?grade_id="+id;
            }
        }
        window.wxc.xcConfirm(txt, "custom", option);
    }
    
    $("#download_btn").click(function () {
        window.location.href = "/download_class_grade_info";
    });
</script>
</html>
