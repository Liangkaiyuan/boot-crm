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

<title>添加节点信息</title>
<!-- Bootstrap Core CSS -->
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="<%=basePath%>css/metisMenu.min.css" rel="stylesheet">

<!-- DataTables CSS -->
<link href="<%=basePath%>css/dataTables.bootstrap.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="<%=basePath%>css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="<%=basePath%>css/font-awesome.min.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/boot-crm.css" rel="stylesheet"
	type="text/css">

</head>

<body>

	<div id="wrapper">
  

<jsp:include page="/WEB-INF/jsp/head.jsp" /> 


 

		<!-- 登录界面 -->
		<div style="text-align: center;">
<h4 style="text-align: center;">编辑用户</h4>
			<form action="${pageContext.request.contextPath }/editUser.action" method="post">
			
			<c:forEach items="${page}" var="row">
									 
	           	 用户id:<input type="text" name="user_id" value = "${row.user_id}" placeholder="" autocomplete = "off"/><br /> 
				
				用户名称：<input type="text" name="user_name" value = "${row.user_name}" placeholder="" autocomplete = "off"/><br />
				 
				用户密码：<input type="text" name="user_password" value = "${row.user_password}" placeholder="" autocomplete = "off"/><br />
				
				用户状态：<input type="text" name="user_state" value = "${row.user_state}" placeholder="" autocomplete = "off"/><br /> 
				
				<%-- <input type="text" name="user_roleid" value = "${row.user_roleid}" placeholder="" autocomplete = "off"/><br /> 
				 --%>
				用户角色：<input type="text" name="role_name" readonly unselectable='on' value = "${row.role_name}" placeholder="" autocomplete = "off"/><br /> 
				
					
				
				
				</c:forEach>
				
		 
			 
				 
				<input type="submit" type="text" value="提交"/> 
				
				<input type="reset" type="text" value="重置"/>
			</form>
		</div>
		<!-- 登录界面 -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="<%=basePath%>js/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="<%=basePath%>js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="<%=basePath%>js/metisMenu.min.js"></script>

	<!-- DataTables JavaScript -->
	<script src="<%=basePath%>js/jquery.dataTables.min.js"></script>
	<script src="<%=basePath%>js/dataTables.bootstrap.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="<%=basePath%>js/sb-admin-2.js"></script>

<!-- 传递查询出来的角色id -->
<script type="text/javascript">
var a = ${role_id};
 
</script>



	<script type="text/javascript">
		function editCustomer(id) {
			$.ajax({
				type:"get",
				url:"<%=basePath%>customer/edit.action",
				data:{"id":id},
				success:function(data) {
					$("#edit_cust_id").val(data.cust_id);
					$("#edit_customerName").val(data.cust_name);
					$("#edit_customerFrom").val(data.cust_source)
					$("#edit_custIndustry").val(data.cust_industry)
					$("#edit_custLevel").val(data.cust_level)
					$("#edit_linkMan").val(data.cust_linkman);
					$("#edit_phone").val(data.cust_phone);
					$("#edit_mobile").val(data.cust_mobile);
					$("#edit_zipcode").val(data.cust_zipcode);
					$("#edit_address").val(data.cust_address);
					
				}
			});
		}
		function updateCustomer() {
			$.post("<%=basePath%>customer/update.action",$("#edit_customer_form").serialize(),function(data){
				alert("客户信息更新成功！");
				window.location.reload();
			});
		}
		
		function deleteCustomer(id) {
			if(confirm('确实要删除该客户吗?')) {
				$.post("<%=basePath%>customer/delete.action",{"id":id},function(data){
					alert("客户删除更新成功！");
					window.location.reload();
				});
			}
		}
	</script>

</body>

</html>
