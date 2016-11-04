<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xiangxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
     <%
		  	Connection conn=DBConn.getConnection();
			ResultSet rs=null;
			Statement stmt=null;
			int sumitems=0;
			try
			{
				stmt=conn.createStatement();				
				rs=stmt.executeQuery("select * from zt_a;");
		  		while(rs.next()){
            	if(sumitems%10==0){
            %>
		  <TABLE class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH:100%;BORDER-COLLAPSE:collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
                <TR>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>基站编号</TD>
                  <TD class=gridViewHeader style="WIDTH: 30%" scope=col>基站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>基站等级</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检人员</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检设备</TD>
                  <TD class=gridViewHeader style="WIDTH: 30%" scope=col>C网基站及配套设备作业计划记录表1</TD>
               
                </TR>
                <%}
                	sumitems++;
                 %>
                <TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
                  <TD class=gridViewItem><%=rs.getString(1) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(2) %></TD>
                  <TD class=gridViewItem><%=rs.getString(3) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(4) %></TD>
                  <TD class=gridViewItem><%=rs.getString(5) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(6) %></TD>
                </TR>
                <%if(sumitems%10==0){ %>
            </TABLE>
            <%} %>
            <%}
            if(sumitems%10!=0){%>
          
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
       
      
      <%if(sumitems>10){ %>
      <table>
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
