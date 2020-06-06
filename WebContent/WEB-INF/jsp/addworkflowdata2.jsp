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

<title>新建流程-BootCRM</title>

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
<!--页面加载时执行js判断 -->
<body onload="sw()">

	<div id="wrapper">
 
 

<jsp:include page="/WEB-INF/jsp/head.jsp" /> 


 

		<!-- 提交界面 -->
		<div style="text-align: center;">

			<form action="${pageContext.request.contextPath }/workflow/addworkflowdata.action" method="post">
			
			<c:forEach items="${page}" var="row">
			<input type="text" style="display: none" id="workflow_id" workflow_id="${row.workflow_id}" value="${row.workflow_id}" name="workflow_id" placeholder="id" autocomplete = "off"/><br /> 
				
			  <input type="text" style="display: none" id="workflow_name" workflow_name="${row.workflow_name}" value="${row.workflow_name}" name="workflow_name" placeholder="id" autocomplete = "off"/><br /> 
				
				${row.workflow_name},${row.workflow_memo}<br />
				  
				${row.workflow_a}     <input type="text" id = "workflow_a" workflow_a="${row.workflow_a}" name="workflow_data_a" placeholder="a" autocomplete = "off"/><br /> 
				
				${row.workflow_b}     <input type="text" id = "workflow_b" workflow_b="${row.workflow_b}" name="workflow_data_b" placeholder="b" autocomplete = "off"/><br />
				
				${row.workflow_c}     <input type="text" id = "workflow_c" workflow_c="${row.workflow_c}" name="workflow_data_c" placeholder="c" autocomplete = "off"/><br /> 
				
				${row.workflow_d}     <input type="text" id = "workflow_d" workflow_d="${row.workflow_d}" name="workflow_data_d" placeholder="d" autocomplete = "off"/><br />
				
				${row.workflow_e}     <input type="text" id = "workflow_e" workflow_e="${row.workflow_e}" name="workflow_data_e" placeholder="e" autocomplete = "off"/><br /> 
				
				${row.workflow_f}     <input type="text" id = "workflow_f" workflow_f="${row.workflow_f}" name="workflow_data_f" placeholder="f" autocomplete = "off"/><br />
				
				${row.workflow_g}     <input type="text" id = "workflow_g" workflow_g="${row.workflow_g}" name="workflow_data_g" placeholder="g" autocomplete = "off"/><br />
				
				${row.workflow_h}     <input type="text" id = "workflow_h" workflow_h="${row.workflow_h}" name="workflow_data_h" placeholder="h" autocomplete = "off"/><br />
				
				${row.workflow_i}     <input type="text" id = "workflow_i" workflow_i="${row.workflow_i}" name="workflow_data_i" placeholder="i" autocomplete = "off"/><br /> 
				
				${row.workflow_j}     <input type="text" id = "workflow_j" workflow_j="${row.workflow_j}" name="workflow_data_j" placeholder="j" autocomplete = "off"/><br />
				
				${row.workflow_k}     <input type="text" id = "workflow_k" workflow_k="${row.workflow_k}" name="workflow_data_k" placeholder="k" autocomplete = "off"/><br /> 
				
				${row.workflow_l}     <input type="text" id = "workflow_l" workflow_l="${row.workflow_l}" name="workflow_data_l" placeholder="l" autocomplete = "off"/><br />
				
				${row.workflow_m}     <input type="text" id = "workflow_m" workflow_m="${row.workflow_m}" name="workflow_data_m" placeholder="m" autocomplete = "off"/><br />
				
				${row.workflow_n}     <input type="text" id = "workflow_n" workflow_n="${row.workflow_n}" name="workflow_data_n" placeholder="n" autocomplete = "off"/><br />
				
				${row.workflow_o}     <input type="text" id = "workflow_o" workflow_o="${row.workflow_o}" name="workflow_data_o" placeholder="o" autocomplete = "off"/><br /> 
				
				${row.workflow_p}     <input type="text" id = "workflow_p" workflow_p="${row.workflow_p}" name="workflow_data_p" placeholder="p" autocomplete = "off"/><br />
				
				${row.workflow_q}     <input type="text" id = "workflow_q" workflow_q="${row.workflow_q}" name="workflow_data_q" placeholder="q" autocomplete = "off"/><br /> 
				
				${row.workflow_r}     <input type="text" id = "workflow_r" workflow_r="${row.workflow_r}" name="workflow_data_r" placeholder="r" autocomplete = "off"/><br />
				
				<%-- ${row.workflow_s}     <input type="text" id = "workflow_s" workflow_b="${row.workflow_s}" name="workflow_data_s" placeholder="s" autocomplete = "off"/><br />
				 --%>
				${row.workflow_t}     <input type="text" id = "workflow_t" workflow_t="${row.workflow_t}" name="workflow_data_t" placeholder="t" autocomplete = "off"/><br />
				
				${row.workflow_u}     <input type="text" id = "workflow_u" workflow_u="${row.workflow_u}" name="workflow_data_u" placeholder="u" autocomplete = "off"/><br /> 
				
				${row.workflow_v}     <input type="text" id = "workflow_v" workflow_v="${row.workflow_v}" name="workflow_data_v" placeholder="v" autocomplete = "off"/><br />
				
				${row.workflow_w}     <input type="text" id = "workflow_w" workflow_w="${row.workflow_w}" name="workflow_data_w" placeholder="w" autocomplete = "off"/><br /> 
				
				${row.workflow_x}     <input type="text" id = "workflow_x" workflow_x="${row.workflow_x}" name="workflow_data_x" placeholder="x" autocomplete = "off"/><br />
				
				${row.workflow_y}     <input type="text" id = "workflow_y" workflow_y="${row.workflow_y}" name="workflow_data_y" placeholder="y" autocomplete = "off"/><br />
				
				${row.workflow_z}     <input type="text" id = "workflow_z" workflow_z="${row.workflow_z}" name="workflow_data_z" placeholder="z" autocomplete = "off"/><br />
				
				${row.workflow_node_id}    <input type="text" id="workflow_node_id" workflow_node_id = "${row.workflow_node_id}" name="workflow_data_node_id" placeholder="审批流id" autocomplete = "off"/><br />
				 
				
				
				</c:forEach>
				
				<!-- <input type="text" name="workflow_h" placeholder="" autocomplete = "off"/><br />
			 用作用户id输入-->	
				<input type="submit" type="text" value="创建流程"/> <input type="reset" type="text" value="重置"/>
			</form>
		</div>
		<!-- 登录界面 -->

	</div>
	<!-- /#wrapper -->



 <script type="text/javascript">
         function sw(){
        	 
        	 
        	 var workflow_name = document.getElementById("workflow_name").getAttribute("workflow_name");
        	 var workflow_id = document.getElementById("workflow_id").getAttribute("workflow_id"); 
        	 var workflow_a = document.getElementById("workflow_a").getAttribute("workflow_a");
        	 var workflow_b = document.getElementById("workflow_b").getAttribute("workflow_b");
        	 var workflow_c = document.getElementById("workflow_c").getAttribute("workflow_c");
        	 var workflow_d = document.getElementById("workflow_d").getAttribute("workflow_d");
        	 var workflow_e = document.getElementById("workflow_e").getAttribute("workflow_e");
        	 var workflow_f = document.getElementById("workflow_f").getAttribute("workflow_f");
        	 var workflow_g = document.getElementById("workflow_g").getAttribute("workflow_g");
        	 var workflow_h = document.getElementById("workflow_h").getAttribute("workflow_h");
        	 var workflow_i = document.getElementById("workflow_i").getAttribute("workflow_i");
        	 var workflow_j = document.getElementById("workflow_j").getAttribute("workflow_j");
        	 var workflow_k = document.getElementById("workflow_k").getAttribute("workflow_k");
        	 var workflow_l = document.getElementById("workflow_l").getAttribute("workflow_l");
        	 var workflow_m = document.getElementById("workflow_m").getAttribute("workflow_m");
        	 var workflow_n = document.getElementById("workflow_n").getAttribute("workflow_n");
        	 var workflow_o = document.getElementById("workflow_o").getAttribute("workflow_o");
        	 var workflow_p = document.getElementById("workflow_p").getAttribute("workflow_p");
        	 var workflow_q = document.getElementById("workflow_q").getAttribute("workflow_q");
        	 var workflow_r = document.getElementById("workflow_r").getAttribute("workflow_r");
/*         	 var workflow_s = document.getElementById("workflow_s").getAttribute("workflow_s");
 */        	 var workflow_t = document.getElementById("workflow_t").getAttribute("workflow_t");
        	 var workflow_u = document.getElementById("workflow_u").getAttribute("workflow_u");
        	 var workflow_v = document.getElementById("workflow_v").getAttribute("workflow_v");
        	 var workflow_w = document.getElementById("workflow_w").getAttribute("workflow_w");
        	 var workflow_x = document.getElementById("workflow_x").getAttribute("workflow_x");
        	 var workflow_y = document.getElementById("workflow_y").getAttribute("workflow_y");
        	 var workflow_z = document.getElementById("workflow_z").getAttribute("workflow_z");
        	 var workflow_node_id = document.getElementById("workflow_node_id").getAttribute("workflow_node_id");
       
        	 if(typeof workflow_name == "undefined" || workflow_name == null || workflow_name == ""){
                 document.getElementById("workflow_name").style.display="none";
                 }else{
                 	 document.getElementById("workflow_name").style.display="show";
                 }
         
        	 if(typeof workflow_id == "undefined" || workflow_id == null || workflow_id == ""){
                 document.getElementById("workflow_id").style.display="none";
                 }else{
                 	 document.getElementById("workflow_id").style.display="show";
                 }
        	 
               if(typeof workflow_a == "undefined" || workflow_a == null || workflow_a == ""){
               document.getElementById("workflow_a").style.display="none";
               }else{
               	 document.getElementById("workflow_a").style.display="show";
               }
               if(typeof workflow_b == "undefined" || workflow_b == null || workflow_b == ""){
                   document.getElementById("workflow_b").style.display="none";
                   }else{
                   	 document.getElementById("workflow_b").style.display="show";
                   }
               if(typeof workflow_c == "undefined" || workflow_c == null || workflow_c == ""){
                   document.getElementById("workflow_c").style.display="none";
                   }else{
                   	 document.getElementById("workflow_c").style.display="show";
                   }
               if(typeof workflow_d == "undefined" || workflow_d == null || workflow_d == ""){
                   document.getElementById("workflow_d").style.display="none";
                   }else{
                   	 document.getElementById("workflow_d").style.display="show";
                   }
               if(typeof workflow_e == "undefined" || workflow_e == null || workflow_e == ""){
                   document.getElementById("workflow_e").style.display="none";
                   }else{
                   	 document.getElementById("workflow_e").style.display="show";
                   }
               if(typeof workflow_f == "undefined" || workflow_f == null || workflow_f == ""){
                   document.getElementById("workflow_f").style.display="none";
                   }else{
                   	 document.getElementById("workflow_f").style.display="show";
                   }
               if(typeof workflow_g == "undefined" || workflow_g == null || workflow_g == ""){
                   document.getElementById("workflow_g").style.display="none";
                   }else{
                   	 document.getElementById("workflow_g").style.display="show";
                   }
               if(typeof workflow_h == "undefined" || workflow_h == null || workflow_h == ""){
                   document.getElementById("workflow_h").style.display="none";
                   }else{
                   	 document.getElementById("workflow_h").style.display="show";
                   }
               if(typeof workflow_i == "undefined" || workflow_i == null || workflow_i == ""){
                   document.getElementById("workflow_i").style.display="none";
                   }else{
                   	 document.getElementById("workflow_i").style.display="show";
                   }
               if(typeof workflow_j == "undefined" || workflow_j == null || workflow_j == ""){
                   document.getElementById("workflow_j").style.display="none";
                   }else{
                   	 document.getElementById("workflow_j").style.display="show";
                   }
               if(typeof workflow_k == "undefined" || workflow_k == null || workflow_k == ""){
                   document.getElementById("workflow_k").style.display="none";
                   }else{
                   	 document.getElementById("workflow_k").style.display="show";
                   }
               if(typeof workflow_l == "undefined" || workflow_l == null || workflow_l == ""){
                   document.getElementById("workflow_l").style.display="none";
                   }else{
                   	 document.getElementById("workflow_l").style.display="show";
                   }
               if(typeof workflow_m == "undefined" || workflow_m == null || workflow_m == ""){
                   document.getElementById("workflow_m").style.display="none";
                   }else{
                   	 document.getElementById("workflow_m").style.display="show";
                   }
               if(typeof workflow_n == "undefined" || workflow_n == null || workflow_n == ""){
                   document.getElementById("workflow_n").style.display="none";
                   }else{
                   	 document.getElementById("workflow_n").style.display="show";
                   }
               if(typeof workflow_o == "undefined" || workflow_o == null || workflow_o == ""){
                   document.getElementById("workflow_o").style.display="none";
                   }else{
                   	 document.getElementById("workflow_o").style.display="show";
                   }
               if(typeof workflow_p == "undefined" || workflow_p == null || workflow_p == ""){
                   document.getElementById("workflow_p").style.display="none";
                   }else{
                   	 document.getElementById("workflow_p").style.display="show";
                   }
               if(typeof workflow_q == "undefined" || workflow_q == null || workflow_q == ""){
                   document.getElementById("workflow_q").style.display="none";
                   }else{
                   	 document.getElementById("workflow_q").style.display="show";
                   }
               if(typeof workflow_r == "undefined" || workflow_r == null || workflow_r == ""){
                   document.getElementById("workflow_r").style.display="none";
                   }else{
                   	 document.getElementById("workflow_r").style.display="show";
                   }
              /*  if(typeof workflow_s == "undefined" || workflow_s == null || workflow_s == ""){
                   document.getElementById("workflow_s").style.display="none";
                   }else{
                   	 document.getElementById("workflow_s").style.display="show";
                   } */
               if(typeof workflow_t == "undefined" || workflow_t == null || workflow_t == ""){
                   document.getElementById("workflow_t").style.display="none";
                   }else{
                   	 document.getElementById("workflow_t").style.display="show";
                   }
               if(typeof workflow_u == "undefined" || workflow_u == null || workflow_u == ""){
                   document.getElementById("workflow_u").style.display="none";
                   }else{
                   	 document.getElementById("workflow_u").style.display="show";
                   }
               if(typeof workflow_v == "undefined" || workflow_v == null || workflow_v == ""){
                   document.getElementById("workflow_v").style.display="none";
                   }else{
                   	 document.getElementById("workflow_v").style.display="show";
                   }
               if(typeof workflow_w == "undefined" || workflow_w == null || workflow_w == ""){
                   document.getElementById("workflow_w").style.display="none";
                   }else{
                   	 document.getElementById("workflow_w").style.display="show";
                   }
               if(typeof workflow_x == "undefined" || workflow_x == null || workflow_x == ""){
                   document.getElementById("workflow_x").style.display="none";
                   }else{
                   	 document.getElementById("workflow_x").style.display="show";
                   }
               if(typeof workflow_y == "undefined" || workflow_y == null || workflow_y == ""){
                   document.getElementById("workflow_y").style.display="none";
                   }else{
                   	 document.getElementById("workflow_y").style.display="show";
                   }
               if(typeof workflow_z == "undefined" || workflow_z == null || workflow_z == ""){
                   document.getElementById("workflow_z").style.display="none";
                   }else{
                   	 document.getElementById("workflow_z").style.display="show";
                   }
              /*  if(typeof workflow_name == "undefined" || workflow_name == null || workflow_name == ""){
                   document.getElementById("workflow_name").style.display="none";
                   }else{
                   	 document.getElementById("workflow_name").style.display="show";
                   }
               if(typeof workflow_memo == "undefined" || workflow_memo == null || workflow_memo == ""){
                   document.getElementById("workflow_memo").style.display="none";
                   }else{
                   	 document.getElementById("workflow_memo").style.display="show";
                   } */
               if(typeof workflow_node_id == "undefined" || workflow_node_id == null || workflow_node_id == ""){
                   document.getElementById("workflow_node_id").style.display="none";
                   }else{
                   	 document.getElementById("workflow_node_id").style.display="show";
                   }
              
            
            
         }
  </script>

	
	
	











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

<%-- 	<script type="text/javascript">
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
	</script> --%>
	
	
</body>

</html>
