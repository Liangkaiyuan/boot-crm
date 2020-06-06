<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="itcast" uri="http://itcast.cn/common/"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>联想搜索功能</title>
</head>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(function(){
		$("ul").css({
			"padding":"0px",
			"margin":"0px",
			"list-style":"none",
			"width":"100%",
		});
	
		$("li").css({
			"padding":"0px",
			"margin":"0px",
			"width":"100%"
		});
		
		$("li").hover(
			function(){
				$(this).css({"background-color":"#ddd"});
			},
			function(){
				$(this).css({"background-color":"#fff"});
			}
		);
	});	
</script>
<body>
	<ul>
		<c:forEach begin="1" end="3" items="${unames }" var="uname" step="1">
			<li>${uname }</li>
		</c:forEach>
	</ul>
</body>
</html>
 