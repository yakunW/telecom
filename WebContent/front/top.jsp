<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>top.html</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
	<style>
	.menu { height: 45px; display: block; }
	.menu ul { list-style: none; padding: 0; margin: 0; width:100%}
	.menuli { float: left; background: url(images/bg_over.gif) center center no-repeat; 
				overflow: hidden; position: relative; text-align: center; line-height: 45px; }
	.menuli a { color: #fff; 
				position: relative; display: block; width: 130px; height: 45px; 
	 font-size: 13px; font-weight: normal; letter-spacing: 1px; text-transform: uppercase; text-decoration: none; cursor: pointer; }
	
	#menu { background:url(images/bg_menu.gif) scroll 0 -1px repeat-x; border:1px solid #CCC; }
	.menuspan{
	padding-left:1040px;padding-top:8px;font-size: 14px;line-height:14px;
	}
	.menuspan a{
	font-size: 14px;
	}
	</style>

  </head>
  
  <body style="margin-left:0px;margin-right:0px;background-color: #EEF2FB;font-size: 13px">
    <table width="100%" style="margin-left:0px;margin-right:0px;" border="0" cellpadding="0" cellspacing="0">
    	<tr>
    		<td width="176" bgcolor="#4ad34d" height="100" background="images/logo.png" style="background-repeat: no-repeat;"></td>
    		<td height="100" bgcolor="#4ad34d" style="text-align:center;"><img src="images/title.png"></td>
    	</tr>
    	<tr>
    		<td colspan="2">
    		  <div id="menu" class="menu">
			    <ul>
			      <li class="menuli"><a href="javascript:;">首页</a></li>
			      <li class="menuli"><a href="javascript:;">安防巡检支撑</a></li>
			      <li class="menuli"><a href="javascript:;">基站配置定位</a></li>
			      <li class="menuli"><a href="javascript:;">巡检统计查询</a></li>
			      <li class="menuli"><a href="javascript:;">电量检测统计</a></li>
			      <li class="menuli"><a href="javascript:;">系统综合管理</a></li>
			      <li class="menuspan">
					欢迎您，<%=session.getAttribute("UserName") %>！
					<%if(session.getAttribute("Privacy").equals("2")){%>
					<input type="button" onclick="if(confirm('您确定要退出系统吗？'))top.location='LogOut'" value="退出登录"/>
					<%}else if(Integer.parseInt(session.getAttribute("Privacy").toString())>2){%>
					<input type="button" onclick="if(confirm('您确定要退出后台管理系统吗？'))top.location='LogOut'" value="退出登录"/>
					<%} %>
				  </li>
			    </ul>
			  </div>
    		</td>
    	</tr>
    </table>
    
  </body>
</html>
