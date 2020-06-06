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

<title>未创建节点信息流程</title>

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
<h4 style="text-align: center;">更新节点信息</h4>

<!-- --------------------------------- -->
			 <form class="form-inline" action="${pageContext.request.contextPath }/updateApproval.action" method="get">
				 
						<div class="form-group" style="display: none;"><!--  style="display: none;" -->
							<label for="customerFrom">节点id:</label> 
							<select	class="form-control" id="Node_id" name="Node_id">
								 <option value="${Node_id}">${Node_id}</option>
							</select>
						</div>
						<div class="form-group" style="display: none;"><!--  style="display: none;" -->
							<label for="customerFrom">流程id:用户修改后跳转到已经修改后的界面</label> 
							<select	class="form-control" id="node_workflowid" name="node_workflowid">
								 <option value="${node_workflowid}">${node_workflowid}</option>
							</select>
						</div>
						
						<div class="form-group">
							<label for="customerFrom">流程名称:</label> 
							<select	class="form-control" id="" name="">
								 <option value="${node_workflowname}">${node_workflowname}</option>
							</select>
						</div>
						<br /><br /> 
						<div class="form-group">
							<label for="customerFrom">创建者</label> 
							<select	class="form-control" id="node_approvalone" name="node_approvalone">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalOne}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						<br /><br />
						<div class="form-group">
							<label for="custIndustry">第一审批信息</label> 
							<select	class="form-control" id="node_approvaltwo"  name="node_approvaltwo">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalTwo}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						<br /><br />
						<div class="form-group">
							<label for="custLevel">第二审批信息</label>
							<select	class="form-control" id="node_approvalthree" name="node_approvalthree">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalThree}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						<br /><br />
						<div class="form-group">
							<label for="custLevel">第三审批信息</label>
							<select	class="form-control" id="node_approvalfour" name="node_approvalfour">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalFour}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						<br /><br />
						<div class="form-group">
							<label for="custLevel">第四审批信息</label>
							<select	class="form-control" id="node_approvalfive" name="node_approvalfive">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalFive}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						<br /><br />
						<div class="form-group">
							<label for="custLevel">归档</label>
							<select	class="form-control" id="node_approvalsix" name="node_approvalsix">
								<option value="">--请选择--</option>
								<c:forEach items="${ApprovalSix}" var="item">
									<option value="${item.approval_value}"<c:if test="${item.approval_id == 001}"> selected</c:if>>${item.approval_value }</option>
								</c:forEach>
							</select>
						</div>
						
						<br /><br />
						<button type="submit" class="btn btn-primary">提交</button>
					</form>
					
					
					
					
					<!-- ------------------ -->
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
