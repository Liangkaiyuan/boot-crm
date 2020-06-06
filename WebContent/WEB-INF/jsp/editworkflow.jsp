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

<title>客户列表-BootCRM--编辑流程</title>

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

			<form action="${pageContext.request.contextPath }/workflow/updateworkflow.action" method="post">
				<!-- <input type="text" name="workflow_id" value="流程id" autocomplete = "off"/><br /> 
			 -->
			 <c:forEach items="${page}" var="row">
			 <input type="text" name="workflow_id" value="${row.workflow_id}" style="display: none" autocomplete = "off"/><br /> 
			 
				流程名称:<input type="text" name="workflow_name" value="${row.workflow_name}" autocomplete = "off"/><br /> 
				
				流程备注:<input type="text" name="workflow_memo" value="${row.workflow_memo}" autocomplete = "off"/><br />
				
				a:<input type="text" name="workflow_a" value="${row.workflow_a}" autocomplete = "off"/><br /> 
				
				b:<input type="text" name="workflow_b" value="${row.workflow_b}" autocomplete = "off"/><br />
				
				c:<input type="text" name="workflow_c" value="${row.workflow_c}" autocomplete = "off"/><br /> 
				
				d:<input type="text" name="workflow_d" value="${row.workflow_d}" autocomplete = "off"/><br />
				
				e:<input type="text" name="workflow_e" value="${row.workflow_e}" autocomplete = "off"/><br /> 
				
				f:<input type="text" name="workflow_f" value="${row.workflow_f}" autocomplete = "off"/><br />
				
				g:<input type="text" name="workflow_g" value="${row.workflow_g}" autocomplete = "off"/><br />
				
				h:<input type="text" name="workflow_h" value="${row.workflow_h}" autocomplete = "off"/><br />
				
				i:<input type="text" name="workflow_i" value="${row.workflow_i}" autocomplete = "off"/><br /> 
				
				j:<input type="text" name="workflow_j" value="${row.workflow_j}" autocomplete = "off"/><br />
				
				k:<input type="text" name="workflow_k" value="${row.workflow_k}" autocomplete = "off"/><br /> 
				
				l:<input type="text" name="workflow_l" value="${row.workflow_l}" autocomplete = "off"/><br />
				
				m:<input type="text" name="workflow_m" value="${row.workflow_m}" autocomplete = "off"/><br />
				
				n:<input type="text" name="workflow_n" value="${row.workflow_n}" autocomplete = "off"/><br />
				
				o:<input type="text" name="workflow_o" value="${row.workflow_o}" autocomplete = "off"/><br /> 
				
				p:<input type="text" name="workflow_p" value="${row.workflow_p}" autocomplete = "off"/><br />
				
				q:<input type="text" name="workflow_q" value="${row.workflow_q}" autocomplete = "off"/><br /> 
				
				r:<input type="text" name="workflow_r" value="${row.workflow_r}" autocomplete = "off"/><br />0：为测试，1：为可用，2为作废<br />
				
				s:<input type="text" name="workflow_s" value="流程状态" readonly  unselectable="on"  autocomplete = "off"/><br />
				
				t:<input type="text" name="workflow_t" value="${row.workflow_t}" autocomplete = "off"/><br />
				
				u:<input type="text" name="workflow_u" value="${row.workflow_u}" autocomplete = "off"/><br /> 
				
				v:<input type="text" name="workflow_v" value="${row.workflow_v}" autocomplete = "off"/><br />
				
				w:<input type="text" name="workflow_w" value="${row.workflow_w}" autocomplete = "off"/><br /> 
				
				x:<input type="text" name="workflow_x" value="${row.workflow_x}" autocomplete = "off"/><br />
				
				y:<input type="text" name="workflow_y" value="${row.workflow_y}" autocomplete = "off"/><br />
				
				z:<input type="text" name="workflow_z" value="${row.workflow_z}" autocomplete = "off"/><br />
				
				<input type="text" name="workflow_node_id" value="${row.workflow_node_id}" autocomplete = "off"/><br />
				 
				</c:forEach>
				
				
				<!-- <input type="text" name="workflow_h" value="" autocomplete = "off"/><br />
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
