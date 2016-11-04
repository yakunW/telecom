<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="dbc.DBConn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <base href="<%=basePath%>">
    
    <title>基站巡检分类检测</title>
    
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
<%
	Connection conn1=DBConn.getConnection();
	ResultSet rs1=null;
	PreparedStatement pstmt = null;
	String Sqla="select baseId from base where category=0 and level='A'";
    String Sqlb="select baseId from base where category=0 and level='B'";
    String Sqlcd="select baseId from base where category=0 and level='C' or level='D'";
    String Sqlsn="select baseId from base where category=1";
    String Sqlsw="select baseId from base where category=2";
    String Sqltt="select baseId from base where category=0";
	
	int ca=0;
	int cb=0;
	int ccd=0;
	int csn=0;
	int csw=0;
	int ctt=0;
	try
	{
			pstmt=conn1.prepareStatement(Sqla);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				ca++;}			
	}catch(Exception e){}
	try
	{
			pstmt=conn1.prepareStatement(Sqlb);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				cb++;}
	}catch(Exception e){}
	try
	{
			pstmt=conn1.prepareStatement(Sqlcd);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				ccd++;}
	}catch(Exception e){}
	try
	{
			pstmt=conn1.prepareStatement(Sqlsn);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				csn++;}
	}catch(Exception e){}
	try
	{
			pstmt=conn1.prepareStatement(Sqlsw);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				csw++;}
	}catch(Exception e){}
	try
	{
			pstmt=conn1.prepareStatement(Sqltt);
			rs1=pstmt.executeQuery();
			while(rs1.next()){
				ctt++;}
	}catch(Exception e){}
	
%>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
       <script type="text/javascript" src="js/highcharts.js"></script>
       <script type="text/javascript">
        $(function () { 		
    var chart1=$('#container1').highcharts({
    
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            reflow:true
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（），欢迎加入Highcharts学习交流群294191384
                       '#FF8800' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countA") %> ],           
                ['未巡检',   <%=ca-Integer.parseInt(request.getAttribute("countA").toString()) %> ]
            ]
        }]
    });
    
    var chart2=$('#container2').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（黄），欢迎加入Highcharts学习交流群294191384
                       '#FF8800' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countB") %>],           
                ['未巡检',   <%=cb-Integer.parseInt(request.getAttribute("countB").toString()) %>]
            ]
        }]
    });
    
    var chart3=$('#container3').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（黄），欢迎加入Highcharts学习交流群294191384
                       '#FF8800 ' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countCD") %>],           
                ['未巡检',   <%=ccd-Integer.parseInt(request.getAttribute("countCD").toString()) %>]
            ]
        }]
    });
    
    var chart4=$('#container4').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（黄），欢迎加入Highcharts学习交流群294191384
                       '#FF8800' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countTT") %>],           
                ['未巡检',   <%=ctt-Integer.parseInt(request.getAttribute("countTT").toString()) %>]
            ]
        }]
    });
    
    var chart5=$('#container5').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（黄），欢迎加入Highcharts学习交流群294191384
                       '#FF8800' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countSN") %>],           
                ['未巡检',   <%=csn-Integer.parseInt(request.getAttribute("countSN").toString()) %>]
            ]
        }]
    });
    
    var chart6=$('#container6').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        '#40ffff',//第一个颜色（黄），欢迎加入Highcharts学习交流群294191384
                       '#FF8800 ' ,//第二个颜色
                       '#00FFFF',//第三个颜色
                       '#1aadce', //。。。。
                           '#492970',
                           '#f28f43', 
                           '#77a1e5', 
                           '#c42525', 
                           '#a6c96a'
                      ],
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已巡检',   <%=request.getAttribute("countSW") %>],           
                ['未巡检',   <%=csw-Integer.parseInt(request.getAttribute("countSW").toString()) %>]
            ]
        }]
    });
});
       </script>
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
     text-align:center;
     width:100%;
      }
      .chakan td{
      padding:10px;
      }
      #caption{
      font-size:30px;
      }
      #daohang{
      position:relative;
      top:30px;
      left:170px;
      }
      </style>
</head>
<body onload="document.getElementById('password').focus();">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font style="color:#419224;font-weight:bolder;font-size:30px;">基站巡检分类检测</font>
</div>

<DIV id=con style="position:absolute;top:50px;left:0px;">
  <UL id=tags>
    <LI  class=selectTag><A onClick="selectTag('tagContent0',this)" 
  href="javascript:void(0)">A类基站巡检</A> </LI>
    <LI  ><A onClick="selectTag('tagContent1',this)" 
  href="javascript:void(0)">B类基站巡检</A> </LI>   
  <LI  ><A onClick="selectTag('tagContent2',this)" 
  href="javascript:void(0)">C/D类基站巡检</A> </LI>
  <LI  ><A onClick="selectTag('tagContent3',this)" 
  href="javascript:void(0)">铁塔巡检</A> </LI>
   <LI  ><A onClick="selectTag('tagContent4',this)" 
  href="javascript:void(0)">室分巡检</A> </LI>
   <LI  ><A onClick="selectTag('tagContent5',this)" 
  href="javascript:void(0)">室外直放站巡检 </A> </LI>
  </UL>

  <DIV id=tagContent>
    <DIV class="tagContent selectTag" id=tagContent0>  
   
    <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离A类基站巡检截止日期还有<%=request.getAttribute("leftA")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量：<%=request.getAttribute("countA") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=0&level=A','11','newwindow','width=600')"/>
    </td>
    <td id="container1" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=ca-Integer.parseInt(request.getAttribute("countA").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=0&level=A','12','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=ca %></font></td>
    </tr>
    </table>
    </DIV>
    
    <!-- 第二个div开始 -->
    <DIV class="tagContent" id=tagContent1>    
      <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离B类基站巡检截止日期还有<%=request.getAttribute("leftB")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量：<%=request.getAttribute("countB") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=0&level=B','21','newwindow','width=600')"/>
    </td>
    <td id="container2" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=cb-Integer.parseInt(request.getAttribute("countB").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=0&level=B','22','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=cb %></font></td>
    </tr>
    </table>
    </div>
    <!-- 第二个div结束 -->
    
    <!-- 第三个div开始 -->
    <DIV class="tagContent" id=tagContent2>    
    <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离C/D类基站巡检截止日期还有<%=request.getAttribute("leftCD")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量： <%=request.getAttribute("countCD") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=0&level=CD','31','newwindow','width=600')"/>
    </td>
    <td id="container3" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=ccd-Integer.parseInt(request.getAttribute("countCD").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=0&level=CD','32','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=ccd %></font></td>
    </tr>
    </table>
    </DIV>
    <!-- 第三个div结束 -->
    
    <!-- 第四个div开始 -->
    <DIV class="tagContent" id=tagContent3>    
    <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离铁塔巡检截止日期还有<%=request.getAttribute("leftTT")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量： <%=request.getAttribute("countTT") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=0&level=','41','newwindow','width=600')"/>
    </td>
    <td id="container4" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=ctt-Integer.parseInt(request.getAttribute("countTT").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=0&level=','42','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=ctt %></font></td>
    </tr>
    </table>
    </DIV>
    <!-- 第四个div结束 -->
    
    
     <!-- 第五个div开始 -->
    <DIV class="tagContent" id=tagContent4>    
    <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离室分巡检截止日期还有<%=request.getAttribute("leftA")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量： <%=request.getAttribute("countSN") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=1&level=A','51','newwindow','width=600')"/>
    </td>
    <td id="container5" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=csn-Integer.parseInt(request.getAttribute("countSN").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=1&level=A','52','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=csn %></font></td>
    </tr>
    </table>
    </DIV>
    <!-- 第五个div结束 -->
    
     <!-- 第六个div开始 -->
    <DIV class="tagContent" id=tagContent5>    
    <table class="chakan" align="center" border="1px">
    <tr>
    <td colspan="2"><font size="5px" style="font-weight:bold">距离室外直放站巡检截止日期还有<%=request.getAttribute("leftCD")%>天</font> </td>
    </tr>
    <tr>
    <td><font  style="font-weight:bold">巡检检测状态查看</font></td>
    <td><font  style="font-weight:bold">巡检状态图形展示</font></td>
    </tr>
    <tr>
    <td >已完成巡检数量： <%=request.getAttribute("countSW") %><br/><input type="image" src="images/btn_see.png" onclick="window.open('getchecked.action?category=2&level=','61','newwindow','width=600')"/>
    </td>
    <td id="container6" rowspan="3" height="380px" width="67%"> </td>
    </tr>
    <tr>
    <td>未完成巡检数量：<%=csw-Integer.parseInt(request.getAttribute("countSW").toString()) %><br/> <input type="image" src="images/btn_see.png" onclick="window.open('getuncheck.action?category=2&level=','62','newwindow','width=600')"/></td>
    </tr>
    <tr>
    <td>巡检基站总数量：<font size="auto"><%=csw %></font></td>
    </tr>
    </table>
    </DIV>
    <!-- 第六个div结束 -->
  </DIV>
</DIV>

</body>
</html>
