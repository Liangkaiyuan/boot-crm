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

<title>流程列表-BootCRM</title>

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

<body onload=getMyName()>

	<div id="wrapper">

		<jsp:include page="/WEB-INF/jsp/head.jsp" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">部门列表</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							&nbsp;<a
								href="${pageContext.request.contextPath }/Department/toaddDepartment.action"
								class="btn btn-danger btn-xs">添加部门</a>  
						</div>
						<!-- /.panel-heading -->

						<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>部门ID</th>
									<th>部门名称</th>
									<th>主管级</th>
									<th>经理级</th>
									<th>总监级</th>
									<th>副总经理</th>
									<th>总经理</th>

									<!-- <th>是否完成</th> -->

									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="row">
									<tr style="text-align: center;">
										<td>${row.department_id}</td>
										<td>${row.department_name}</td>
										<td>${row.department_zhuguanji}</td>
										<td>${row.department_jingliji}</td>
										<td>${row.department_zongjianji}</td>
										<td>${row.department_fuzongjingliji}</td>
										<td>${row.department_zongjingliji}</td>
										<%-- <td>${row.workflow_s eq 1 ? '是':'否'}</td> --%>

										<td><a
											href="${pageContext.request.contextPath }/Department/departmentUserList.action?department_id=${row.department_id}"
											class="btn btn-danger btn-xs">部门用户</a>   			
										 <a href="${pageContext.request.contextPath}/Department/toEditDepartment.action?department_id=${row.department_id}" class="btn btn-primary btn-xs">${row.department_id}编辑</a>
   <a href="${pageContext.request.contextPath} /#.action" class="btn btn-danger btn-xs">授权</a> 
											<a href = "${pageContext.request.contextPath }/#.action" class="btn btn-danger btn-xs">删除</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>








						<!-- 弹出框设置经理级 -->

						<div class="modal fade" id="customerEditDialog" tabindex="-1"
							role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">

								<!--  -->

								<form
									action="${pageContext.request.contextPath }/Department/addDepartmentorgOrg.action"
									class="form-horizontal" id="edit_customer_form" method="get">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<h4 class="modal-title" id="myModalLabel">添加部门</h4>
											部门名称:<input type="text" id="department_name"
												name="department_name" value="1" />
										</div>
										<div class="modal-body">
											<div class="form-group">
												<label for="edit_address" class="col-sm-2 control-label">主管级</label>
												<div class="col-sm-10">
													<c:forEach items="${user}" var="row">
														<input type="checkbox" id="department_zhuguanji"
															name="department_zhuguanji" value="${row.user_id}" />${row.user_id}/${row.user_name}<br>
														</td>
													</c:forEach>
												</div>
											</div>

										</div>

									</div>

									<!--  -->


									<div class="modal-content">

										<div class="modal-body">
											<!-- <input type="hidden" id="edit_cust_id" name="cust_id"/> -->
											<div class="form-group">
												<label for="edit_address" class="col-sm-2 control-label">经理级</label>
												<div class="col-sm-10">
													<c:forEach items="${user}" var="row">
														<input type="checkbox" id="department_jingliji"
															name="department_jingliji" value="${row.user_id}" />${row.user_id}/${row.user_name}<br>
														</td>
													</c:forEach>
												</div>
											</div>
										</div>

									</div>
									<!--  -->



									<div class="modal-content">

										<div class="modal-body">
											<!-- <input type="hidden" id="edit_cust_id" name="cust_id"/> -->
											<div class="form-group">
												<label for="edit_address" class="col-sm-2 control-label">总监级</label>
												<div class="col-sm-10">
													<c:forEach items="${user}" var="row">
														<input type="checkbox" id="department_zongjianji"
															name="department_zongjianji" value="${row.user_id}" />${row.user_id}/${row.user_name}<br>
														</td>
													</c:forEach>
												</div>
											</div>
										</div>

									</div>

									<!--  -->

									<div class="modal-content">

										<div class="modal-body">
											<!-- <input type="hidden" id="edit_cust_id" name="cust_id"/> -->
											<div class="form-group">
												<label for="edit_address" class="col-sm-2 control-label">副总经理级</label>
												<div class="col-sm-10">
													<c:forEach items="${user}" var="row">
														<input type="checkbox" id="department_fuzongjingliji"
															name="department_fuzongjingliji" value="${row.user_id}" />${row.user_id}/${row.user_name}<br>
														</td>
													</c:forEach>
												</div>
											</div>
										</div>

									</div>

									<!--  -->


									<div class="modal-content">
										<div class="modal-body">
											<!-- <input type="hidden" id="edit_cust_id" name="cust_id"/> -->
											<div class="form-group">
												<label for="edit_address" class="col-sm-2 control-label">总经理级</label>
												<div class="col-sm-10">
													<c:forEach items="${user}" var="row">
														<input type="checkbox" id="department_zongjingliji"
															name="department_zongjingliji" value="${row.user_id}" />${row.user_id}/${row.user_name}<br>
														</td>
													</c:forEach>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<input type="submit" class="btn btn-primary" value="提交" />
										</div>
									</div>
								</form>


								<script type="text/javascript">
function getMyName(){
var erro = document.getElementById("erro").value;
if (erro.length>0){	
	alert(erro);
	window.location.href="${pageContext.request.contextPath }/roleList.action";
} 
var success = document.getElementById("success").value;
if (success.length>0){	
	alert(success);
	window.location.href="${pageContext.request.contextPath }/roleList.action";
} 
}
</script>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>








						<!-- /.col-lg-12 -->
					</div>
				</div>
				<!-- /#page-wrapper -->

			</div>


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
		function editCustomer(department_id) {
			alert(department_id);
			$.ajax({
				type:"get",
				url:"<%=basePath%>/Department/selectDepartmentOne.action",
				data:{"department_id":department_id},
				success:function(data) {
					alert(123);
					var a = document.getElementById("department_name").value=111112;
					alert(a);
					$("#department_name").val(data.department_name);
					/*$("#department_zhuguanji").val(data.department_zhuguanji)
					$("#department_jingliji").val(data.department_jingliji)
					$("#department_zongjianji").val(data.department_zongjianji)
					$("#department_fuzongjingliji").val(data.department_fuzongjingliji);
					$("#department_zongjingliji").val(data.department_zongjingliji); */
					
				}
			});
		}
		<%-- function updateCustomer() {
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
		}  --%>
	</script>
</body>

</html>
