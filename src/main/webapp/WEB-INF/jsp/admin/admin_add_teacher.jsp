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
<jsp:useBean id="teacher" class="com.vickcle.model.Teacher" scope="request" />
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
    <div class="container col-md-10 col-md-offset-1">
        填写教师信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="teacher"
                     action="${pageContext.request.contextPath }/add_teacher_database">
                <div class="div-jan">教师工号:<sf:input path="teacher_code"/></div>
                <div class="div-jan">教师姓名:<sf:input path="teacher_name"/></div>
                <div class="div-jan">教师电话:<sf:input path="teacher_tel"/></div>
                <div class="div-jan">教师邮箱:<sf:input path="teacher_email"/></div>
                <div class="div-jan">教师职称:<sf:input path="teacher_honor"/></div>
                <sf:input path="academy_id" id="academy_id" type="hidden" />
                <div class="div-jan">学院编号:<input  type="text"  data-toggle="modal" data-target="#academyInfo" id="academy_code"/></div>
                <div class="div-jan">学院名称:<input  type="text"  data-toggle="modal" data-target="#academyInfo" id="academy_name"/></div><br>
                <input type="submit" value="增加" class="update btn btn-info">
            </sf:form>
        </table>
    </div>

    <div class="modal fade" id="academyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" >学院信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            查询条件
                        </div>
                        <div class="panel-body form-group" style="margin-bottom:0px;">
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">编号：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_academy_code"/>
                            </div>
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">名称：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_academy_name"/>
                            </div>
                            <div class="col-sm-1">
                                <button class="btn btn-primary" style="margin-left:89px;" id="search_btn">查询</button>
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
<script src="${pageContext.request.contextPath}\js\bootstrap-table.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script>
    //预加载事件

    $(function(){
        getAcademyInfo();
    });

    function getAcademyInfo(){
        var academy_code =  $("input[id='search_academy_code']").val();
        var academy_name = $("input[id='search_academy_name']").val();
        $.ajax({
            url:'/query_academy_info',
            type:'POST',
            async:true,
            data:{
                academy_code:academy_code,
                academy_name:academy_name,
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var academy = data["data"];
                var str = JSON.stringify(academy);
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
            {field: 'academy_code', title: '学院编号', sortable: true},
            {field: 'academy_name', title: '学院名称', },
            {field: 'academy_address', title: '学院地址',},
            {field: 'academy_id',visible: false},
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
            pagination: true,
            sidePagination: 'client',
            pageList: [5],
            showColumns: false,
            search: false,
            showRefresh: false,
            showFooter: false,
            clickToSelect: false,
            onDblClickRow: function (row) {
                $("input[id='academy_code']").attr("value",row.academy_code);
                $("input[id='academy_name']").attr("value",row.academy_name);
                $("input[id='academy_id']").attr("value",row.academy_id);
                $("input[id='academy_code']").blur();
                $("input[id='academy_name']").blur();
                $("#academyInfo").modal('hide');

            }
        });
    }


    $("#search_btn").click(function () {
        getAcademyInfo();
    });
</script>
</html>
