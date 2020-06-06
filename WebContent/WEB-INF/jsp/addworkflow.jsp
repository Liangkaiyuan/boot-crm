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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<div id="wrapper">
  

<jsp:include page="/WEB-INF/jsp/head.jsp" /> 


 

		<!-- 登录界面 -->
		<div style="text-align: center;">
		<h4 style="text-align: center;">创建流程</h4>
			<form action="${pageContext.request.contextPath }/addworkflow.action" method="post">
				<!-- <input type="text" name="workflow_id" placeholder="流程id" autocomplete = "off"/><br /> 
			 -->
				<input type="text" name="workflow_name" placeholder="名称" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_memo" placeholder="说明" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_a" placeholder="a" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_b" placeholder="b" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_c" placeholder="c" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_d" placeholder="d" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_e" placeholder="e" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_f" placeholder="f" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_g" placeholder="g" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_h" placeholder="h" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_i" placeholder="i" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_j" placeholder="j" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_k" placeholder="k" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_l" placeholder="l" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_m" placeholder="m" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_n" placeholder="n" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_o" placeholder="o" autocomplete = "off"/><br /> 
				
				<input type="text" name="workflow_p" placeholder="p" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_q" placeholder="q" autocomplete = "off"/><br /> 
				
				<!-- <input type="text" name="workflow_r" value="0"  readonly  unselectable="on"  autocomplete = "off"/><br />
				 -->
				<!-- <input type="text" name="workflow_s" value="流程状态" readonly  unselectable="on"  autocomplete = "off"/><br />
				 -->
				 
				
				<!-- <input type="text" name="workflow_node_id" placeholder="审批流id" autocomplete = "off"/><br />
 -->
				
				<!-- <input type="text" name="workflow_h" placeholder="" autocomplete = "off"/><br />
			 用作用户id输入-->	
				<input type="submit" type="text" value="提交"/> <input type="reset" type="text" value="重置"/>
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
