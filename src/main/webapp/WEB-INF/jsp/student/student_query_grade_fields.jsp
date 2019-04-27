<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 15:48
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
<style type="text/css">
    /*#myModal{*/
        /*position:absolute;*/
        /*z-index: 200;*/
        /*top: 50px;*/
        /*left:250px;*/
        /*border: 1px solid #2B2E33;*/
        /*border-radius: 5px;*/
        /*background-color: #f0f9fe;*/
        /*width: 400px;*/
        /*height: 280px;*/
        /*padding-left: 12px;*/
    /*}*/
    /*#myModal h2{*/
        /*margin-left: 30px;*/
    /*}*/
    /*#close_myModal{*/
        /*margin-left: 30px;*/
        /*margin-top: 40px;*/
        /*width:150px;*/
    /*}*/
</style>
<body>
<jsp:include page="student_head.jsp"/>
<div class="col-md-2"><jsp:include page="student_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">教师姓名：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="teacher_name"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">课程名称：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="course_name"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-9">
                        <button class="btn btn-primary" style="width: 190px;margin-top: 10px;margin-left:18px;" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table class="table" id="tableL01"></table>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title" id="myModalLabel">成绩预测</h4>
                        </div>
                        <div class="modal-body">下一门课程为：
                            <h2><label class="label label-success" id="next_name"></label></h2>
                        </div>
                        <div class="modal-body">下一门课程成绩为：
                            <h2><label class="label label-info" id="next_grade"></label></h2>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <%--<button type="button" class="btn btn-primary">提交更改</button>--%>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal -->
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath}\js\jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\jquery.mousewheel.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\bootstrap-table-zh-CN.min.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}\js\xcConfirm.js" type="text/javascript" ></script>
<script>
    //全局变量：已有数据：
    //先清空数据
    //准备表头数据：
    $("#close_myModal").click(function () {
        $("#myModal").hide();
    });

    //预加载事件
    $(function(){
        getGradeInfo();
    });
    //ajax请求数据：
    function getGradeInfo(){
        var teacher_name =  $("input[id='teacher_name']").val();
        var course_name =$("input[id='course_name']").val();
        $.ajax({
            url:'/student_query_teacher_term',
            type:'POST',
            async:true,
            data:{
                current_page:1,
                page_size: 10,
                lesson_duration:teacher_name,
                course_name:course_name
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
            {field: 'course_code', title: '课程编号', sortable: true},
            {field: 'course_name', title: '课程名称',},
            {field: 'teacher_name', title: '教师姓名', },
            {field: 'lesson_duration', title: '学期',},
            {field: 'grade_test', title: '实验成绩', sortable: true},
            {field: 'grade_usual', title: '平时成绩', sortable: true},
            {field: 'grade_interim', title: '期中成绩', sortable: true},
            {field: 'grade_terminal', title: '期末成绩', sortable: true},
            {field: 'grade_total', title: '总成绩', sortable: true},
            {
                field: 'grade_id',
                title: '后续成绩预测',
                width: 120,
                align: 'center',
                valign: 'middle',
                formatter: actionFormatter,
            },
        ];
        $('#tableL01').bootstrapTable('destroy');   //动态加载表格之前，先销毁表格

        $('#tableL01').bootstrapTable({//表格初始化
            columns: tableColumns,  //表头
            data:data, //通过ajax返回的数据
            width:300,
            height:400,
            method: 'get',
            pageSize: 6,
            pageNumber: 1,
            pageList: [],
            cache: false,
            striped: true,
            pagination: true,
            sidePagination: 'client',
            search: false,
            showRefresh: false,
            showExport: false,
            showFooter: true,
            // exportTypes: ['csv', 'txt', 'xml'],
            clickToSelect: true,
        });
    }

    $("#search_btn").click(function () {
        getGradeInfo();
    });

    function actionFormatter(value, row, index) {
        var course_name = row["course_name"];
        var grade_total = row["grade_total"];
        var id = value;
        var result = "";
        result += "<a href='javascript:;' data-toggle='modal' data-target='#myModal' class='btn btn-xs green ' onclick=\"EditViewById('" + id +"', view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
        return result;
    }

    //转到查看界面
    function EditViewById(id){
        $.ajax({
            url:'/get_course_relation_info',
            type:'POST',
            async:true,
            data:{
                current_page:1,
                page_size: 10,
                grade_id:id,
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                $("#next_name").html(data["course_name"]);
                $("#next_grade").html(data["data"]);
            },
            error:function(){
                alert("error");
            }
        });
    }
    //进行删除操作
    //17184305914
    //转到查看界面

</script>
</html>
