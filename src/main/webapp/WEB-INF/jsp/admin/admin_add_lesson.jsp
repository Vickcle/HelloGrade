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
<jsp:useBean id="lesson" class="com.vickcle.model.Lesson" scope="request" />
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
        填写实际课程信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="lesson"
                     action="${pageContext.request.contextPath }/add_lesson_database">
                <sf:input path="teacher_id" id="teacher_id" type="hidden"/>
                <sf:input path="course_id" id="course_id" type="hidden"/>
                <div class="div-jan">教师工号:<input type ="text"  data-toggle="modal" data-target="#teacherInfo" id="teacher_code"/></div>
                <div class="div-jan">教师姓名:<input type ="text"  data-toggle="modal" data-target="#teacherInfo" id="teacher_name"/></div>
                <div class="div-jan">课程编号:<input type ="text"  data-toggle="modal" data-target="#courseInfo" id="course_code"/></div>
                <div class="div-jan">课程名称:<input type ="text"  data-toggle="modal" data-target="#courseInfo" id="course_name"/></div>
                <%--<div class="div-jan">开设学期:<sf:input type="text" path="lesson_duration"/></div>--%>
                <div class="div-jan">开设学期:
                <sf:select id="lesson_duration" class="select" style="margin-left:6px;width:178px;height:25px;" path="lesson_duration">
                    <sf:option  value="2015-2016-1">2015-2016-1</sf:option>
                    <sf:option  value="2015-2016-2">2015-2016-2</sf:option>
                    <sf:option  value="2016-2017-1">2016-2017-1</sf:option>
                    <sf:option  value="2016-2017-2">2016-2017-2</sf:option>
                    <sf:option  value="2017-2018-1">2017-2018-1</sf:option>
                    <sf:option  value="2017-2018-2">2017-2018-2</sf:option>
                    <sf:option  value="2018-2019-1">2018-2019-1</sf:option>
                    <sf:option  value="2018-2019-2">2018-2019-2</sf:option>
                    <sf:option  value="2019-2020-1">2019-2020-1</sf:option>
                    <sf:option  value="2019-2020-2">2019-2020-2</sf:option>
                </sf:select>
                </div>
                <div class="div-jan">上课地点:<sf:input type="text" path="lesson_address"/></div>
                <br>
                <input type="submit" value="增加" class="update btn btn-info">
            </sf:form>
        </table>
    </div>

    <div class="modal fade" id="teacherInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">教师信息</h4>
                </div>
                <div class="modal-body">
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
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">刷新</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <div class="modal fade" id="courseInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" >课程信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            查询条件
                        </div>
                        <div class="panel-body form-group" style="margin-bottom:0px;">
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">编号：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_course_code"/>
                            </div>
                            <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">名称：</label>
                            <div class="col-sm-2">
                                <input type="text" class="form-control" id="search_course_name"/>
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
        margin-left: 10px;
    }
</style>

<script src="${pageContext.request.contextPath}\js\bootstrap-table.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script>
    //预加载事件

    $(function(){
        getTeacherInfo();
        getCourseInfo();
    });



    function getTeacherInfo(){
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
                visible: false,
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
            onDblClickRow: function (row) {
                $("input[id='teacher_code']").attr("value",row.teacher_code);
                $("input[id='teacher_name']").attr("value",row.teacher_name);
                $("input[id='teacher_id']").attr("value",row.teacher_id);
                $("input[id='teacher_code']").blur();
                $("input[id='teacher_name']").blur();
                $("#teacherInfo").modal('hide');

            }
        });
    }

    $("#search_btn1").click(function () {
        getTeacherInfo();
    });

    function getCourseInfo(){
        var course_code =  $("input[id='course_code']").val();
        var course_name =$("input[id='course_name']").val();
        $.ajax({
            url:'/admin_query_course_term',
            type:'POST',
            async:true,
            data:{
                course_code:course_code,
                course_name:course_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var courseObjects = data["data"];
                var str = JSON.stringify(courseObjects);
                pushTable2Info(str);
            },
            error:function(){

            }
        });
    }

    function pushTable2Info(datas) {
        var data = JSON.parse(datas);
        var tableColumns = [
            {
                title: '序号',
                align: 'center',
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'course_code', title: '课程编号', sortable: true},
            {field: 'course_name', title: '课程名', },
            {field: 'course_type', title: '课程类型'},
            {field: 'course_property', title: '课程属性',},
            {field: 'course_degree', title: '学分',},
            {field: 'course_time', title: '学时',},
            {
                field: 'course_id',
                visible: false,
            }
        ];
        $('#tableL02').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL02').bootstrapTable({//表格初始化
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
            showFooter: true,
            clickToSelect: true,
            onDblClickRow: function (row) {
                $("input[id='course_code']").attr("value",row.course_code);
                $("input[id='course_name']").attr("value",row.course_name);
                $("input[id='course_id']").attr("value",row.course_id);
                $("input[id='course_code']").blur();
                $("input[id='course_name']").blur();
                $("#courseInfo").modal('hide');

            }
        });
    }

    $("#search_btn2").click(function () {
        getCourseInfo();
    });



</script>
</html>
