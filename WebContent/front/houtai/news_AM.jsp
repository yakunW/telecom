<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="cn.edu.bupt.anm.po.News"%>
<%@page import="cn.edu.bupt.anm.dao.Dao"%>
<%@page import="cn.edu.bupt.anm.factory.DaoFactory"%>

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
	<script type="text/javascript" src="../js/check.js" charset="utf-8"></script>
	<STYLE type=text/css> 
body{
	background-color: #DBFFD1;
}

</STYLE>
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
			String flag = request.getParameter("action"); 
			String add_url = "NewsList?action=add";
			String save_url = "NewsList?action=modify";
			News news = null;
			if("modify".equals(flag)){
				String s = request.getParameter("id");
	    		int i = Integer.parseInt(s);
	    		Dao dao = DaoFactory.getNewsDaoInstance();
	    		List<News> newsList = new ArrayList<News>();
	    		newsList = (List<News>)dao.list("select * from news where Id="+i); 
	    		news = newsList.get(0);
			}
		%>
    	<form action="<%="add".equals(flag) ? add_url:save_url %>" method="post">
    		<table align="center">
    			<tr>
    				<td colspan=2 align="center" id="title">
    				<%="add".equals(flag) ? "添加新闻":"修改新闻" %></td>
    			</tr>
    			<tr>
    				<td>新闻标题:&nbsp;</td>
    				<td><input type="text" name="newstitle" size="51" id="newstitle" 
    				value="<%="add".equals(flag) ? "":news.getTitle()%>" style="width:100%"/></td>
    			</tr>
    			<tr>
    				<td>新闻正文:&nbsp;</td>
    				<td><textarea rows="20" cols="50" name="newscontext" id="newscontext"><%="add".equals(flag) ? "":news.getContext()%></textarea></td>
    			</tr>
    			<tr>
    				<td colspan=2 align="center">
    				<%if("modify".equals(flag)){ %>
    					<input type="hidden" name="newsid" value="<%=news.getId() %>" />
    				<%;} %>
    				 <input type="submit" value="" Style="border:none;height:25px;width:75px;background:url(../images/btn_submit.png)" onclick="return check()"/>
		   		     <input type="reset" value="" Style="border:none;height:25px;width:75px;background:url(../images/btn_cancel.png)" onclick="window.location.href='NewsList?action=list&&pageNum=1'"/></td>
    			</tr>
    		</table>	
   		 </form>
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
