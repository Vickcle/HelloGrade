<%--
  Created by IntelliJ IDEA.
  User: Vickcle
  Date: 2019/4/15
  Time: 15:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false"%>
<jsp:useBean id="gradeObject" class="com.vickcle.model.GradeObject" scope="request" />
<html>
<meta charset="utf-8">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body>
<jsp:include page="teacher_head.jsp"/>
<div class="col-md-2"><jsp:include page="teacher_menu.jsp"/>
</div>
<div class="col-md-10" style="float: left;">
    <div class="container col-md-10">
        <div class="table-responsive col-md-12">
            <table class="table table-condensed" id="table">
                <thead>
                <tr>
                    <th>序号</th>
                    <th>学生学号</th>
                    <th>学生姓名</th>
                    <th>课程名称</th>
                    <th>实验成绩</th>
                    <th>平时成绩</th>
                    <th>期中成绩</th>
                    <th>期末成绩</th>
                    <th>总成绩</th>
                    <th>修改</th>
                    <th>删除</th>
                </tr>
                </thead><tbody>
            <% int num = 0 ;%>
            <c:forEach items="${list}" var="gradeObject" >
                <tr>
                    <% num = num + 1 ;
                        out.print("<td>"+ num +"</td>");
                    %>
                    <td>${gradeObject.student_code}</td>
                    <td>${gradeObject.student_name}</td>
                    <td>${gradeObject.course_name}</td>
                    <td>${gradeObject.grade_test}</td>
                    <td>${gradeObject.grade_usual}</td>
                    <td>${gradeObject.grade_interim}</td>
                    <td>${gradeObject.grade_terminal}</td>
                    <td>${gradeObject.grade_total}</td>
                    <td><a href="${pageContext.request.contextPath}/teacher_update_grade?grade_id=${ gradeObject.grade_id}">修改</a></td>
                    <td><a href="${pageContext.request.contextPath}/delete_grade_database?grade_id=${ gradeObject.grade_id}">删除</a></td>
                </tr>
            </c:forEach>
            </tbody>
            </table>
<%--使用jstl标签生成组--%>
            <%--<c:forEach var="i" begin="1" end="4">--%>
                <%--<c:set var="sum" value="${0 + i}" />--%>
                <%--<c:out value="${sum}"/>--%>
            <%--</c:forEach>--%>

<center>
            <ul class="pagination">
                <li><a href="#">&laquo;</a></li>
                <c:forEach var="i" begin="1" end="4">
                    <c:set var="sum" value="${0 + i}" />
                    <li><a href="#"> <c:out value="${sum}"/></a></li>
                </c:forEach>
                <li><a href="#">&raquo;</a></li>
            </ul>
</center>
        </div>
    </div>
</div>
</body>
<script>
    $(".pagination").click(function (ev) {
        var ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        var str = target.innerHTML;

        $.ajax({
            url:'/teacher_query_grade_paras',
            type:'POST',
            async:true,
            data:{
                page_num:str,
                page_size:10,
            },
            timeout:5000,
            dataType:'json',
            success:function(){
                window.location.href = "/teacher_query_grade_pages";
            },
            error:function(){

            }
        });
    });
</script>
</html>
