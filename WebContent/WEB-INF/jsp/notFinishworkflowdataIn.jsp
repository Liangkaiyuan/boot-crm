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

<title>流程列表-BootCRM-未完成里</title>

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

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">未完成流程明细管理</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->
		 
			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">流程信息列表</div>
						<!-- /.panel-heading -->
						<table class="table table-bordered table-striped">
							<thead>
								<tr>
								<c:forEach items="${workflow}" var="row">
										<th>${row.workflow_name}</th>
										<th>${row.workflow_a}</th>
										<th>${row.workflow_b}</th>
										<th>${row.workflow_c}</th>
										<th>${row.workflow_d}</th>
										<th>${row.workflow_e}</th>
										<th>${row.workflow_f}</th>
										<th>${row.workflow_g}</th>
										<th>${row.workflow_h}</th>
										<th>${row.workflow_i}</th>
										<th>${row.workflow_i}</th>
										<th>${row.workflow_k}</th>
										<th>${row.workflow_l}</th>
										<th>${row.workflow_m}</th>
										<th>${row.workflow_n}</th>
										<th>${row.workflow_o}</th>
										<th>${row.workflow_p}</th>
										<th>${row.workflow_q}</th>
										<%-- <th>${row.workflow_r}</th> --%>
										<th>${row.workflow_s}</th>
										<th>${row.workflow_t}</th>
										<th>${row.workflow_u}</th>
										<th>${row.workflow_v}</th>
										<th>${row.workflow_w}</th>
										<th>${row.workflow_x}</th>
										<th>${row.workflow_y}</th>
										<th>${row.workflow_z}</th>
									 
									<th>操作</th>
									
									</c:forEach>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${page}" var="row">
									<tr>
										<td>${row.workflow_name}</td>
										<td>${row.workflow_data_a}</td>
										<td>${row.workflow_data_b}</td>
										<td>${row.workflow_data_c}</td>
										<td>${row.workflow_data_d}</td>
										<td>${row.workflow_data_e}</td>
										<td>${row.workflow_data_f}</td>
										<td>${row.workflow_data_g}</td>
										<td>${row.workflow_data_h}</td>
										<td>${row.workflow_data_i}</td>
										<td>${row.workflow_data_i}</td>
										<td>${row.workflow_data_k}</td>
										<td>${row.workflow_data_l}</td>
										<td>${row.workflow_data_m}</td>
										<td>${row.workflow_data_n}</td>
										<td>${row.workflow_data_o}</td>
										<td>${row.workflow_data_p}</td>
										<td>${row.workflow_data_q}</td>
										<%-- <td>${row.workflow_data_r}</td> --%>
										<td>${row.workflow_data_s eq 1 ? '未完成':'已完成'}</td>
										<td>${row.workflow_data_t}</td>
										<td>${row.workflow_data_u}</td>
										<td>${row.workflow_data_v}</td>
										<td>${row.workflow_data_w}</td>
										<td>${row.workflow_data_x}</td>
										<td>${row.workflow_data_y}</td>
										<td>${row.workflow_data_z}</td>
										 
										<td>
											<a href="${pageContext.request.contextPath }/workflow/notFinishworkflowdataIn.action?workflow_id=${row.workflow_id}" class="btn btn-danger btn-xs">进入</a>
											<a href="#" class="btn btn-danger btn-xs">删除</a>
										</td>
									</tr>
								</c:forEach>
						</tbody>
						</table>
						<%-- <div class="col-md-12 text-right">
							<itcast:page url="${pageContext.request.contextPath }/workflow/list.action" />
						</div> --%>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
		</div>
		<!-- /#page-wrapper -->

	</div>
	<!-- 客户编辑对话框 -->
	<div class="modal fade" id="customerEditDialog" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">修改客户信息</h4>
				</div>
				<div class="modal-body">
					<form class="form-horizontal" id="edit_customer_form">
						<input type="hidden" id="edit_cust_id" name="cust_id"/>
						<div class="form-group">
							<label for="edit_customerName" class="col-sm-2 control-label">客户名称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_customerName" placeholder="客户名称" name="cust_name" autocomplete = "off">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_customerFrom" style="float:left;padding:7px 15px 0 27px;">客户来源</label> 
							<div class="col-sm-10">
								<select	class="form-control" id="edit_customerFrom" placeholder="客户来源" name="cust_source">
									<option value="">--请选择--</option>
									<c:forEach items="${fromType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custSource}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custIndustry" style="float:left;padding:7px 15px 0 27px;">所属行业</label>
							<div class="col-sm-10"> 
								<select	class="form-control" id="edit_custIndustry"  name="cust_industry">
									<option value="">--请选择--</option>
									<c:forEach items="${industryType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custIndustry}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_custLevel" style="float:left;padding:7px 15px 0 27px;">客户级别</label>
							<div class="col-sm-10">
								<select	class="form-control" id="edit_custLevel" name="cust_level">
									<option value="">--请选择--</option>
									<c:forEach items="${levelType}" var="item">
										<option value="${item.dict_id}"<c:if test="${item.dict_id == custLevel}"> selected</c:if>>${item.dict_item_name }</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="edit_linkMan" class="col-sm-2 control-label">联系人</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_linkMan" placeholder="联系人" name="cust_linkman">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_phone" class="col-sm-2 control-label">固定电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_phone" placeholder="固定电话" name="cust_phone">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_mobile" class="col-sm-2 control-label">移动电话</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_mobile" placeholder="移动电话" name="cust_mobile">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_zipcode" class="col-sm-2 control-label">邮政编码</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_zipcode" placeholder="邮政编码" name="cust_zipcode">
							</div>
						</div>
						<div class="form-group">
							<label for="edit_address" class="col-sm-2 control-label">联系地址</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="edit_address" placeholder="联系地址" name="cust_address">
							</div>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" onclick="updateCustomer()">保存修改</button>
				</div>
			</div>
		</div>
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
