<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/26
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>

<!doctype html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="creer" class="com.vickcle.model.Creer" scope="request" />
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
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">学生学号：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="student_code"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">学生姓名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="student_name"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">公司编号：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="company_code"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:15px">公司名称：</label>
                    <div class="col-sm-2" style="margin-top: 10px;">
                        <input type="text" class="form-control" name="Name" id="company_name"/>
                    </div>
                    <div class="col-sm-1">
                        <button class="btn btn-primary" style="width: 150px;margin-top: 10px;margin-left:89px;" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
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
        getGreerInfo();
    });
    //ajax请求数据：
    function getGreerInfo(){
        var student_code =  $("input[id='student_code']").val();
        var student_name = $("input[id='student_name']").val();
        var company_name =$("input[id='company_name']").val();
        var company_code =$("input[id='company_code']").val();
        $.ajax({
            url:'/select_Creer_Info',
            type:'POST',
            async:true,
            data:{
                student_code:student_code,
                student_name:student_name,
                company_code:company_code,
                company_name:company_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
               var creerObjects = data["data"];
                var str = JSON.stringify(creerObjects);
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
                valign: 'bottom',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'student_code', title: '学号', sortable: true},
            {field: 'student_name', title: '姓名', },
            {field: 'creer_type', title: '就业类型',},
            {field: 'company_code', title: '公司编号'},
            {field: 'company_name', title: '公司名称',},
            {field: 'company_type', title: '公司类型', },
            {field: 'company_address', title: '公司地址', },
            {
                field: 'creer_id',
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
            search: false,
            showRefresh: false,
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
                ignoreColumn: [9],  //忽略某一列的索引
                fileName: '就业信息报表',  //文件名称设置
                worksheetName: 'sheet1',  //表格工作区名称
                tableName: '就业信息报表',
                excelstyles: ['background-color', 'color', 'font-size', 'font-weight']
                //onMsoNumberFormat: DoOnMsoNumberFormat,
            }
        });
    }

    $("#search_btn").click(function () {
        getGreerInfo();
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
        window.location.href = "/admin_update_creer?creer_id="+id;
    }
    //进行删除操作
    function DeleteById(id) {
        var txt=  "确认删除此条记录？";
        var option = {
            title: "提示：",
            btn: parseInt("0011",2),
            onOk: function(){
                window.location.href = "/delete_creer_database?creer_id="+id;
            }
        }
        window.wxc.xcConfirm(txt, "custom", option);
    }



</script>
</html>