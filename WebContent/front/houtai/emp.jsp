<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="cn.edu.bupt.anm.po.Staff" %>
<%@page import="cn.edu.bupt.anm.dao.Dao"%>
<%@page import="cn.edu.bupt.anm.factory.DaoFactory"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
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
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css">
	<script type="text/javascript" language="javascript"
  	  src="js/My97DatePicker/WdatePicker.js">
    </script>
    <script type="text/javascript" src="js/check.js" charset="utf-8"></script>
	<style>
		.include table{
			text-align: center;
			
		}
		.include td{
			line-height:36px;
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
		if(document.getElementById('name').value.length==0)
		{
			alert('姓名不能为空！');
			document.getElementById('name').focus();
			return false;
		}
		if(document.getElementById('telephone').value.length == 0){
			alert('电话号码不能为空！');
			document.getElementById('telephone').focus();
			return false;
		}
		if(document.getElementById('telephone').value.length != 0){
			var re = /^1[3|4|5|8][0-9]\d{4,8}$ /;
			if(re.test(document.getElementById('telephone'))){
				alert('电话号码格式不正确！');
				document.getElementById('telephone').focus();
				return false;
			}
		}
	}
</script>
 </head>
<body onload="document.getElementById('name').focus()">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">巡检员工管理</font>
</div>
<%	int isAdd = Integer.valueOf(request.getParameter("isAdd")); 
    int id = Integer.valueOf(request.getParameter("Id")); 
    String name = "", sex = "", telephone = " ";
    if( id != -1){
 		Dao dao = DaoFactory.getStaffDaoInstance();
 		List<Staff> staffList = new ArrayList<Staff>();
 		staffList = (List<Staff>)dao.list("select * from staff where id="+id); 
 		Staff staff = staffList.get(0);
    	name = staff.getName();
    	if(staff.getSex() == null) sex = " ";
    	else sex = staff.getSex();
		if(staff.getTelephone() != null) telephone = staff.getTelephone();
    }
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;"> 
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
PADDING-TOP: 10px; text-align:center;" class="include">
		  <form action="houtai/StaffList?action=<%= isAdd==1 ? "add" :"modify" %>" method="post">
    			<table border="0" cellspacing="0" align="center" id="resultdata" width="100%">
    			<tr>
    				<td colspan="2" ><b><%= isAdd==1 ? "添加巡检员工" : "修改巡检员工" %></b></td>
    			</tr>
    			<tr>
    				<td align="right" width="45%">姓名:&nbsp;</td>
    				<td align="left">
						<input type="hidden" name="id" value=<%=id %>>
						<input type="text" name="name" id="name" 
						value="<%= isAdd==1 ? "" : name %>" Style="width:250px;height:28px;font-size:20;"/></td>
    			</tr>
    			<tr>
    				<td align="right"  width="45%" >性别:&nbsp;</td>
    				<td  align="left" >
    					<select id="sex" name="sex" 
    					Style="width:200px;height:28px;font-size:20;">
    						<option value="<%= isAdd==1 ? "" : sex %>" ><%= isAdd==1 ? "请选择" : sex %> </option>
    						<option value="男">男</option>
    						<option value="女">女</option>
    					</select>
    				</td>
    			</tr>
    			<tr>	
    				<td align="right"  width="45%">联系方式:&nbsp;</td>
    				<td align="left">
	    				<input type="text" id="telephone" name="telephone" 
	    				value="<%= isAdd==1 ? "" : telephone %>" Style="width:250px;height:28px;font-size:20;"/>
    				</td>
    			</tr>
    			<tr>
    				<td colspan="2" >
		   				<input type="submit" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_submit.png)" onclick="return check()"/>
		   				<input type="reset" value="" Style="border:none;height:25px;width:75px;background:url(images/btn_cancel.png)" 
		   				onclick="window.location.href='houtai/StaffList?action=list&&pageNum=1'"/>
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
