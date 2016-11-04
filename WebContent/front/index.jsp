<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>欢迎使用基站检测运维支撑智能管理系统 -- 北京邮电大学ANM研究中心</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<frameset rows="150,*,30"  frameborder="NO" border="0" framespacing="0">
	<frame src="top.jsp" noresize="noresize" frameborder="0" name="topFrame" scrolling="no" marginwidth="0" marginheight="0" target="main" />
  <frameset cols="200,*"  rows="560" id="frame">
	<frame src="<%=Integer.parseInt(session.getAttribute("Privacy").toString()) == 2 ?"left.jsp":"admin/left_admin.jsp" %>" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="main" />
	<frame src="<%=Integer.parseInt(session.getAttribute("Privacy").toString()) == 2?"welcome.jsp":"admin/admin_welcome.jsp" %>" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="auto" target="_self" />
</frameset>
	<frame src="bottom.html" name="bottom" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" target="_self" />
    </frameset>
</html>