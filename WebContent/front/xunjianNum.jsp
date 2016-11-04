<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="zlq.bean.Yichang"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Date"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="java.text.*" %>
<%@ page language="java" import="java.math.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";

List<Yichang>  ycList=(List<Yichang>)request.getAttribute("ycList");
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
	<script type="text/javascript" src="js/changepage.js"></script>
	<script type="text/javascript" src="js/toExcel.js" charset="utf-8"></script>
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
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">巡检综合统计查询结果</font>
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
PADDING-TOP: 10px; text-align:center;" class="include">
		 
    	  <table border="0" cellspacing="0" align="center">
    	  
    	  
    	  </table>
    	  <TABLE class=gridView align="center" style="padding:10px,10px,10px,10px;BORDER-COLLAPSE: collapse;text-align:center;" cellSpacing=0 rules=all border=1>
<tr>
<td>维护站名称</td>
<td>基站类型</td>
<td>查询开始时间</td>
<td>查询结束时间</td>
<td>巡检人员</td>
</tr>
<tr>
<td><%=session.getAttribute("stationName") %></td>
<td><%=session.getAttribute("level") %></td>
<td><%=session.getAttribute("period1") %></td>
<td><%=session.getAttribute("period2") %></td>
<td><%=session.getAttribute("xjName") %></td>
</tr>
</table>
<br>
    	  <div id="r">
    	  <% int sumitems=0;
    	     
    		  if(sumitems%10==0){
    		%>
    	<table class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
    		
    		<tr style="font-weight: bolder">
    			  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>已巡检基站数量(个数)</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>未巡检基站数量(个数)</TD>
    		</tr>
                 <%}
                	sumitems++;
                	
                 %>
            <%
               String stationName = session.getAttribute("stationName").toString();
       		   String level = session.getAttribute("level").toString();  
       		   boolean flag=false;
    		   String Sql="select baseId from base ";
    		   if((stationName!=null)&&(stationName!="")){
    			   Sql+="where stationName= '"+stationName+"'";
    			   flag=true;
    		   }
    		   if((level!=null)&&(level!="")){
    			   if(level.equals("A类基站")){
    				   if(flag==true){
        				   Sql+=" and category=0 and level='A'";
        			   }
        			   else{
        				   Sql+="where category=0 and level='A'";
        			   }
    			   }
    			   else if(level.equals("B类基站")){
    				   if(flag==true){
        				   Sql+=" and category=0 and level='B'";
        			   }
        			   else{
        				   Sql+="where category=0 and level='B'";
        			   }
    			   }
                   else if(level.equals("C类基站")){
                	   if(flag==true){
        				   Sql+=" and category=0 and level='C'";
        			   }
        			   else{
        				   Sql+="where category=0 and level='C'";
        			   }
    			   }
                   else if(level.equals("D类基站")){
                	   if(flag==true){
        				   Sql+=" and category=0 and level='D'";
        			   }
        			   else{
        				   Sql+="where category=0 and level='D'";
        			   }
    			   }
                   else if(level.equals("室内基站")){
                	   if(flag==true){
        				   Sql+=" and category=1";
        			   }
        			   else{
        				   Sql+="where category=1";
        			   }
    			   }
                   else if(level.equals("直放站")){
                	   if(flag==true){
        				   Sql+=" and category=2";
        			   }
        			   else{
        				   Sql+="where category=2";
        			   }
    			   }
                   else if(level.equals("铁塔")){
                	   if(flag==true){
        				   Sql+=" and category=0";
        			   }
        			   else{
        				   Sql+="where category=0";
        			   }
                   }	   
    		   }
    		   Connection conn1=DBConn.getConnection();
    		   ResultSet rs1=null;
    		   PreparedStatement pstmt = null;
    		   int total=0;
    		   try
    		   {
    				pstmt=conn1.prepareStatement(Sql);
    				rs1=pstmt.executeQuery();
    				while(rs1.next()){
    				   total++;}
    		   }catch(Exception e){}
    		%>
    		<TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
    			<td class=gridViewItem><%=request.getAttribute("count") %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=total-Integer.parseInt(request.getAttribute("count").toString())%>&nbsp;</td>
    		    
    		</tr>
    		<TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
    			<td class=gridViewItem><a href="xjMX"><img src="images/btn_see.png"/></a>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><a href="noxjMX"><img src="images/btn_see.png"/></a>&nbsp;</td>
    		    
    		</tr>
    		<%
    		
    		if(sumitems%10==0){ %>
    	</table>
    	<%} %>

    	<%if(sumitems%10!=0){%>
            </TABLE>
            <%}%>
				
            <input type="hidden" id="notice" name="notice" value=""/>
</div>
        </td>
      </tr>
      
      <%if(sumitems>10){ %>
      <tr>
      	<td width="100%" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px;">
      		<script type="text/javascript">
		      var sumitems=<%=sumitems %>;
		      var curpage=1;
		      var sumpages=<%=(sumitems+9)/10 %>;
		    </script>
      		<table class="choose_page">
      			<tr>
      				<td id="firstpage" style="display: none;"><a href="javascript:void(0);" onclick="change_page(1)">首页</a></td>
      				<td id="prepage" style="display: none;"><a href="javascript:void(0);" onclick="pre_page()">上一页</a></td>
      				<td id="page1" class="cur_page"><a href="javascript:void(0);" onclick="change_page(1)">1</a></td>
      				<%for(int i=2;i<=(sumitems+9)/10;i++){ %>
      				<td id="page<%=i %>"><a href="javascript:void(0);" onclick="change_page(<%=i %>)"><%=i %></a></td>
      				<%} %>
      				<td id="nextpage"><a href="javascript:void(0);" onclick="next_page()">下一页</a></td>
      				<td id="lastpage"><a href="javascript:void(0);" onclick="change_page(<%=(sumitems+9)/10 %>)">尾页</a></td>
      			</tr>
      		</table>
      	</td>
      </tr>
  	<%} %>
      
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