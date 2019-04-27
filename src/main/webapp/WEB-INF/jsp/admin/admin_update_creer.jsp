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
<jsp:useBean id="creerObject" class="com.vickcle.model.CreerObject" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10 col-md-offset-2">
        修改就业信息：
        <br>
        <table border="1">
            <form method="post" modelAttribute="creer"
                     action="${pageContext.request.contextPath }/update_creer_database">
                <div class="div-jan">
                    <span>就业类型：</span>
                    <sf:input id="creer_id" path="creerObject.creer_id" type = "hidden"/>
                    <sf:select style="width:150px;height:25px;" path="creerObject.creer_type">
                    <option  value="就业">就业</option>
                    <option  value="升学">升学</option>
                    </sf:select>
                    <sf:input id="student_id" path="creerObject.student_id" type = "hidden"/>
                    <sf:input id="company_id" path="creerObject.company_id"  type = "hidden"/>
                </div>
                <div class="div-jan">
                    <span>学生学号</span>
                    <sf:input path="creerObject.student_code" type ="text"  data-toggle="modal" data-target="#studentInfo" id="student_code"/>
                </div>
                <div class="div-jan">
                    <span>学生姓名</span>
                    <sf:input  path="creerObject.student_name" data-toggle="modal" data-target="#studentInfo" type ="text" id="student_name"/>
                </div>
                <div class="div-jan">
                    <span>企业编号</span>
                    <sf:input path="creerObject.company_code" type ="text"  data-toggle="modal" data-target="#companyInfo" id="company_code"/>
                </div>
                <div class="div-jan">
                    <span>企业名称</span>
                    <sf:input path="creerObject.company_name" data-toggle="modal" data-target="#companyInfo" type ="text" id="company_name"/>
                </div>
                <div class="div-jan"><input id="submitCreer" type="submit" value="修改" class="update btn btn-info"></div>
            </form>
        </table>
    </div>
    <div class="modal fade" id="studentInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">学生信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            查询条件
                        </div>
                        <div class="panel-body form-group" style="margin-bottom:0px;">
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">学号：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_student_code"/>
                            </div>
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">姓名：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_student_name"/>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-primary" style="margin-left:89px;" id="search_btn1">查询</button>
                            </div>
                        </div>
                    </div>
                    <table class="table" id="tableL01"></table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">刷新</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="companyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" >企业信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            查询条件
                        </div>
                        <div class="panel-body form-group" style="margin-bottom:0px;">
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">编号：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_company_code"/>
                            </div>
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">名称：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_company_name"/>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-primary" style="margin-left:89px;" id="search_btn2">查询</button>
                            </div>
                        </div>
                    </div>
                    <table class="table" id="tableL02"></table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">刷新</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
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
        -webkit-appearance: none;
        margin-left: 10px;
    }
    .div-jab select{
        margin-left: 10px;
    }
    .modal-body{
        height: 500px;
    }
    .col-sm-2 input{
        width: 100px;
    }
</style>
<script src="${pageContext.request.contextPath}\js\bootstrap-table.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script>
    //预加载事件

    $(function(){
        getStudentInfo();
        getCompanyInfo();
    });



    function getStudentInfo(){
        var student_code =  $("input[id='search_student_code']").val();
        var student_name = $("input[id='search_student_name']").val();

        $.ajax({
            url:'/query_student_info',
            type:'POST',
            async:true,
            data:{
                student_code:student_code,
                student_name:student_name,
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var students = data["data"];
                var str = JSON.stringify(students);
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
            {field: 'student_code', title: '学号', sortable: true},
            {field: 'student_name', title: '姓名', },
            {field: 'student_id',visible: false},
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
            onDblClickRow: function (row) {
                $("input[id='student_code']").attr("value",row.student_code);
                $("input[id='student_name']").attr("value",row.student_name);
                $("input[id='student_id']").attr("value",row.student_id);
                $("input[id='student_code']").blur();
                $("input[id='student_name']").blur();
                $("#studentInfo").modal('hide');

            }
        });
    }

    function getCompanyInfo(){
        var company_code =  $("input[id='company_code']").val();
        var company_name = $("input[id='company_name']").val();
        $.ajax({
            url:'/query_company_info',
            type:'POST',
            async:true,
            data:{
                company_code:company_code,
                company_name:company_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var company = data["data"];
                var str = JSON.stringify(company);
                pushTable2Info(str);
            },
            error:function(){

            }
        });
    }

    function pushTable2Info(data) {
        var data1 = JSON.parse(data);
        var tableColumns = [
            {
                title: '序号',
                align: 'center',
                valign: 'bottom',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'company_code', title: '公司编号', sortable: true},
            {field: 'company_name', title: '公司名称', },
            {field: 'company_id',visible: false},
        ];
        $('#tableL02').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL02').bootstrapTable({//表格初始化
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
            onDblClickRow: function (row) {
                $("input[id='company_code']").attr("value",row.company_code);
                $("input[id='company_name']").attr("value",row.company_name);
                $("input[id='company_id']").attr("value",row.company_id);
                $("input[id='company_code']").blur();
                $("input[id='company_name']").blur();
                $("#companyInfo").modal('hide');

            }
        });
    }

    $("#search_btn1").click(function () {
        getStudentInfo();
    });
    $("#search_btn2").click(function () {
        getCompanyInfo();
    });
    // $("#search_btn3").click(function () {
    //     getSchoolInfo();
    // });
    // $("#submitCreer").click(function () {
    //     var creer_type = $("#creer_type").val();
    //     var student_id = $("#student_id").val();
    //     var company_id = $("#company_id").val();
    //     $.ajax({
    //         url:'/add_creer_database',
    //         type:'POST',
    //         async:true,
    //         data:{
    //             creer_type:creer_type,
    //             student_id:student_id,
    //             company_id:company_id
    //
    //         },
    //         timeout:5000,
    //         dataType:'json',
    //         success:function(data){
    //             var rep = data["data"];
    //             var str = JSON.stringify(rep);
    //             var str2 = JSON.parse(str);
    //             if(str2 == 'success'){
    //                 window.location.href = "/admin_query_creer";
    //             }else {
    //                 alert("error");
    //             }
    //         },
    //         error:function(data){
    //
    //         }
    //     });
    // });

</script>
</html>
