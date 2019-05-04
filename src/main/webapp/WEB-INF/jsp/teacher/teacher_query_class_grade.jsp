<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/5/4
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
<body>
<jsp:include page="teacher_head.jsp"/>
<div class="col-md-2"><jsp:include page="teacher_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    查询条件
                </div>
                <div class="panel-body form-group" style="margin-bottom:0px;">
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">班级：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="class_name"/>
                    </div>
                    <label class="col-sm-2 control-label" style="text-align: right; margin-top:5px">课程：</label>
                    <div class="col-sm-2">
                        <input type="text" class="form-control" name="Name" id="course_name"/>
                    </div>
                    <div class="col-sm-1 col-sm-offset-1">
                        <button class="btn btn-primary" style="width: 190px;margin-top: 2px;margin-left:18px;" id="search_btn">查询</button>
                    </div>
                </div>
            </div>
            <table class="table" id="tableL01"></table>
            <div id="myConfirm"></div>

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


    //预加载事件
    $("#search_btn").click(function () {
        getGradeInfo();
    });


    $(function(){
        getGradeInfo();
    });
    //ajax请求数据：
    function getGradeInfo(){
        var class_name = $("input[id='class_name']").val();
        var course_name =$("input[id='course_name']").val();
        $.ajax({
            url:'/teacher_get_class_grade',
            type:'POST',
            async:true,
            data:{
                class_name:class_name,
                course_name:course_name
            },
            timeout:5000,
            dataType:'json',
            success:function(data){
                var classGrades = data["data"];
                var str = JSON.stringify(classGrades);
                pushTableInfo(str);
            },
            error:function(){

            }
        });
    }

    function pushTableInfo(datas) {
        var data = JSON.parse(datas);
        var tableColumns = [
            {field: 'class_name', title: '班级', sortable: true},
            {field: 'course_code', title: '课程编号'},
            {field: 'course_name', title: '课程名称'},
            {field: 'sum_num', align:'center', title: '总人数',},
            {field: 'absence_num',align:'center', title: '缺考',},
            {field: 'max_grade',align:'center', title: '最高分', },
            {field: 'min_grade',align:'center', title: '最低分',},
            {field: 'avg_grade',align:'center', title: '平均分', sortable: true},
            {field: 'nine_num',align:'center', title: '>90', sortable: true},
            {field: 'eight_num',align:'center', title: '80-90', sortable: true},
            {field: 'seven_num',align:'center', title: '70-80', sortable: true},
            {field: 'six_num',align:'center', title: '60-70', sortable: true},
            {field: 'failed_num',align:'center', title: '<60', sortable: true},
            {
                field: 'lesson_id',
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
            width:600,
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
        var lesson_id = value;
        var result = "";
        var class_name = row["class_name"];
        result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"EditViewById('" + lesson_id + "','" + class_name + "', view='view')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
        return result;
    }

    //转到查看界面
    function EditViewById(lesson_id,class_name){
        //此处可以做班级查询的细节，并且提供下载

        window.location.href = "/teacher_class_grade_details?class_name="+class_name+"&lesson_id="+lesson_id;
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
</script>
</html>
