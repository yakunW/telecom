<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="cn.edu.bupt.anm.po.Task" %>
<%@page import="cn.edu.bupt.anm.dao.Dao"%>
<%@page import="cn.edu.bupt.anm.factory.DaoFactory"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" language="javascript"
  	  src="js/My97DatePicker/WdatePicker.js">
    </script>
    <script type="text/javascript" src="js/check.js" charset="utf-8"></script>
	<style>
		.include table{
			text-align: center;
			width:80%;
		}
		.include tr{
			width:100%;
		}
		.td1{
			width:40%;
			text-align:right;
		}
		.td2{
			width:35%;
			text-align:left;
		}
		.td3{
			width:25%;
			text-align:left;
		}
	</style>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
	font-size:18px;
}
</STYLE>
<script type="text/javascript">
	function check(){
		if(document.getElementById('stationName').value.length==0)
		{
			alert('站号不能为空！');
			document.getElementById('stationName').focus();
			return false;
		}
		if(document.getElementById('names').value.length==0)
		{
			alert('巡检人员不能为空！');
			document.getElementById('names').focus();
			return false;
		}
		if(document.getElementById('areas').value.length==0)
		{
			alert('区域不能为空！');
			document.getElementById('areas').focus();
			return false;
		}
		if(document.getElementById('leader').value.length==0)
		{
			alert('负责人不能为空！');
			document.getElementById('leader').focus();
			return false;
		}
	}
</script>
 </head>
<body onload="document.getElementById('baseId').focus()">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">巡检员工任务分配管理</font>
</div>
<%
	String flag = request.getParameter("flag");
	String stationName="",names="",leader="",areas="";
	if("modify".equals(flag)){
	    int stationId = Integer.valueOf(request.getParameter("stationId"));
		Dao dao = DaoFactory.getTaskDaoInstance();
		List<Task> taskList = new ArrayList<Task>();
		taskList = (List<Task>)dao.list("select * from task where stationId="+stationId); 
		Task task = taskList.get(0);
		stationName = task.getStationName();
		names = task.getNames();
		leader = task.getLeader();
		areas = task.getAreas();
	}
%>
<%
	String add_url = "houtai/TaskList?action=add";
	String modify_url = "houtai/TaskList?action=modify";
	%>
<form action="<%= "add".equals(flag) ? add_url : modify_url %>" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;" class="include">
		  <table id="taskTable">
		  	<tr>
		  		<td colspan="3"><b><%= flag.equals("add") ? "添加任务分配信息" : "修改任务分配信息" %></b></td>
		  	</tr>
		  	<tr>
		  		<td class="td1">工作站名称</td>
		  		<td class="td2">
		  		<%if(flag.equals("add")){ %>
		  		<input name="stationName" id="stationName"  Style="width:250px;height:26px;font-size:18;"/>
		  		<% }
		  		else{%>
		  		<input type="text" disabled="disabled" value="<%=stationName %>" Style="width:250px;height:26px;font-size:18;"/>
		  		<input type="hidden" name="stationName" id="stationName" value="<%=stationName %>"  />
		  		<%} %>
		  		</td>
		  		<td></td>
		  	</tr>
		  	<tr>
		  		<td  class="td1">巡检人员</td>
		  		<td  class="td2">
		  		<textarea name="names" id="names" rows="3" cols="33"><%="add".equals(flag) ? "" : names%></textarea></td>
		  		<td><font Style="font-size:1;color:grey;">添加巡检人员，各巡检人员用逗号隔开！</font></td>
		  	<tr>
		  		<td  class="td1">负责人</td>
		  		<td  class="td2"><input name="leader" id="leader"  value="<%="add".equals(flag) ? "" : leader%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  		<td></td>
		  	</tr>
		  		<tr>
		  		<td  class="td1">区域</td>
		  		<td  class="td2"><input name="areas" id="areas" value="<%="add".equals(flag) ? "" : areas%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  		<td></td>
		  	</tr>
		  	<tr>
   				<td></td>
   				<td align="center">
   				<input type="submit" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_submit.png)" onclick="return check()"/>
   				<input type="reset" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_cancel.png)" 
   				 onclick="window.location.href='houtai/TaskList?action=list&&pageNum=1'"/>
   				</td>
   				<td align="left"></td>
    			</tr>
		  </table>
        </td>
      </tr>
    </table>
    </td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</form>
</body>
</html>
