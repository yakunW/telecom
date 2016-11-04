<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="cn.edu.bupt.anm.po.Base" %>
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
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css">
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
	</style>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
	font-size:18px;
}
</STYLE>
<script type="text/javascript">
	function check(){
		if(document.getElementById('baseId').value.length==0)
		{
			alert('站号不能为空！');
			document.getElementById('baseId').focus();
			return false;
		}
		if(document.getElementById('category').value.length==0)
		{
			alert('类别不能为空！');
			document.getElementById('category').focus();
			return false;
		}
		if(document.getElementById('baseName').value.length==0)
		{
			alert('名称不能为空！');
			document.getElementById('baseName').focus();
			return false;
		}
		if(document.getElementById('longitude').value.length==0)
		{
			alert('经度不能为空！');
			document.getElementById('longitude').focus();
			return false;
		}
		if(document.getElementById('latitude').value.length==0)
		{
			alert('纬度不能为空！');
			document.getElementById('latitude').focus();
			return false;
		}
		if(document.getElementById('address').value.length==0)
		{
			alert('地址不能为空！');
			document.getElementById('address').focus();
			return false;
		}
	}
</script>
 </head>
<body onload="document.getElementById('baseId').focus()">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">静态配置组态管理</font>
</div>
<%
	String flag = request.getParameter("flag");
	String baseId="",baseName="",level="",longitude="",latitude="",address="",stationName="",area="",cell_id="",cate="";
	int category = -1;
	if("modify".equals(flag)){
		baseId = request.getParameter("baseId");
		Dao dao = DaoFactory.getBaseDaoInstance();
		List<Base> baseList = new ArrayList<Base>();
		baseList = (List<Base>)dao.list("select * from base where baseId="+"'"+baseId+"'"); 
		Base base = baseList.get(0);
		category = base.getCategory();
		if(category == 0)
			cate = "基站";
		else if(category == 1)
			cate = "室分系统";
		else
			cate = "直放站";
		baseName = base.getBaseName();
		if(base.getLevel() != null) level = base.getLevel();
		longitude= base.getLongitude();
		latitude = base.getLatitude();
		address = base.getAddress();
		if(base.getStationName() != null) stationName = base.getStationName();
		if(base.getArea() != null) area = base.getArea();
		if(base.getCell_id() !=null) cell_id = base.getCell_id();
  //	}
	}
	
%>
<%
	String add_url = "houtai/BaseList?action=add";
	String modify_url = "houtai/BaseList?action=modify";
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
		  <table>
		  	<tr>
		  		<td colspan="2"><b><%= flag.equals("add") ? "添加基站配置数据" : "修改基站配置数据" %></b></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>基站站号</td>
		  		<td align="left">
		  		<%if(flag.equals("add")){ %>
		  		<input name="baseId" id="baseId"  Style="width:250px;height:26px;font-size:18;"/>
		  		<% }
		  		else{%>
		  		<input type="text" disabled="disabled" value=<%=baseId %> Style="width:250px;height:26px;font-size:18;"/>
		  		<input type="hidden" name="baseId"  value=<%=baseId %> />
		  		<%}; %>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>基站名称</td>
		  		<td align="left">
		  			<input type="text" name="baseName" id="baseName" value="<%= flag.equals("add") ? "" : baseName%>" Style="width:250px;height:26px;font-size:18;"/>
		  		</td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>类别</td>
		  		<td align="left">
			  		<select name="category" id="category" Style="width:250px;height:26px;font-size:18;">
			  			<option value="<%= flag.equals("add") ? "" : category%>"><%= flag.equals("add") ? "请选择" : cate%></option>
			  		    <option value="0">基站</option>
			  			<option value="2">直放站</option>
			  			<option value="1">室分系统</option>
			  		</select>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%">等级</td>
		  		<td align="left"><input type="text" name="level" id="level" value="<%= flag.equals("add") ? "" : level%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>经度</td>
		  		<td align="left"><input type="text" name="longitude" id="longitude" value="<%= flag.equals("add") ? "" : longitude%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>纬度</td>
		  		<td align="left"><input type="text" name="latitude" id="latitude" value="<%= flag.equals("add") ? "" : latitude%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%"><font color="red">*</font>地址</td>
		  		<td align="left"><input type="text" name="address" id="address" value="<%= flag.equals("add") ? "" : address%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%">工作站名称</td>
		  		<td align="left"><input type="text" name="stationName" id="stationName" value="<%= flag.equals("add") ? "" : stationName%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%">区域</td>
		  		<td align="left"><input type="text" name="area" id="area" value="<%= flag.equals("add") ? "" : area%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
		  		<td align="right" width="45%">小区号</td>
		  		<td align="left"><input type="text" name="cell_Id" id="cell_Id" value="<%= flag.equals("add") ? "" : cell_id%>" Style="width:250px;height:26px;font-size:18;"/></td>
		  	</tr>
		  	<tr>
    			<td colspan="2">
    				<input type="submit" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_submit.png)" onclick="return check()"/>
		   		    <input type="reset" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_cancel.png)" onclick="window.location.href='houtai/BaseList?action=list&&pageNum=1'"/></td>
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
