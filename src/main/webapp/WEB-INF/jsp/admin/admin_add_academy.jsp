<%--
  Created by IntelliJ IDEA.
  User: Rainard
  Date: 2019/4/16
  Time: 12:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="academy" class="com.vickcle.model.Academy" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\bootstrap-table.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}\css\reset.css">
<body>
<jsp:include page="admin_head.jsp"/>
<div class="col-md-2"><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10 col-md-offset-1">
        填写学校信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="academy"
                     action="${pageContext.request.contextPath }/add_academy_database">
                <!--这里不能再随机生成了，理论上应该根据添加的顺序来，但是这里直接指定-->
                <div class="div-jan">学院编号:<sf:input path="academy_code"/></div>
                <div class="div-jan">学院名称:<sf:input path="academy_name"/></div>
                <div class="div-jan">学院地址:<sf:input path="academy_address"/></div>
                <sf:input  path="school_id" id="school_id" type="hidden"/>
                <div class="div-jan">学校编号:<input type="text"  data-toggle="modal" data-target="#schoolInfo" id="school_code" /></div>
                <div class="div-jan">学校名称:<input type="text"  data-toggle="modal" data-target="#schoolInfo" id="school_name"/></div><br>
                <input type="submit" vlaue="增加" class="update btn btn-info">
            </sf:form>
        </table>
    </div>

    <div class="modal fade" id="schoolInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" >学校信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            查询条件
                        </div>
                        <div class="panel-body form-group" style="margin-bottom:0px;">
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">编号：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_school_code"/>
                            </div>
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">校名：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_school_name"/>
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
        getSchoolInfo();
    });

    function getSchoolInfo(){
        var school_code =  $("input[id='search_school_code']").val();
        var school_name = $("input[id='search_school_name']").val();
        $.ajax({
            url:'/query_school_info',
            type:'POST',
            async:true,
            data:{
                school_code:school_code,
                school_name:school_name,
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var schools = data["data"];
                var str = JSON.stringify(schools);
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
            {field: 'school_code', title: '学校编号', sortable: true},
            {field: 'school_name', title: '校名', },
            {field: 'school_address', title: '学校地址',},
            {field: 'school_id',visible: false},
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
                $("input[id='school_code']").attr("value",row.school_code);
                $("input[id='school_name']").attr("value",row.school_name);
                $("input[id='school_id']").attr("value",row.school_id);
                $("input[id='school_code']").blur();
                $("input[id='school_name']").blur();
                $("#schoolInfo").modal('hide');

            }
        });
    }


    $("#search_btn").click(function () {
        getCompanyInfo();
    });


</script>
</html>
