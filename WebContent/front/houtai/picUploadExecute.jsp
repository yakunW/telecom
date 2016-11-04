<%@ page language="java" import="java.util.*,java.lang.*,com.jspsmart.upload.*,java.io.File,java.text.*,javax.swing.JOptionPane" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/houtai/";
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
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css">
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
}

</STYLE>
 </head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="../images/mail_leftbg.gif"><img src="../images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="../images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
      <tr>
        <td height="31"><div class="titlebt">操作结果</div></td>
      </tr>
    </table></td>
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
		  <%if(request.getParameter("info")==null){%>
			无操作！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">返回</a>		  
			<%}
		  	else if(request.getParameter("info").equals("1")){ %>
			上传成功！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">继续上传</a>		  
			<%}else if(request.getParameter("info").equals("2")){ %>
			图片最多8张！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">返回</a>		  
			<%}else if(request.getParameter("info").equals("0")){ %>
			上传失败！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">重新上传</a>
			<%}else if(request.getParameter("info").equals("4")){ %>
			删除成功！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">返回</a>
			<%}else if(request.getParameter("info").equals("5")){ %>
			删除失败！<a href="picUpload.jsp" style="font-size:16px;color:#0066cc">返回</a>
			<%} %>
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
