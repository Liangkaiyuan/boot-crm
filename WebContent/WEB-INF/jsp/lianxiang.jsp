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
    <title>Document</title>
    <script src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js" type="text/javascript"></script>
</head>
<body>

    <input   type="text" id="value" autoComplete="off" /><br /><br /><br /><br /><br />
    <input   type="text" id="value1" autoComplete="off" /><br />

</body>
</html>
<script>
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
    
    function autoShowUser(users,id) {
        id=id||"#value";
        var wd=$(id)[0].clientWidth;
        var hg=$(id)[0].clientHeight;
        var suggest='<ul id="suggest" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin:0px;"></ul>';
        var css_li="#suggest li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: left;padding:1px}";
        css_li+="#suggest li:hover{cursor: pointer;margin: 0px;background-color: rgb(227,227,227);}";
        $(id).after(suggest);
        createstyle(css_li);
        
        $(id).bind('keyup click',function (e) {
            var name= $(this).val();
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
       
        var suggest1='<ul id="suggest1" style="display: none;position:absolute;width: '+wd+'px; background-color: white;padding: 0px;margin:0px;"></ul>';
        var css_li="#suggest1 li{display: block;height:"+hg+";font: 14px/25px '微软雅黑','黑体',sans-serif;margin: 0px;color:rgb(66, 139, 202);text-align: left;padding:1px}";
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
    
   // var users=['22','221','222','223','224','xiao','he','aaa','bb','bbx','bbe',"小红","小红1","小白","小张耿","张红","梁红"];
   var users = ${list};
    autoShowUser(users,'#value');
    autoShowUser1(users,'#value1');
</script>
