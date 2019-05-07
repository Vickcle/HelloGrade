<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 18:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="grade" class="com.vickcle.model.Grade" scope="request" />
<jsp:useBean id="gradeObject" class="com.vickcle.model.GradeObject" scope="request" />
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
        填写成绩信息：
        <br>
        <table border="1">
            <sf:form method="post" modelAttribute="grade"
                     action="${pageContext.request.contextPath }/update_grade_database">
                <div class="div-jan">
                    <sf:input id="grade_id" path="grade_id" type="hidden"/>
                    <sf:input id="student_id" path="student_id" type="hidden"/>
                    <sf:input id="lesson_id" path="lesson_id" type="hidden"/>
                </div>
                <div class="div-jan">
                    <span>学生学号</span>
                    <input type ="text"  data-toggle="modal" data-target="#studentInfo"  id="student_code"/>
                </div>
                <div class="div-jan">
                    <span>学生姓名</span>
                    <input  data-toggle="modal" data-target="#studentInfo" type ="text" id="student_name"/>
                </div>
                <div class="div-jan">
                    <span>课程编号</span>
                    <input type ="text"  data-toggle="modal" data-target="#courseInfo" id="course_code"/>
                </div>
                <div class="div-jan">
                    <span>课程名称</span>
                    <input  data-toggle="modal" data-target="#courseInfo" type ="text" id="course_name"/>
                </div>

                <div class="div-jan">
                    <span>实验成绩</span>
                    <sf:input  path="grade_test"  type ="text" id="grade_test"/>
                </div>
                <div class="div-jan">
                    <span>平时成绩</span>
                    <sf:input  path="grade_usual"  type ="text" id="grade_usual"/>
                </div>
                <div class="div-jan">
                    <span>期中成绩</span>
                    <sf:input  path="grade_interim"   type ="text" id="grade_interim"/>
                </div>
                <div class="div-jan">
                    <span>期末成绩</span>
                    <sf:input  path="grade_terminal"  type ="text" id="grade_terminal"/>
                </div>
                <div class="div-jan">
                    <span>总的成绩</span>
                    <sf:input  path="grade_total"   type ="text" id="grade_total"/>
                </div>

                <div class="div-jan"><input id="submitGrade" type="submit" value="增加" class="update btn btn-info"></div>
            </sf:form>
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
        var student_code = '${gradeObject.student_code}';
        var student_name = '${gradeObject.student_name}';
        $("input[id='student_code']").attr("value",student_code);
        $("input[id='student_name']").attr("value",student_name);
        var course_code = '${gradeObject.course_code}';
        var course_name = '${gradeObject.course_name}';
        $("input[id='course_code']").attr("value",course_code);
        $("input[id='course_name']").attr("value",course_name);
        getStudentInfo();
        getLessonInfo();
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

    function getLessonInfo(){
        var course_code =  $("input[id='search_course_code']").val();
        var course_name = $("input[id='search_course_code']").val();
        $.ajax({
            url:'/teacher_get_lesson_info',
            type:'POST',
            async:true,
            data:{
                course_code:course_code,
                course_name:course_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var lesson = data["data"];
                var str = JSON.stringify(lesson);
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
                formatter: function(value, row, index) {
                    return index + 1;
                }},
            {field: 'lesson_id',align: 'center',title:'课程id'},
            {field: 'course_code', title: '课程编号', sortable: true},
            {field: 'course_name', title: '课程名称', },
            {field: 'course_degree', title: '课程名称', },
            {field: 'course_time', title: '课程名称', },
            {field: 'lesson_duration', title: '课程名称', },
        ];
        $('#tableL02').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL02').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data1, //通过ajax返回的数据
            width:600,
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
                $("input[id='course_code']").attr("value",row.course_code);
                $("input[id='course_name']").attr("value",row.course_name);
                $("input[id='lesson_id']").attr("value",row.lesson_id);
                $("input[id='course_code']").blur();
                $("input[id='course_name']").blur();
                $("#courseInfo").modal('hide');

            }
        });
    }

    $("#search_btn1").click(function () {
        getStudentInfo();
    });
    $("#search_btn2").click(function () {
        getLessonInfo();
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
    //                 window.location.href = "/teacher_query_creer";
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

