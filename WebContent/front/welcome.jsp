<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="weather.getweather"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<html>
  <head>
    <base href="<%=basePath+path+"/front/"%>">
    
    <title>欢迎基站检测运维之撑智能管理系统 -- 北京邮电大学ANM研究中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">  
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="css/main.css" rel="stylesheet" type="text/css" />
	<link href="css/menu.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="js/menu.js"></script>
	<script type="text/javascript" src="js/slider.js"></script>
  </head>
  
  <body style="margin-left: 0px;margin-top: 0px;margin-right: 0px;margin-bottom: 0px;background-color: #DBFFD1;">
	  <!-- 网页正文块开始 -->
	  <% Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		Statement stmt=null;
		ResultSet rs2=null;
		Statement stmt2=null;
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select Id,title from news;");
			%>
	  	<table width="1020" align="center" border="0" >
	  		<!-- 正文开始 -->
	  		<tr>
	  			<td>
	  				<table border="0" >
	  					<tr>
	  						<!-- 正文左栏开始 -->
	  						<td width="252" style="vertical-align: top;">
	  							<!-- 最新要闻开始 -->
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="25" width="30" background="images/left_title_left.jpg">
	  										
	  									</td>
	  									<td height="25" width="175" background="images/left_title_bg.jpg" style="text-align: center;">
	  										<font style="color:#419224;font-weight:bolder;font-size:14px;">最新要闻</font>
	  									</td>
	  									<td height="25" width="45" background="images/left_title_right.jpg" style="text-align: center;">
	  										<img src="images/more.png" style="padding-right: 8px"></img>
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="387" width="250" background="images/left_bg.png">
	  										<marquee style="WIDTH: 98%; HEIGHT: 100%" scrollamount="2" direction="up" onmouseover=this.stop() onmouseout=this.start()>
												<div style="width:220px;height:280px;text-align:left;padding-left:10px;" class="notice">
												<%while(rs.next()){ %>
													<p><img src="images/noticelist.gif">&nbsp;&nbsp;<a href="houtai/news.jsp?id=<%=rs.getInt(1) %>"><%=rs.getString(2) %></a></p>
													<%} %>
												</div>
											</marquee>
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="17" width="250" background="images/left_foot1.png">
	  										&nbsp;
	  									</td>
	  								</tr>
	  							</table>
	  							<!-- 最新要闻结束 -->
	  						</td>
	  						<!-- 正文左栏结束 -->
	  						<!-- 正文中栏开始 -->
	  						<td width="520" style="vertical-align: top;">
	  							<!-- 系统风采开始 -->
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="38" width="518" background="images/center_system_title.jpg">
	  										
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="1" bordercolor="#a0d49d" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="382" width="515" style="border-width: 0px;">
	  										<!-- 滑动图片开始 -->
	  										<%stmt2=conn.createStatement();
											  rs2=stmt2.executeQuery("select pic_path from pics;"); %>
	  										<script type="text/javascript">
	  										<%int i=0;
	  										while(rs2.next()){%>
												 roll_image[<%=i%>] = '<%=basePath+rs2.getString(1)%>';
												 image_link[<%=i%>] = 'javascript:;';
												 small_img[<%=i%>] = 'images/main_flash_button<%=i+1%>_on.gif';
											<%i++;}
											for(;i<8;i++){%>
												 roll_image[<%=i%>] = '<%=basePath+"/yunwei/system_pic/image/no_pic.png"%>';
												 image_link[<%=i%>] = 'javascript:;';
												 small_img[<%=i%>] = 'images/main_flash_button<%=i+1%>_on.gif';
											
											<%}%>
											</script>
												<TABLE cellSpacing=0 cellPadding=0 width=500 border=0 style="padding-left:7px">
												  
												    <TR>
												      <TD height=298 width=500>
														<A onfocus=this.blur() href="javascript:;" id=imglink name=imglink><IMG style="FILTER: blendTrans(duration=1)" height=292 src="" width=500 border=0 id=bigimg name=bigimg></A>
												      </TD>
												    </TR>
												    <TR>
												      <TD height=27 style="text-align: center;">
												      	<TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 style="text-align:center;">
												          <TR>
												          
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 0);" height=15 
												                        src="images/main_flash_button1.gif" width=61 
												                        border=0 id=num_img0 name=num_img0></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 1);" height=15 
												                        src="images/main_flash_button2.gif" width=61 
												                        border=0 id=num_img1 name=num_img1></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 2);" height=15 
												                        src="images/main_flash_button3.gif" width=61 
												                        border=0 id=num_img2 name=num_img2></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 3);" height=15 
												                        src="images/main_flash_button4.gif" width=61 
												                        border=0 id=num_img3 name=num_img3></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 4);" height=15 
												                        src="images/main_flash_button5.gif" width=61 
												                        border=0 id=num_img4 name=num_img4></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 5);" height=15 
												                        src="images/main_flash_button6.gif" width=61 
												                        border=0 id=num_img5 name=num_img5></TD>
												            <TD width=3></TD>
													    	<TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 6);" height=15 
												                        src="images/main_flash_button7.gif" width=61 
												                        border=0 id=num_img6 name=num_img6></TD>
												            <TD width=3></TD>
												            <TD width=61><IMG style="CURSOR: hand" 
												                        onclick="click_simg(this, 7);" height=15 
												                        src="images/main_flash_button8.gif" width=61 
												                        border=0 id=num_img7 name=num_img7></TD>
												            <TD 
												              width=3></TD>
												          </TR>
												      </TABLE>
												      </TD>
												    </TR>
												</TABLE>
												<SCRIPT type="text/javascript">rotate();</SCRIPT>
											<!-- 滑动图片结束 -->
	  									</td>
	  								</tr>
	  							</table>
	  							<!-- 系统风采结束 -->
	  						</td>
	  						<!-- 正文中栏结束 -->
	  						<!-- 正文右栏开始 -->
	  						<td width="220" style="vertical-align: top;">
	  							<!-- 今日天气开始 -->
	  							<table border="0" cellSpacing="0" cellPadding="0" >
	  								<tr>
	  									<td height="25" width="30" background="images/right_title_left.jpg">
	  										
	  									</td>
	  									<td height="25" width="143" background="images/right_title_bg.jpg" style="text-align: center;">
	  										<font style="color:#419224;font-weight:bolder;font-size:14px;">今日天气</font>
	  									</td>
	  									<td height="25" width="45" background="images/right_title_right.jpg" style="text-align: center;">
	  										
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="115" width="218" background="images/right_bg.png" style="text-align: center">
	  										<p><script type="text/javascript">
												function get_time()    /**获取当前时间**/
												{
													var nowDate = new Date();
													var day=["日","一","二","三","四","五","六"];
													var str = nowDate.getFullYear()+"年"+(nowDate.getMonth() + 1)+"月"+nowDate.getDate()+"日<br>星期"+day[nowDate.getDay()];
													return str;
												}
												document.write("<font color=#000000 style='font-size:13px;font-family: 宋体;text-align:center;'> ",get_time(),"</font>" );
	  										</script>
	  										<br><font color=#000000 style='font-size:13px;font-family: 宋体;text-align:center'><%=getweather.get_weather() %></font></p>
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="17" width="218" background="images/right_foot.png">
	  										
	  									</td>
	  								</tr>
	  							</table>
	  							<!-- 今日天气结束 -->
	  							<!-- 后台登录开始 -->
	  							<table border="0" cellSpacing="0" cellPadding="0" >
	  								<tr>
	  									<td height="25" width="30" background="images/right_title_left.jpg">
	  										
	  									</td>
	  									<td height="25" width="143" background="images/right_title_bg.jpg" style="text-align: center;">
	  										<font style="color:#419224;font-weight:bolder;font-size:14px;">欢迎登录</font>
	  									</td>
	  									<td height="25" width="45" background="images/right_title_right.jpg" style="text-align: center;">
	  										
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="232" width="218" background="images/right_bg.png" style="text-align: center">
	  										<img src="images/system.png">
	  									</td>
	  								</tr>
	  							</table>
	  							<table border="0" cellSpacing="0" cellPadding="0">
	  								<tr>
	  									<td height="17" width="218" background="images/right_foot.png">
	  										
	  									</td>
	  								</tr>
	  							</table>
	  							<!-- 后台登录结束 -->
	  						</td>
	  						<!-- 正文右栏结束 -->
	  					</tr>
	  				</table>
	  			</td>
	  		</tr>
	  		<!-- 正文结束 -->
	  	</table>
	  	<%
	  	conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBConn.closeResultSet(rs);
			DBConn.closeStatement(stmt);
			DBConn.closeResultSet(rs2);
			DBConn.closeStatement(stmt2);
		}
	  	 %>
	  <!-- 网页正文块结束 -->
  </body>
</html>
