<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.bupt.anm.po.News"%>
<%@page import="cn.edu.bupt.anm.dao.Dao"%>
<%@page import="cn.edu.bupt.anm.factory.DaoFactory"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css">
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
<script type="text/javascript">
	function del(){
		if(confirm('确定要删除吗？')){
			//var id = document.getElementById('newsid').value;
			window.location.href="NewsList?action=del";
		}
		else return false;
	}
</script>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
   <font style="color:#419224;font-weight:bolder;font-size:30px;">要闻管理</font>
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
		  <%
    	  List<News> newslist = (List<News>)request.getAttribute("newsList"); 
    	  Iterator<News> iter = newslist.iterator(); 
    	   %>
    	  <font size="3" color="red">
    	  <%
   	    		if(session.getAttribute("message") == null);
   	    			//out.println("-----------------------");
   	    		else
   	    			out.println(session.getAttribute("message"));
   	    		session.setAttribute("message", "");
 		    %>
 		    </font><br/>
    	<table border="1" cellspacing="0" align="center">
    		<tr>
    			<td colspan=5 align="center" id="title">最新要闻列表</td>
    		</tr>
    		<tr style="font-weight: bolder">
    			<td width="100">序号</td>
    			<td>新闻标题</td>
    			<td>新闻正文预览</td>
    			<td width="150">上传日期</td>
    			<td width="80">
    			<input type="button" value="" Style="border:none;height:25px;width:75px;background:url(../images/btn_add.png)" onclick="window.location.href='news_AM.jsp?action=add'"/>
    		</tr>
    		<%for(int i=1;iter.hasNext();i++) {
    			News news = iter.next();
    		%>
    		<tr onmouseover="this.runtimeStyle.backgroundColor ='e2f9ff';" onmouseout="this.runtimeStyle.backgroundColor ='#ffffff';">
    			<td><%=i %></td>
    			<td><a href="news_AM.jsp?action=modify&&id=<%=news.getId()%>" style="font-size:16px;color:#0088cc"><%=news.getTitle() %></a></td>
    			<td><%=news.getContext().substring(0,(news.getContext().length()>10)?10:news.getContext().length())+"..." %></td>
    			<td><%=news.getDate() %></td>
    			<td><img src="../images/btn_delete.png" 
    				onclick="if(confirm('确定要删除吗？')){window.location.href='NewsList?action=del&&Id=<%=news.getId() %>';}else {return false;}"/></td>
    		</tr>
    		<%} %>
    	</table>
    		<% 
    		   int pageNum =Integer.parseInt(request.getAttribute("pageNum").toString());
    		   int pageCount = Integer.parseInt(request.getAttribute("pageCount").toString());
    		   int recordCount = Integer.parseInt(request.getAttribute("recordCount").toString());
    		%>
	   <br/> <font>第<%=pageNum %>/<%=pageCount %>页  共<%=recordCount %>记录 
	 		<%if(pageNum == 1){ %>第一页
	 		<%}else {%><a href="houtai/StaffList?action=list&&pageNum=1">第一页</a>
	 		<%} %>  
	 		<%if(pageNum == 1){ %>上一页
	 		<%}else {%><a href="houtai/StaffList?action=list&&pageNum=<%=pageNum-1%>">上一页</a>
	 		<%} %>  
	 		<%if(pageNum == pageCount){ %>下一页
	 		<%}else {%><a href="houtai/StaffList?action=list&&pageNum=<%=pageNum+1%>">下一页</a>
	 		<%} %> 
	 		<%if(pageNum == pageCount){ %>最后一页
	 		<%}else {%><a href="houtai/StaffList?action=list&&pageNum=<%=pageCount%>">最后一页</a>
	 		<%} %> </font>
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
