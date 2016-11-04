<?xml version="1.0" encoding="GBK" ?>
<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page  import="java.util.*"%>
<%@ page  import="java.sql.*"%>
<%@ page  import="dbc.DBConn"%>
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
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css" />
	<script type="text/javascript" language="javascript"
  	  src="js/My97DatePicker/WdatePicker.js">
    </script>
    <script type="text/javascript" language="javascript"  src="js/check.js"></script>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
}

</STYLE>
<script language="javascript">
function checkall(){
	
	
	if(document.getElementById('d3').value.length==0){
		alert('请输入要查询的起始日期！');
		return false;
	}
	if(document.getElementById('d4').value.length==0){
		alert('请输入要查询的结束日期！');
		return false;
	}
	 var date1=document.getElementById('d3').value;
	  var date2=document.getElementById('d4').value;
	  var n1=date1.indexOf("-");
	  var n2=date2.indexOf("-");
	  var arr1=date1.substring(0, n1);
	  var arr2=date2.substring(0, n2);
	  if(arr1!=arr2){
		  alert("时间段应在同一年内！");
		  return false;
	  }
}
</script>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">异常检测统计查询</font>
</div>
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
		 <form action="ycSearch" method="post" name="yichang">
		 <table>
		   <tr>
		    <td>
		       <table cellspacing="15" >
		         <tr>
		         <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">维护站名称选择：</td>
		         </tr>
		         <% 
			       String sql="select distinct stationName from base where stationName != ' '";
			       Connection conn=DBConn.getConnection();
			       ResultSet rs=null;
				   Statement stmt=null;
				   try
				   {
					  stmt=conn.createStatement();
					  rs=stmt.executeQuery(sql);	
			     %>
		         <tr>		         
    				<td>
						<select class="inputstyle" style="font-size: 15px;"  name="stationName" id="d5">  
                             <option value ="">--维护站选择--</option>                           
                             <% while(rs.next()){ 
                             %>  
                             <option><%=rs.getString(1) %></option><%}}catch(Exception E){} %>
                        </select>
					</td>
		         </tr>
		       </table>
		    </td>
		    <td>
		         <table  cellspacing="15">
		            <tr>
		              <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">异常类型选择：</td>
		            </tr>
		            <tr>
		              <td>
		              <select class="inputstyle" style="font-size: 15px;width:150px;"  name="ycName" id="d6">  
                             <option value ="">--异常选择--</option>  
                             <option >机房环境</option>  
                             <option >空调</option>  
                             <option >变压器</option>
                             <option >交流配电箱</option>  
                             <option >基站主设备</option>  
                             <option >其他设备</option>  
                             <option >开关电源</option>  
                             <option >监控</option>  
                             <option >塔桅、天馈线/GPS</option>
                             <option >接地系统</option>
                             <option >铁塔塔体</option>  
                             <option >铁塔塔灯</option>
                             <option >蓄电池检查</option>  
                             <option >设备检查</option>                             
                        </select>
		              </td>
		            </tr>
		       </table>
		    </td>  
    		   </tr>
    		   <tr>
    		    <td >
		         <table  cellspacing="15">
		            <tr>
		              <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">基站类型选择：</td>
		              </tr>
		              <tr>
		             <td>
		              <select class="inputstyle" style="font-size: 15px;width:150px;"  name="typeName" id="d6">  
                             <option value ="">--基站类型选择--</option>                 
                             <option >A类基站</option>  
                             <option >B类基站</option>  
                             <option >C类基站</option>
                             <option >D类基站</option>  
                             <option >室内基站</option>  
                             <option >直放站</option>          
                        </select>
		              </td>
		            </tr>
		       </table>
		    </td>
    		    <td>
    		           <table   cellspacing="15">
    			            <tr>
    				             <td colspan=2 align="left" id="title3" style="font-weight:bolder;font-size:18;">
    					                            时间段选择：
    				             </td>
    			            </tr>
    			            <tr>
    				          <td>起始时间：</td>
    				          <td>
						          <input type="text" name="period1" class="Wdate" id="d3" 
    					          onClick="WdatePicker({minDate:'#F{$dp.$D(\'d4\',{y:-1})||$dp.$DV(\'%y-%M-01\',{M:-12})}',
    					          maxDate:'#F{$dp.$D(\'d4\')||$dp.$DV(\'%y-%M-%d\')}'})"/>
					         </td>
				          
					         <td>结束时间：</td>
					         <td>
						          <input type="text" name="period2" class="Wdate" id="d4" 
    					          onClick="WdatePicker({minDate:'#F{$dp.$D(\'d3\')||$dp.$DV(\'%y-%M-01\',{M:-12})}',
    					          maxDate:'#F{$dp.$D(\'d3\',{y:1})||$dp.$DV(\'%y-%M-%d\')}'})"/>
					        </td>
    			         </tr>
    			        
    		           </table>
    		    </td>
    		   </tr>
    		   <tr >
    				  <td colspan=2 align="center" style="height:80px">
    				    <div>
    					       <input type="image" src="images/btn_search.png" onclick="return checkall();">&nbsp;&nbsp;&nbsp;
	      				       <img src="images/btn_cancel.png" onclick="document.yichang.reset()">
	      				</div>
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
