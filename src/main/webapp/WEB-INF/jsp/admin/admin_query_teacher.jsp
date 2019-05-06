<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/18
  Time: 12:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="teacher" class="com.vickcle.model.Teacher" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\xcConfirm.css">
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">工号：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="search_teacher_code"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">姓名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" id="search_teacher_name"/>
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-primary" style="margin-left:89px;" id="search_btn1">查询</button>
                    </div>
                </div>
            </div>
            <table class="table" id="tableL01"></table>
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
    //预加载事件

    $(function(){
        getStudentInfo();
    });



    function getStudentInfo(){
        var teacher_code =  $("input[id='search_teacher_code']").val();
        var teacher_name = $("input[id='search_teacher_name']").val();
        $.ajax({
            url:'/query_teacher_info',
            type:'POST',
            async:true,
            data:{
                teacher_code:teacher_code,
                teacher_name:teacher_name,
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var teachers = data["data"];
                var str = JSON.stringify(teachers);
                pushTable1Info(str);
            },
            error:function(){

            }
        });
    }

    function pushTable1Info(data) {
        var data1 = JSON.parse(data);
        var tableColumns = [
            {
                title: '序号',
                align: 'center',
                valign: 'bottom',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'teacher_code', title: '工号', sortable: true},
            {field: 'teacher_name', title: '教师姓名', },
            {field: 'teacher_tel', title: '电话', },
            {field: 'teacher_email', title: '邮箱', },
            {
                field: 'teacher_id',
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
            data:data1, //通过ajax返回的数据
            width:300,
            height:300,
            dataType: "json",
            method: 'get',
            pageSize: 5,
            pageNumber: 1,
            cache: false,
            striped: true,
            pagination: true,
            sidePagination: 'client',
            pageList: [5 ],
            showColumns: false,
            search: false,
            showRefresh: false,
            showFooter: false,
            clickToSelect: false,
        });
    }

    $("#search_btn1").click(function () {
        getStudentInfo();
    });

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
        window.location.href = "/admin_update_teacher?teacher_id="+id;
    }
    //进行删除操作
    function DeleteById(id) {
        var txt=  "确认删除此条记录？";
        var option = {
            title: "提示：",
            btn: parseInt("0011",2),
            onOk: function(){
                window.location.href = "/delete_teacher_database?teacher_id="+id;
            }
        }
        window.wxc.xcConfirm(txt, "custom", option);
    }
</script>
</html>
