<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	<STYLE type=text/css> 
body{
	background-color: #dbffd1;
}
.register td{
	height:28px
}
.inputstyle{width:200px;height:28px;border:#C1C1C1 1px solid;font-size:14px;padding:4px 5px 4px;background-color:#FBFBFB;background-position:0 -72px;color:#444}

</STYLE>
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
<body onload="document.getElementById('username').focus();">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">高级管理员登录</font>
</div>
<%if(request.getParameter("info")!=null && request.getParameter("info").equals("error"))out.println("<script type=text/javascript>alert('用户名或密码错误！请重新输入！');</script>"); 
  if(session.getAttribute("Privacy")!=null && Integer.parseInt(session.getAttribute("Privacy").toString())>2)out.println("<script type=text/javascript>top.location='index.jsp';</script>");
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">  <tr>
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;">
		  <form action="AdminLoginCheck" method="post">
	      	<table class="register" width="400" align="center" style="font-size: 14px">
	      		<tr>
	      			<td style="text-align: right"><font style="color:#ff0030">*</font>
	      				高级管理员：
	      			</td>
	      			<td>
	      				<input class="inputstyle" type="text" value="" style="font-size: 16px;color:#adadad" id="username" name="username">
	      			</td>
	      		</tr>
	      		<tr>
	      			<td>&nbsp;</td>
	      			<td>
	      				<font style="font-size: 12px;color:#adadad">输入您的登录名。</font>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td width="25%" style="text-align: right"><font style="color:#ff0030">*</font>
	      				密码：
	      			</td>
	      			<td width="75%">
	      				<input class="inputstyle" type="password" value="" maxlength="20" style="font-size: 16px;color:#adadad" id="password" name="password">
	      			</td>
	      		</tr>
	      		<tr>
	      			<td><input type="hidden" name="id" value=""></td>
	      			<td>
	      				<font style="font-size: 12px;color:#adadad">输入您的密码。</font>
	      			</td>
	      		</tr>
	      		<tr>
	      			<td colspan="2" style="text-align:center">
	      				<input type="image" src="images/btn_login.png" onclick="return check();">&nbsp;&nbsp;&nbsp;
	      				<img src="images/btn_cancel.png" onclick="history.back(-1);">
	      			</td>
	      		</tr>
	      	</table>
	      </form>
        </td>
      </tr>
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
