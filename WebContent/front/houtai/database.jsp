<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/houtai/";
request.setAttribute("path", basePath);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="../images/skin.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="../css/commonstyle.css">
	<link href="../css/button.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript"
  	  src="../js/My97DatePicker/WdatePicker.js">
    </script>
    <script type="text/javascript" src="../js/check.js" charset="utf-8"></script>
	<style>
		.include table{
			text-align: center;
			width:80%;
		}
		.include tr{
			width:100%;
		}
	</style>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
}
</STYLE>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">数据库管理</font>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">  <tr>
    <td width="17" valign="top" background="../images/mail_leftbg.gif"><img src="../images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../images/content-bg.gif"></td>
    <td width="16" valign="top" background="../images/mail_rightbg.gif"><img src="../images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="../images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;" class="include">
		
   			<%	String message = "";
				if(request.getAttribute("message") == null);
				//out.println("-----------------------");
				else
				message = (String)request.getAttribute("message");
			%>
			 <font style="text-align:center;font-weight:bolder;font-size:20px;font-family:'楷体';color:red">
	    	<%=message %>
	    	</font>
		<table border="0" cellspacing="0" align="center">
    	  <tr>
    	  	<td width="100%">
    	  		<button type="button" class="button gray" onclick="window.location.href='database?action=backup'"> 数据库备份</button>
    	  		<button type="button" class="button gray" onclick="window.location.href='database_Recovery.jsp'"> 数据库恢复</button>
    	  	</td>
    	  </tr>
    	  </table>
			<table >
   			<tr>
   				<td width="20%"></td>
   				<td align="left">数据库备份：将数据库中的数据备份到本地，在数据库出现故障时，可以保存数据。</td>
   			</tr>
   			<tr>
   				<td width="20%"></td>
   				<td align="left">数据库恢复：数据库清空后会将原来备份的数据导入到数据库中。</td>
   			</tr>
   			</table>
        </td>
      </tr>
    </table></td>
    <td background="../images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="../images/mail_leftbg.gif"><img src="../images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="../images/buttom_bgs.gif"><img src="../images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="../images/mail_rightbg.gif"><img src="../images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
