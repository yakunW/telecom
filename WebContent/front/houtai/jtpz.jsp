<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.bupt.anm.po.Base" %>
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
		a:link {
			font-size: 14px;
			line-height: 25px;
			color: blue;
			text-decoration: none;
		}
		a:hover {
			font-size: 16px;
			line-height: 25px;
			color: red;
			text-decoration: underline;
		}
		a:visited {
			font-size: 14px;
			line-height: 25px;
			color: purple;
			text-decoration: none;
		}
	</style>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
	font-size:18px;
}
</STYLE>

 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">基站配置组态管理</font>
</div>
<%
   	  List<Base> baseList = (List<Base>)request.getAttribute("baseList"); 
   	  Iterator<Base> iter = baseList.iterator(); 
   	  int id;
%>
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
  <font style="text-align:center;font-weight:bolder;font-size:20px;font-family:'楷体';color:red">	
		<%
    		String message = "";
			if(session.getAttribute("message") == null);
    			//out.println("-----------------------");
    		else
    			message = (String)session.getAttribute("message");
			out.println(message);
    		session.setAttribute("message", "");
	    %>
	    </font>
		  <table border="1" cellspacing="0" align="center" id="resultdata">
    			<tr>
    				<td colspan="5" ><b> 基站配置数据管理</b></td>
    				<td><img src="../images/btn_search.png" onclick="window.location.href='jtpz_Search.jsp'" /></td>
    				<td><img src="../images/btn_add.png" onclick="window.location.href='jtpz_AM.jsp?flag=add'" /></td>
    			</tr>
    			<tr>
    				<td><b>基站站号</b></td>
    				<td><b>基站类别</b></td>
    				<td><b>基站名称</b></td>
    				<td><b>基站等级</b></td>
    				<td><b>基站地址</b></td>
    				<td><b>修改</b></td>
    				<td><b>删除</b></td>
    			</tr>
    			<%
    			for(int i=1;iter.hasNext();i++) {
    				Base base = iter.next();
    				String category = "",level = "",address = "";
	     		    if(base.getCategory() == 0)
	     		        category = "基站";
	     		    else if(base.getCategory() == 1)
	     		    	category = "室内分布系统";
	     		    else
	     		    	category = "直放站";
	     		    if(base.getLevel() == null) level = "";
	     		    else level = base.getLevel();
	     		    if(base.getAddress() == null) address = "";
	     		    else address = base.getAddress();
    	     	%>
    	     	<tr>
    	     		<td><%=base.getBaseId()%></td>
    	     		<td><%=category %></td>
    	     		<td><%=base.getBaseName()%></td>
    	     		<td><%=level %></td>
    	     		<td><%=address %>
    	     		</td>
    	     		<td><img src="../images/btn_edit.png" onclick="window.location.href='jtpz_AM.jsp?flag=modify&&baseId=<%=base.getBaseId() %>'"/></td>
    				<td><img src="../images/btn_delete.png" 
    				onclick="if(confirm('确定要删除吗？')){window.location.href='BaseList?action=del&&baseId=<%=base.getBaseId() %>';}else {return false;}"/></td>
    	     	</tr>
    			<% }%>
    		</table> 
    		<% 
    		   int pageNum =Integer.parseInt(request.getAttribute("pageNum").toString());
    		   int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
    		   int recordCount = Integer.parseInt(request.getAttribute("recordCount").toString());
    		%>
	   <br/> <font>第<%=pageNum %>/<%=pageCount %>页  共<%=recordCount %>记录 
	 		<%if(pageNum == 1){ %>第一页
	 		<%}else {%><a href="BaseList?action=list&&pageNum=1">第一页</a>
	 		<%} %>  
	 		<%if(pageNum == 1){ %>上一页
	 		<%}else {%><a href="BaseList?action=list&&pageNum=<%=pageNum-1%>">上一页</a>
	 		<%} %>  
	 		<%if(pageNum == pageCount){ %>下一页
	 		<%}else {%><a href="BaseList?action=list&&pageNum=<%=pageNum+1%>">下一页</a>
	 		<%} %> 
	 		<%if(pageNum == pageCount){ %>最后一页
	 		<%}else {%><a href="BaseList?action=list&&pageNum=<%=pageCount%>">最后一页</a>
	 		<%} %> </font>
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
