<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理页面</title>
<style>
body {
	font:12px Arial, Helvetica, sans-serif;
	color: #000;
	background-color: #83e468;
	margin: 0px auto;
}
#container {
	width: 182px;
}
H1 {
	font-size: 12px;
	margin: 0px;
	width: 182px;
	cursor: pointer;
	height: 30px;
	line-height: 20px;	
}
H1 a {
	display: block;
	width: 182px;
	color: #fff;
	height: 30px;
	text-decoration: none;
	moz-outline-style: none;
	background-repeat: no-repeat;
	line-height: 30px;
	text-align: center;
	margin: 0px;
	padding: 0px;
}
.content{
	width: 182px;
	height: 26px;
	
}
.MM ul {
	list-style-type: none;
	margin: 0px;
	padding: 0px;
	display: block;
}
.MM li {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	list-style-type: none;
	display: block;
	text-decoration: none;
	height: 26px;
	width: 182px;
	padding-left: 0px;
}
.MM {
	width: 182px;
	margin: 0px;
	padding: 0px;
	left: 0px;
	top: 0px;
	right: 0px;
	bottom: 0px;
	clip: rect(0px,0px,0px,0px);
}
.MM a:link {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:visited {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
.MM a:active {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	color: #333333;
	background-image: url(images/menu_bg1.gif);
	background-repeat: no-repeat;
	height: 26px;
	width: 182px;
	display: block;
	text-align: center;
	margin: 0px;
	padding: 0px;
	overflow: hidden;
	text-decoration: none;
}
.MM a:hover {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	line-height: 26px;
	font-weight: bold;
	color: #006600;
	background-image: url(images/menu_bg2.gif);
	background-repeat: no-repeat;
	text-align: center;
	display: block;
	margin: 0px;
	padding: 0px;
	height: 26px;
	width: 182px;
	text-decoration: none;
}
</style>
<script src="js/prototype.lite.js" type="text/javascript"></script>
<script src="js/moo.fx.js" type="text/javascript"></script>
<script src="js/moo.fx.pack.js" type="text/javascript"></script>

</head>

<body>
<div>
<table width="100%" height="280" border="0" cellpadding="0" cellspacing="0" bgcolor="#83e468" style="margin-left:10px;margin-top:35px">
  <tr>
    <td width="182" valign="top"><div id="container">
      <div>
        <ul class="MM">
          <li><a href="welcome.jsp" target="main">系统首页</a></li>
          <li><a href="edit_pswd.jsp" target="main">个人修改密码</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)" style="background-image: url(images/menu_bgs_3.gif);">安防巡检支撑</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
           <li><a href="task.action" target="main">基站巡检员工管理</a></li>
		  <li><a href="getXunjianZt.action" target="main">基站巡检分类检测</a></li>

        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)" style="background-image: url(images/menu_bgs_4.gif);">基站配置管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
            
         
          <li><a href="bs_peizhi.jsp" target="main">基站配置组态管理</a></li>
          <li><a href="yichang_dingwei.jsp" target="main">异常检测诊断定位</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)" style="background-image: url(images/menu_bgs_5.gif);">巡检统计查询</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="xunjiantj.jsp" target="main">巡检综合统计查询</a></li>
	      <li><a href="yichangjc.jsp" target="main">异常检测诊断统计查询</a></li>
        </ul>
      </div>
      <h1 class="type"><a href="javascript:void(0)" style="background-image: url(images/menu_bgs_6.gif);">电量检测统计</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="jiance.jsp" target="main">基站用电检测</a></li>
          <li><a href="eleccheck.jsp" target="main">电量统计查询</a></li>
        </ul>
      </div>
      
      </div>
      <h1 class="type"><a href="javascript:void(0)" style="background-image: url(images/menu_bgs_7.gif);">系统综合管理</a></h1>
      <div class="content">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><img src="images/menu_topline.gif" width="182" height="5" /></td>
          </tr>
        </table>
        <ul class="MM">
          <li><a href="login.jsp" target="main">高级管理员登录</a></li>
          <li><a href="houtai/StaffList?action=list&&pageNum=1" target="main">巡检员工管理</a></li>
          <li><a href="houtai/TaskList?action=list&&pageNum=1" target="main">巡检员工任务分配管理</a></li>
          <li><a href="houtai/BaseList?action=list&&pageNum=1" target="main">基站配置组态管理</a></li>
          <li><a href="houtai/database.jsp" target="main">数据库管理</a></li>
          <li><a href="houtai/NewsList?action=list&&pageNum=1" target="main">要闻管理</a></li>
          <li><a href="houtai/picUpload.jsp" target="main">图片管理</a></li>
        </ul>
      </div>
        <script type="text/javascript">
		var contents = document.getElementsByClassName('content');
		var toggles = document.getElementsByClassName('type');
	
		var myAccordion = new fx.Accordion(
			toggles, contents, {opacity: true, duration: 400}
		);
		myAccordion.showThisHideOpen(contents[0]);
	</script>
        </td>
  </tr>
</table>
</div>
</body>
</html>
