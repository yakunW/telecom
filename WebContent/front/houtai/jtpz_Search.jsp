<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
		.td1{
			text-align: right;  
			width:45%; 
			height:35px;
		}
		.td2{
			text-align: left;  
		}
		body{
	background-color: #DBFFD1;
	font-size:18px;
}
</style>
<script type="text/javascript">
	function check(){
		if(document.getElementById('selFlag').value.length==0){
			alert("查询方式不能为空！");
			return false;
		}
		if(document.getElementById('selValue').value.length==0){
			alert("查询条件不能为空！");
			document.getElementById('selValue').focus();
			return false;
		}
	}
</script>
 
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">静态配置组态管理</font>
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
		<form action="BaseList?action=search" method="post">
		<table border="0" cellspacing="0" align="center">
    	  <tr>
    	  	<td colspan="2">
    	  	<font style="font-weight:bolder;font-size:18px;">
    	  	查询基站配置数据
    	  	</font></td>
    	  </tr>
    	  <tr>
    	  	<td class="td1">请选择查询方式</td>
    	  	<td class="td2" >
    	  		<select name="selFlag" id="selFlag" Style="width:250px;height:24px;font-size:18;">
    	  			<option value="">请选择</option>
    	  			<option value="0">基站名称</option>
    	  			<option value="1">基站号</option>
    	  		</select>
    	  	</td>
    	  </tr>
    	  <tr>
    	  	<td class="td1">请输入查询条件</td>
    	  	<td class="td2" >
    	  		<input type="text" name="selValue" id="selValue" Style="width:250px;height:24px;font-size:18;"/>
    	  	</td>
    	  </tr>
    	  <tr>
    		<td colspan="2" Style="height:35px">
    		    <input type="submit" value="" Style="border:none;height:25px;width:75px;background:url(../images/btn_submit.png)" onclick="return check()"/>
		   		<input type="reset" value="" Style="border:none;height:25px;width:75px;background:url(../images/btn_cancel.png)" onclick="window.location.href='BaseList?action=list&&pageNum=1'"/></td>
    	  </tr>
    	  </table>
		 </form> 
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
