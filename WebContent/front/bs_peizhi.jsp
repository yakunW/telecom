<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <!-- <td height="100" background="images/right_title_bg.jpg" style="text-align: center;"></td> -->
 
    <base href="<%=basePath%>">
    
    <title>要闻选择</title>
    
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
<script type="text/javascript">

choose=0;
function choose_notice(item,seq)
{
	i=1;
	while(document.getElementById("news"+i)!=null)
	{
		document.getElementById("news"+i++).style.backgroundColor = '#FFF';
	}
	item.style.backgroundColor = '#add8e6';
	document.getElementById("notice").value=document.getElementById("title"+seq).innerHTML;
	choose=seq;
}
</script>
 </head>
<body onload="document.getElementById('password').focus();">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">基站配置管理</font>
</div>

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
    <form action="screen_preview.jsp" method="post">
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
		  	Connection conn=DBConn.getConnection();
			ResultSet rs=null;
			Statement stmt=null;
			int sumitems=0;
			try
			{
				stmt=conn.createStatement();
				rs=stmt.executeQuery("select * from base;");
		  		while(rs.next()){
            	if(sumitems%10==0){
            %>
		  <TABLE class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
                <TR>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>基站编号</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>基站类别</TD>
                  <TD class=gridViewHeader style="WIDTH: 20%" scope=col>基站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>基站等级</TD>
                  <TD class=gridViewHeader style="WIDTH: 15%" scope=col>位置-经度</TD>
                  <TD class=gridViewHeader style="WIDTH: 15%" scope=col>位置-维度</TD>
                  <TD class=gridViewHeader style="WIDTH: 20%; text-align:center;" scope=col>结构化地址</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>工作站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>区域</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>小区标示号</TD>
                </TR>
                <%}
                	sumitems++;
                 %>
                <TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
                  <TD class=gridViewItem><%=rs.getString(1) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getInt(2)== 0 )? "基站": (rs.getInt(2)== 1 )? "室内分布系统": "直放站"%>
                  </TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(3) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getString(4)==null)? "": rs.getString(4)%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(5) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(6) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getString(7)==null)? "": rs.getString(7) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getString(8)==null)? "": rs.getString(8) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getString(9)==null)? "": rs.getString(9) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=(rs.getString(10)==null)? "": rs.getString(10) %></TD>
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
    </form>
    </td>
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
