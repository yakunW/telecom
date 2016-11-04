<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="wyk.bean.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- <td height="100" background="images/right_title_bg.jpg" style="text-align: center;"></td> -->
 
    <base href="<%=basePath%>">
    
    <title>未巡检基站信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	<link href="css/list.css" rel="stylesheet" type="text/css" />
	<link href="css/choose_page.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/changepage.js"></script>
	<STYLE type=text/css> 
body{
	background-color: #dbffd1;
}
.register td{
	height:28px
}
.inputstyle{width:200px;height:28px;border:#C1C1C1 1px solid;font-size:14px;padding:4px 5px 4px;background-color:#FBFBFB;background-position:0 -72px;color:#444}

</STYLE>

 </head>
<body onload="document.getElementById('password').focus();">
 
<table width="100%">
<tr>
<td style="width:20%">
    <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>
    </td>
<td style="width:60%; text-align:center;">
<font style="text-align:center;color:#419224;font-weight:bolder;font-size:30px;">未巡检基站信息</font>
</td>
<td style="width:20%"></td>
</tr>
</table>


<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
     
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
     <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;">
		  <%
		    List<Uncheck> uncheckList=(List<Uncheck>)request.getAttribute("uncheckList");
		  	Connection conn=DBConn.getConnection();
			ResultSet rs=null;
			Statement stmt=null;
			int sumitems=0;
			try
			{
				
		  		for(int i=0;i<uncheckList.size();i++){
            	if(sumitems%10==0){
            %>
		  <TABLE class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
                <TR>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>基站编号</TD>
                  <TD class=gridViewHeader style="WIDTH: 30%" scope=col>基站名称</TD>
                
                </TR>
                <%}
                	sumitems++;
                 %>
                <TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
                  <TD class=gridViewItem><%=uncheckList.get(i).getBaseId()%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=uncheckList.get(i).getBaseName() %></TD>
                  
                </TR>
                <%if(sumitems%10==0){ %>
            </TABLE>
            <%} %>
            <%}
            if(sumitems%10!=0){%>
            </TABLE>
            <%}conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					DBConn.closeResultSet(rs);
					DBConn.closeStatement(stmt);
				} %>
				
            <input type="hidden" id="notice" name="notice" value=""/>
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
  	
  	  
    </table>

</body>
</html>
