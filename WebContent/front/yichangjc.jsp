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
		alert('������Ҫ��ѯ����ʼ���ڣ�');
		return false;
	}
	if(document.getElementById('d4').value.length==0){
		alert('������Ҫ��ѯ�Ľ������ڣ�');
		return false;
	}
	 var date1=document.getElementById('d3').value;
	  var date2=document.getElementById('d4').value;
	  var n1=date1.indexOf("-");
	  var n2=date2.indexOf("-");
	  var arr1=date1.substring(0, n1);
	  var arr2=date2.substring(0, n2);
	  if(arr1!=arr2){
		  alert("ʱ���Ӧ��ͬһ���ڣ�");
		  return false;
	  }
}
</script>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'����';">����ʡͭ����</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">�쳣���ͳ�Ʋ�ѯ</font>
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
		         <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">ά��վ����ѡ��</td>
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
                             <option value ="">--ά��վѡ��--</option>                           
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
		              <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">�쳣����ѡ��</td>
		            </tr>
		            <tr>
		              <td>
		              <select class="inputstyle" style="font-size: 15px;width:150px;"  name="ycName" id="d6">  
                             <option value ="">--�쳣ѡ��--</option>  
                             <option >��������</option>  
                             <option >�յ�</option>  
                             <option >��ѹ��</option>
                             <option >���������</option>  
                             <option >��վ���豸</option>  
                             <option >�����豸</option>  
                             <option >���ص�Դ</option>  
                             <option >���</option>  
                             <option >��Φ��������/GPS</option>
                             <option >�ӵ�ϵͳ</option>
                             <option >��������</option>  
                             <option >��������</option>
                             <option >���ؼ��</option>  
                             <option >�豸���</option>                             
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
		              <td colspan=2 align="left" style="font-weight:bolder;font-size:18;">��վ����ѡ��</td>
		              </tr>
		              <tr>
		             <td>
		              <select class="inputstyle" style="font-size: 15px;width:150px;"  name="typeName" id="d6">  
                             <option value ="">--��վ����ѡ��--</option>                 
                             <option >A���վ</option>  
                             <option >B���վ</option>  
                             <option >C���վ</option>
                             <option >D���վ</option>  
                             <option >���ڻ�վ</option>  
                             <option >ֱ��վ</option>          
                        </select>
		              </td>
		            </tr>
		       </table>
		    </td>
    		    <td>
    		           <table   cellspacing="15">
    			            <tr>
    				             <td colspan=2 align="left" id="title3" style="font-weight:bolder;font-size:18;">
    					                            ʱ���ѡ��
    				             </td>
    			            </tr>
    			            <tr>
    				          <td>��ʼʱ�䣺</td>
    				          <td>
						          <input type="text" name="period1" class="Wdate" id="d3" 
    					          onClick="WdatePicker({minDate:'#F{$dp.$D(\'d4\',{y:-1})||$dp.$DV(\'%y-%M-01\',{M:-12})}',
    					          maxDate:'#F{$dp.$D(\'d4\')||$dp.$DV(\'%y-%M-%d\')}'})"/>
					         </td>
				          
					         <td>����ʱ�䣺</td>
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
