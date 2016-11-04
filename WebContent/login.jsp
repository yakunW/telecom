<%@ page language="java" import="java.util.*" pageEncoding="utf-8" session="false"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <title>登录系统</title>
	
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="this is my page">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
    <!--<link rel="stylesheet" type="text/css" href="./styles.css">-->
	<style>
	body{
		MARGIN-RIGHT: 0px; MARGIN-LEFT: 0px; 
		BACKGROUND: url(images/bg.gif) #c2ffe2 repeat-x 50% top; 
		MARGIN-BOTTOM: 0px;TEXT-ALIGN:CENTER;
	}
	
	.TxtUserNameCssClass {
		BORDER-TOP-WIDTH: 0px; PADDING-LEFT: 25px; BORDER-LEFT-WIDTH: 0px; BACKGROUND: url(images/login_name.gif) no-repeat; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 165px; LINE-HEIGHT: 20px; HEIGHT: 21px; BORDER-RIGHT-WIDTH: 0px
	}
	.TxtPasswordCssClass {
		BORDER-TOP-WIDTH: 0px; PADDING-LEFT: 25px; BORDER-LEFT-WIDTH: 0px; BACKGROUND: url(images/login_password.gif) no-repeat; BORDER-BOTTOM-WIDTH: 0px; WIDTH: 165px; LINE-HEIGHT: 20px; HEIGHT: 21px; BORDER-RIGHT-WIDTH: 0px
	}
	</style>
	<script type="text/javascript">
		function check(){
			if(document.getElementById('username').value.length==0)
			{
				alert('请您输入用户名！');
				document.getElementById('username').focus();
				return false;
			}
			if(document.getElementById('password').value.length==0)
			{
				alert('请您输入密码！');
				document.getElementById('password').focus();
				return false;
			}
			return true;
		}
	</script>
  </head>
  
  <body onload="document.getElementById('username').focus()">
  
  <%if(request.getParameter("info")!=null && request.getParameter("info").equals("error"))out.println("<script type=text/javascript>alert('用户名或密码错误！请重新输入！');</script>"); %>
	<table align="center" border="0" style="margin-top:0px;margin-bottom: 0px;width:1000px;height:100%;">
		
		<tr>
			<td width="100%" height="100" colspan="2" background="images/title.png" style="background-repeat: no-repeat;">&nbsp;</td>
		</tr>
		<tr>
			<td width="100%" height="6" colspan="2"></td>
		</tr>
		
		<tr>
			<td width="200">&nbsp;</td>
			<td width="800" height="482" background="images/login_bg.png" style="background-repeat: no-repeat;">
				<form action="LoginCheck" method="post">
				<table width="280" height="150" style="margin-left:350px;margin-top:120px;margin-bottom:200px;">
					<tr>
						<td width=80 style="text-align:right">用户名：</td>
						<td><INPUT class=TxtUserNameCssClass id="username" maxLength=20 name="username"></td>
					</tr>
					<tr>
						<td style="text-align:right">密码：</td>
						<td><INPUT class=TxtPasswordCssClass id="password" type=password name="password"></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align:center">
							<input type="submit" value="登录" style="width:60px" onclick="return check()">
							&nbsp;&nbsp;<input type="button" value="取消" style="width:60px">
						</td>
					</tr>
				</table>
			</form>
			</td>
		</tr>		
		<tr>
			<td><a href="http://61.134.53.24:8080/AndroidDemo.apk"><img src="images/icon1.png"></a></td>
			<td colspan="2">
			<table style="color:#7600c1;font-size:12px;" align="center">
			<tr>
			
			<td valign="middle"><font face="黑体" color="#000000" style="font-size:15px;">版权所有@：</font></td>
			<td valign="middle"><font face="黑体" color="#000000" style="font-size:15px;">北京博通网安信息技术研究中心</font>
			<br/><font face="黑体" color="#000000" style="font-size:15px;">陕西省铜川市电信分公司</font></td>
			<td valign="middle"><img  src="images/anm.png" > </td>
			</tr>
			</table>
			</td>
		</tr>
	</table>
  </body>
</html>