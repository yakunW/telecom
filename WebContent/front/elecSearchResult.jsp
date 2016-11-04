<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="zlq.bean.Elec"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Date"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="java.text.*" %>
<%@ page language="java" import="java.math.*"%>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
  String picPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/uploadImg/";
  List<Elec>  eleclist=(List<Elec>)request.getAttribute("eleclist");
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
<script language="javascript">
	function exportExcel(){
		window.location.href="toExcelByMonth";
	}
</script>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">电量检测查询结果</font>
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
    	  
    	  <tr>
    	  	<td width="90%"></td>
    	  	<td><a href="javascript:;" onclick="exportExcel()">导出至excel</a></td>
    	  	
    	  </tr>
    	  </table>
    	  <div id="r">
    	  <% int sumitems=0;
    	  for(int i=0;i<eleclist.size();i++) {
    		  if(sumitems%10==0){
    		%>
    	<table class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
    		
    		<tr style="font-weight: bolder">
    			  <TD class=gridViewHeader style="WIDTH: 15px" scope=col>基站编号</TD>
    			  <TD class=gridViewHeader style="WIDTH: 35px" scope=col>基站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 20px" scope=col>基站等级</TD>                 
                  <TD class=gridViewHeader style="WIDTH: 15px" scope=col>检测人员</TD>
                  <TD class=gridViewHeader style="WIDTH: 25px" scope=col>上次检测时间</TD>
                  <TD class=gridViewHeader style="WIDTH: 15px" scope=col>上次检测度数</TD>
                  <TD class=gridViewHeader style="WIDTH: 25px" scope=col>本次检测时间</TD>
                  <TD class=gridViewHeader style="WIDTH: 15px" scope=col>本次检测度数</TD>
                  <TD class=gridViewHeader style="WIDTH: 20px" scope=col>间隔天数</TD>
    			  <TD class=gridViewHeader style="WIDTH: 20px" scope=col>该时间段用电量</TD>
    			  <TD class=gridViewHeader style="WIDTH: 20px" scope=col>平均日用电量</TD>
                  <TD class=gridViewHeader style="WIDTH: 15px" scope=col>图片名称</TD>
    		</tr>
    		<%}
                	sumitems++;
                 %>
    		<TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
    			<td class=gridViewItem><%=eleclist.get(i).getBaseid() %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getBasename()%>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getBaserank()%>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getCheckername()%>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getLastchecktime() %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getLastchecknum() %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getPresentchecktime() %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getPresentchecknum() %>&nbsp;</td>    			
                <TD class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getDaysBetween()%></TD>
                <TD class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getPower()%></TD>
                <TD class=gridViewItem id="title<%=sumitems %>"><%=eleclist.get(i).getAvgStr()%></TD>                        			    			
    			<% String picname=eleclist.get(i).getPicname();
                   if(picname==null||picname.equals(""))
                   {
                %>                             
                <td class=gridViewItem id="title<%=sumitems %>"><a href="/yunwei/system_pic/image/no_pic.png" style="text-decoration:underline;" target="_blank"><%=eleclist.get(i).getPicname() %></a></td> 
                <%}
                  else{ 
                %>
                <td class=gridViewItem id="title<%=sumitems %>"><a href="<%=picPath %><%=picname %>" style="text-decoration:underline;" target="_blank"><%=eleclist.get(i).getPicname() %></a></TD>                  
                <%} %> 
    		</tr>
    		<%if(sumitems%10==0){ %>
    	</table>
    	<%} %>
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
