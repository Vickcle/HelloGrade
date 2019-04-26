<%--
  Created by IntelliJ IDEA.
  User: Rainard
  Date: 2019/3/7
  Time: 13:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="admin_head.jsp"/>
<<div class="col-md-2 "><jsp:include page="admin_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="col-md-8 col-md-offset-1">
        <input type="file" id="excel-file" multiple="multiple">
        <input type="button" class="bg-primary col-md-3" id="fileImport" value="导入">
    </div>
</div>
</body>
<style type="text/css">
    p{
        font-size: 20px;
        color: #afd9ee;
    }
</style>
<script src="${pageContext.request.contextPath}/js/jquery.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/js/xlsx.core.min.js" type="text/javascript" ></script>
<script type="text/javascript">
    $("#fileImport").click(function () {
        fileImport();
    });

    function fileImport() {
        // 以二进制方式打开文件
        //var files = e.target.files;
        var files = document.getElementById('excel-file').files;
        for(var i = 0;i<files.length;i++){
            var fileReader = new FileReader();
            var str = fileReader.readAsBinaryString(files[i]);
            console.log("第"+i+"次循环");
            fileReader.onload = function(ev) {
                try {
                    var data = ev.target.result;
                    workbook = XLSX.read(data, {
                        type: 'binary'
                    }), // 以二进制流方式读取得到整份excel表格对象
                        persons = []; // 存储获取到的数据
                } catch (e) {
                    console.log('文件类型不正确');
                    return;
                }

                // 表格的表格范围，可用于判断表头是否数量是否正确
                var fromTo = '';
                // 遍历每张表读取
                for (var sheet in workbook.Sheets) {
                    if (workbook.Sheets.hasOwnProperty(sheet)) {
                        fromTo = workbook.Sheets[sheet]['!ref'];
                        persons = persons.concat(XLSX.utils.sheet_to_json(workbook.Sheets[sheet]));
                        //break; // 如果只取第一张表，就取消注释这行
                    }
                }
                uploadfile(persons);
                //此处调用其它函数进行json数据上传
            };
        }
    }

    function filecheck() {

    }

    function uploadfile(persons) {
        // console.log(persons);
        var person = JSON.stringify(persons);
        $.ajax({
            type: "POST", //请求方式 post
            dataType : 'jsonp', //数据类型 jsonp
            jsonp:"jsoncallback", //回调类型 jsonp
            contentType:"application/x-www-form-urlencoded; charset=utf-8", //请求内容类型（键值对，编码格式utf-8）
            url: "/import_lesson_database", // 请求地址
            data: {person: person}, //请求附带参数（rows）
            timeout:20000, //请求超时时间（20秒）
            success: function(responseData){ //请求成功捕捉
                window.location.href = "/admin_query_lesson";
            },
            error:function(XMLHttpRequest, textStatus, errorThrown){ //请求错误捕捉
                //alert("连接服务器失败,请重试!");
                window.location.href = "/admin_query_lesson";
            }
        });
    }
</script>
</html>
