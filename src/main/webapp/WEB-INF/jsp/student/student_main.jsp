<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>学生成绩管理及分析平台-学生平台</title>
</head>
<meta charset="utf-8">
<meta name="keywords" value ="firstpage,login">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/img/title.ico" type="image/x-icon" />
<body id = "body">
<div>
	<jsp:include page="student_head.jsp"/>
	<div class="col-md-2 "><jsp:include page="student_menu.jsp"/>
	<div class="col-md-10">
	</div>
</div>
</body>
<script type="text/javascript" >
    var canvas = document.getElementsByName( 'canvas' );
    canvas.width = 500;
    canvas.height = 400;
    canvas.style.border = '1px dashed red';
    document.body.appendChild( canvas );
    // 获得 CanvasRenderingContext2D 对象
    var context = canvas.getContext( '2d' );
    // 设置 起点
    context.moveTo( 0, 0 );
    // 绘制直线
    context.lineTo( 500, 400 );
    // 设置 起点
    context.moveTo( 0, 400 );
    // 绘制直线
    context.lineTo( 500, 0 );
    // 描边显示效果
    context.stroke();
</script>
</html>
