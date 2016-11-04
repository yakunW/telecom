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
 
    <base href="<%=basePath%>">
    
    <title>基站巡检员工管理</title>
    
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
<STYLE type=text/css>
BODY { FONT-SIZE: 14px; FONT-FAMILY: "宋体" }
OL LI { MARGIN: 8px }
#con { FONT-SIZE: 12px; MARGIN: 0px auto; WIDTH: 100% }
#tags { PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; MARGIN: 0px 0px 0px 10px; WIDTH: 100%; PADDING-TOP: 0px; HEIGHT: 23px }
#tags LI { BACKGROUND: url(images/tagleft.gif) no-repeat left bottom; FLOAT: left; MARGIN-RIGHT: 1px; LIST-STYLE-TYPE: none; HEIGHT: 23px }
#tags LI A { PADDING-RIGHT: 10px; PADDING-LEFT: 10px; BACKGROUND: url(images/tagright.gif) no-repeat right bottom; FLOAT: left; PADDING-BOTTOM: 0px; COLOR: #999; LINE-HEIGHT: 23px; PADDING-TOP: 0px; HEIGHT: 23px; TEXT-DECORATION: none }
#tags LI.emptyTag { BACKGROUND: none transparent scroll repeat 0% 0%; WIDTH: 4px }
#tags LI.selectTag { BACKGROUND-POSITION: left top; MARGIN-BOTTOM: -2px; POSITION: relative; HEIGHT: 25px }
#tags LI.selectTag A { BACKGROUND-POSITION: right top; COLOR: #000; LINE-HEIGHT: 25px; HEIGHT: 25px }
#tagContent { BORDER-RIGHT: #aecbd4 1px solid; PADDING-RIGHT: 1px; BORDER-TOP: #aecbd4 1px solid; PADDING-LEFT: 1px; PADDING-BOTTOM: 1px; BORDER-LEFT: #aecbd4 1px solid; PADDING-TOP: 1px; BORDER-BOTTOM: #aecbd4 1px solid; BACKGROUND-COLOR: #fff }
.tagContent { PADDING-RIGHT: 10px; DISPLAY: none; PADDING-LEFT: 10px; BACKGROUND: url(images/tagbg.gif) repeat-x; PADDING-BOTTOM: 10px; WIDTH: 98%; COLOR: #474747; PADDING-TOP: 10px; HEIGHT: 500px }
#tagContent DIV.selectTag { DISPLAY: block }
</STYLE>
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
    </style>
<SCRIPT type=text/javascript>
function selectTag(showContent,selfObj){
	// 操作标签
	var tag = document.getElementById("tags").getElementsByTagName("li");
	var taglength = tag.length;
	for(var i=0; i<taglength; i++){
		tag[i].className = "";
	}
	selfObj.parentNode.className = "selectTag";
	// 操作内容
	for(i=0; j=document.getElementById("tagContent"+i); i++){
	 
		j.style.display = "none";
	}
	document.getElementById(showContent).style.display = "block";
	
	
}
</SCRIPT>

        <style type="text/css">  
    a{
    color:#227700;
    text-decoration:none;
    }
    #xiangxi{
    text-align:center;
    margin-top:15px;
    margin-left:10px;
    margin-right:10px;
    }
    #nobreak{
    word-break: keep-all;
white-space:nowrap;
    }
    
    #fanye td{
text-align:right;
}
   .yixunjian{
   color:#227700;
   }
    </style>
      <style type="text/css">
      .chakan{   
      margin-top:55px;  
     text-align:center;
      }
      .chakan td{
      padding:10px;
      }
      #caption{
      font-size:30px;
      }
      </style>
</head>
<body onload="document.getElementById('password').focus();">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font style="color:#419224;font-weight:bolder;font-size:30px;">基站巡检员工管理</font>
</div>

<DIV id=con style="position:absolute;top:50px;left:0px;">
  <UL id=tags>
    <LI  class=selectTag><A onClick="selectTag('tagContent0',this)" 
  href="javascript:void(0)">基站巡检员工管理</A> </LI>
  </UL>
<% List<Task> taskList=new ArrayList<Task>();
   taskList=(List<Task>)request.getAttribute("taskList");
 %>
  <DIV id=tagContent>
    <DIV class="tagContent selectTag" id=tagContent0>
    <table class="chakan" align="center" border="1px">
    <tr>
        <td>工作站</td>
        <td>巡检人员</td>
        <td>负责人</td>
        <td>维护区域</td>
    </tr>
     <%for(int i=0;i<taskList.size();i++){ %>
     <tr>
     <td><%=taskList.get(i).getStationName() %></td>
     <td><%=taskList.get(i).getNames() %></td>
     <td><%=taskList.get(i).getLeader()%></td>
     <td><%=taskList.get(i).getAreas() %></td>
     </tr>
     <%} %>
    </table>
    </DIV>
    
   
    
   
  </DIV>
</DIV>

</body>
</html>
