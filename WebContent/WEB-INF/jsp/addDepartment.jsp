<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>	
<%@ page language="java" import="java.util.ArrayList"%>
<%@ page language="java" import="java.util.HashMap"%>
<%@ page language="java" import="java.util.List"%>
<%@ page language="java" import="java.util.Map"%>
	
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

<title>添加部门</title>

 

 
</head>

<body>

	<div id="wrapper">
  

<jsp:include page="/WEB-INF/jsp/head.jsp" /> 


 

		<!-- 登录界面 -->
		<div style="text-align: center;">
        <h4 style="text-align: center;">添加部门</h4>
          
			<form action="${pageContext.request.contextPath }/Department/addDepartment.action" method="post">
				 
	                      部门名称：<input type="text"   name="department_name" placeholder="部门名称" autocomplete = "off"/><br /> <br /> 
			 主管级：<input type="text" id="value" name="department_zhuguanji" placeholder="主管级" autocomplete = "off"/><br /> <br /> 
			 经理级：<input type="text" id="value1" name="department_jingliji" placeholder="经理级" autocomplete = "off"/><br /> <br /> 
			 总监级：<input type="text" id="value2" name="department_zongjianji" placeholder="总监级" autocomplete = "off"/><br /> <br /> 
			 副总经理：<input type="text" id="value3" name="department_fuzongjingliji" placeholder="副总经理" autocomplete = "off"/><br /> <br /> 
			 总经理：<input type="text" id="value4" name="department_zongjingliji" placeholder="总经理" autocomplete = "off"/><br /> <br /> 
			 
				<input type="submit" type="text" value="提交"/> 
				
				<input type="reset" type="text" value="重置"/>
			</form>
		</div>
		<!-- 登录界面 -->




<!-- <script> 
function login() {
	
	  
	 var url = '${pageContext.request.contextPath }/Department/findUserNameByuser_pinyin.action';
	 
	  $.ajax({
	      url:url,
	      type:"POST",
	      data:{user_pinyin:"lky"},
	      dataType:"html",
	      success:function () {
	          alert("123");
	      }
	  })
	}
	         
</script> -->



  



<script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
  
<script>

/* ------------------------------------------------------------------------------------------------ */
    function createstyle(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('head').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function createstyle1(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('input').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function createstyle2(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('input').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function createstyle3(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('input').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function createstyle4(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('input').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function createstyle5(css){
        var mystyle=$('#mystyle');
        if(!mystyle.length>0){
            var style="<style id='mystyle' text-align: center;></style>";
            $(document).find('input').append(style);
            mystyle=$('#mystyle');
        }
        mystyle.append(css);
    }
    
    function autoShowUser(map,id) {
    	login();
        id=id||"#value";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
        var suggest='<ul id="suggest" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest);
        createstyle(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            
 /* 前台传递一个map，以及传递一个匹配key，返回一个刚好可以变量的数据
            
            现在需要 确认遍历的数据以及调用方法的时机
            
            
            */
             
         /* 
            List<String> list=new ArrayList<String>();
            for (Map.Entry<String, String> entity : map.entrySet()) {
                if(entity.getKey().indexOf(name)>-1){
                	list.add((String) entity.getValue());
                }

            }
            
            var users = list.toString();
             */
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            var num=0;
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                if(html !=''){
                    $('#suggest').show();
                    $('#suggest').html(html);
                    $('#suggest li').css(css_li);
                    $('#suggest li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest').hide();
                    });
                }
            }else{

                $('#suggest').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest').hide();
            },150);
        })

    }
    
    
    
    
    function autoShowUser1(users,id) {
        id=id||"#value1";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
       
        var suggest1='<ul id="suggest1" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest1 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest1 li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest1);
        createstyle1(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            var num=0;
            /* 遍历用户 */
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                /* 往input里面填写所选择的东西 */
                if(html !=''){
                    $('#suggest1').show();
                    $('#suggest1').html(html);
                    $('#suggest1 li').css(css_li);
                    $('#suggest1 li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest1').hide();
                    });
                }
            }else{

                $('#suggest1').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest1').hide();
            },150);
        })

    }
    
    
    function autoShowUser2(users,id) {
        id=id||"#value2";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
       
        var suggest2='<ul id="suggest2" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest2 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest2 li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest2);
        createstyle2(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            var num=0;
            /* 遍历用户 */
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                /* 往input里面填写所选择的东西 */
                if(html !=''){
                    $('#suggest2').show();
                    $('#suggest2').html(html);
                    $('#suggest2 li').css(css_li);
                    $('#suggest2 li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest2').hide();
                    });
                }
            }else{

                $('#suggest2').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest2').hide();
            },150);
        })

    }
    
    function autoShowUser3(users,id) {
        id=id||"#value3";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
       
        var suggest3='<ul id="suggest3" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest3 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest3 li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest3);
        createstyle3(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            
            
           
            
            
            
            
            
            
            
            
            
            var num=0;
            /* 遍历用户 */
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                /* 往input里面填写所选择的东西 */
                if(html !=''){
                    $('#suggest3').show();
                    $('#suggest3').html(html);
                    $('#suggest3 li').css(css_li);
                    $('#suggest3 li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest3').hide();
                    });
                }
            }else{

                $('#suggest3').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest3').hide();
            },150);
        })

    }
    
    function autoShowUser4(users,id) {
        id=id||"#value4";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
       
        var suggest4='<ul id="suggest4" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest4 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest4 li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest4);
        createstyle4(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            var num=0;
            /* 遍历用户 */
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                /* 往input里面填写所选择的东西 */
                if(html !=''){
                    $('#suggest4').show();
                    $('#suggest4').html(html);
                    $('#suggest4 li').css(css_li);
                    $('#suggest4 li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest4').hide();
                    });
                }
            }else{

                $('#suggest4').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest4').hide();
            },150);
        })

    }
    
    
    function autoShowUser5(users,id) {
        id=id||"#value5";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
       
        var suggest5='<ul id="suggest5" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin-left:720px;margin-top:0px;"></ul>';
        var css_li="#suggest5 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: center;padding:1px}";
        css_li+="#suggest5 li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest5);
        createstyle5(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
            var num=0;
            /* 遍历用户 */
            if(name!='' ){
                var html='';
                for (var i=0;i<users.length;i++){
                    if(users[i].indexOf(name)>-1){
                        html += "<li>" +users[i]+"</li>";
                        num++;
                    }
                    if(num>9){
                        break;
                    }
                }
                /* 往input里面填写所选择的东西 */
                if(html !=''){
                    $('#suggest5').show();
                    $('#suggest5').html(html);
                    $('#suggest5 li').css(css_li);
                    $('#suggest5 li').bind('click',function(e){
                        $(id).val($(e.target).html());
                        $('#suggest5').hide();
                    });
                }
            }else{

                $('#suggest5').hide();
            }
        });

        $(id).blur(function () {
            setTimeout(function () {
                $('#suggest5').hide();
            },150);
        })

    }
    
    
   // var users=['22','221','222','223','224','xiao','he','aaa','bb','bbx','bbe',"小红","小红1","小白","小张耿","张红","梁红"];
   var users = ${list};
    //autoShowUser(users,'#value');
    var map = ${map};
    
    //autoShowUser(map,'#value');
    autoShowUser1(users,'#value1');
    autoShowUser2(users,'#value2');
    autoShowUser3(users,'#value3');
    autoShowUser4(users,'#value4');
    autoShowUser5(users,'#value5');
    
</script>  


</body>

</html>
