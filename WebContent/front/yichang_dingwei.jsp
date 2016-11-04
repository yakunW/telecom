<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
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

<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

      
</head>
<body onload="document.getElementById('password').focus();">
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font style="color:#419224;font-weight:bolder;font-size:30px;">基站巡检分类检测</font>
</div>

<DIV id=con style="position:absolute;top:50px;left:0px;">
  <UL id=tags>
    <LI  class=selectTag><A onClick="selectTag('tagContent0',this)" 
  href="javascript:void(0)">异常诊断列表</A> </LI>
    <LI  ><A onClick="selectTag('tagContent1',this)" 
  href="javascript:void(0)">异常诊断定位展示</A> </LI>   
  </UL>

  <DIV id=tagContent>
    <DIV class="tagContent selectTag" id=tagContent0>  
   <table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">

      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;">
		  <%
		  	Connection conn=DBConn.getConnection();
			ResultSet rs=null;
			Statement stmt=null;
			int sumitems=0;
			int index=0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
			Calendar ca=Calendar.getInstance();//获取当前日期
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			String aFirstDay=format.format(ca.getTime());
			ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
			String aLastDay=format.format(ca.getTime());
			//Sql="select baseid from dljc where  unix_timestamp(presentchecktime) between  unix_timestamp('"+ aFirstDay +"') and unix_timestamp('"+ aLastDay +"')";
			try
			{
				stmt=conn.createStatement();
				String sql_limit="where unix_timestamp(xjrq) between  unix_timestamp('"+ aFirstDay +"') and unix_timestamp('"+ aLastDay +"')";
				String sql01="select * from yichang_byq "+ sql_limit +" and ycz not in ('无','正常')";
				String sql02="select * from yichang_jdxt "+ sql_limit+"and ycz<>'正常'";
				String sql03="select * from yichang_jfhj "+ sql_limit+"and ycz<>'正常'";
				String sql04="select * from yichang_jk "+ sql_limit+"and ycz<>'正常'";
				String sql05="select * from yichang_jlpdx "+ sql_limit+"and ycz<>'正常'";
				String sql06="select * from yichang_jzzsb "+ sql_limit+"and ycz<>'正常'";
				String sql07="select * from yichang_kgdy "+ sql_limit+"and ycz<>'正常'";
				String sql08="select * from yichang_kt "+ sql_limit+"and ycz not in ('无','正常')";
				String sql09="select * from yichang_qtsb "+ sql_limit+"and ycz not in ('无','正常')";
				String sql10="select * from yichang_td "+ sql_limit+"and ycz not in ('无','是')";
				String sql11="select * from yichang_tt "+ sql_limit+"and ycz<>'是'";
				String sql12="select * from yichang_tw "+ sql_limit+"and ycz not in ('否','正常')";
				String sql13="select * from yichang_xdcjc "+ sql_limit+"and ycz<>'无'";
				String sql14="select * from yichang_sbjc "+ sql_limit+"and ycz not in ('是','正常')";

				String sql = sql01 + " union all " + sql02+ " union all " + sql03+ " union all " + sql04+ " union all " + sql05+ " union all "
						   + sql06 + " union all " + sql07+ " union all " + sql08+ " union all " + sql09+ " union all " + sql10+ " union all "
						   + sql11 + " union all " + sql12+ " union all " + sql13+ " union all " + sql14;
				rs=stmt.executeQuery(sql);
		  		while(rs.next()){
            	if(sumitems%10==0){
            %>
		  <TABLE class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
                <TR>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>基站编号</TD>
                  <TD class=gridViewHeader style="WIDTH: 20%" scope=col>基站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>基站等级</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检人员</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>异常类型</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>异常内容</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>异常数据</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检日期</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>所属表</TD>
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
       		                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(3) %></TD>
       		                  <TD class=gridViewItem><%=rs.getString(4) %></TD>
       		                  <TD class=gridViewItem><%=rs.getString(5) %></TD>
       		                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(6) %></TD>
       		                  <TD class=gridViewItem><%=rs.getString(7) %></TD>
       		                  <TD class=gridViewItem><%=rs.getString(8) %></TD>
       		                  <TD class=gridViewItem><%=rs.getString(9) %></TD>
       		                 
       		                </TR>
       		                <%
                if(sumitems%10==0){ %>
            </TABLE>
            <%} %>
            <%}
            if(sumitems%10!=0){%>
            </TABLE>
            <%}//conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					//DBConn.closeResultSet(rs);
					//DBConn.closeStatement(stmt);
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

</table>
   
    </DIV>
    
    <!-- 第二个div开始 -->
    <DIV class="tagContent" id=tagContent1>    
 <div style="width:100%;height:500px;right:10px;border:#ccc solid 1px;" id="dituContent">
	 <script type="text/javascript" src="http://api.map.baidu.com/api?key=C26oZ90LqLDRYIUfSkCex6cV&v=1.1&services=true"></script>
   </div> 
    </div>
    <!-- 第二个div结束 -->
  <script type="text/javascript">
    //创建和初始化地图函数：
    function initMap(){
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
        //addMarker1();//向地图中添加marker
    }
    
    //创建地图函数：
    function createMap(){
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(109.248399,35.196491);//定义一个中心点坐标
        map.centerAndZoom(point,10);//设定地图的中心点和坐标并将地图显示在地图容器中
        window.map = map;//将map变量存储在全局
    }
    
    //地图事件设置函数：
    function setMapEvent(){
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.enableScrollWheelZoom();//启用地图滚轮放大缩小
        map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }
    
    //地图控件添加函数：
    function addMapControl(){
                        }
    
    <%
  
	
	
	try
	{

		String sql_limit = "and unix_timestamp(xjrq) between  unix_timestamp('"+ aFirstDay +"') and unix_timestamp('"+ aLastDay +"')";
		String sql01 = "select distinct yichang_byq.baseName,longitude,latitude,yclx,yccs,ycz from yichang_byq,base where yichang_byq.baseName=base.baseName "+ sql_limit;
		String sql02 = "select distinct yichang_jdxt.baseName,longitude,latitude,yclx,yccs,ycz from yichang_jdxt,base where yichang_jdxt.baseName=base.baseName "+ sql_limit;
		String sql03 = "select distinct yichang_jfhj.baseName,longitude,latitude,yclx,yccs,ycz from yichang_jfhj,base where yichang_jfhj.baseName=base.baseName "+ sql_limit;
		String sql04 = "select distinct yichang_jk.baseName,longitude,latitude,yclx,yccs,ycz from yichang_jk,base where yichang_jk.baseName=base.baseName "+ sql_limit;		
		String sql05 = "select distinct yichang_jlpdx.baseName,longitude,latitude,yclx,yccs,ycz from yichang_jlpdx,base where yichang_jlpdx.baseName=base.baseName "+ sql_limit;
		String sql06 = "select distinct yichang_jzzsb.baseName,longitude,latitude,yclx,yccs,ycz from yichang_jzzsb,base where yichang_jzzsb.baseName=base.baseName "+ sql_limit;
		String sql07 = "select distinct yichang_kgdy.baseName,longitude,latitude,yclx,yccs,ycz from yichang_kgdy,base where yichang_kgdy.baseName=base.baseName "+ sql_limit;
		String sql08 = "select distinct yichang_kt.baseName,longitude,latitude,yclx,yccs,ycz from yichang_kt,base where yichang_kt.baseName=base.baseName "+ sql_limit;
		String sql09 = "select distinct yichang_qtsb.baseName,longitude,latitude,yclx,yccs,ycz from yichang_qtsb,base where yichang_qtsb.baseName=base.baseName "+ sql_limit;
		String sql10 = "select distinct yichang_td.baseName,longitude,latitude,yclx,yccs,ycz from yichang_td,base where yichang_td.baseName=base.baseName "+ sql_limit;
		String sql11 = "select distinct yichang_tt.baseName,longitude,latitude,yclx,yccs,ycz from yichang_tt,base where yichang_tt.baseName=base.baseName "+ sql_limit;
		String sql12 = "select distinct yichang_tw.baseName,longitude,latitude,yclx,yccs,ycz from yichang_tw,base where yichang_tw.baseName=base.baseName "+ sql_limit;
		String sql13 = "select distinct yichang_xdcjc.baseName,longitude,latitude,yclx,yccs,ycz from yichang_xdcjc,base where yichang_xdcjc.baseName=base.baseName "+ sql_limit;
		String sql14 = "select distinct yichang_sbjc.baseName,longitude,latitude,yclx,yccs,ycz from yichang_sbjc,base where yichang_sbjc.baseName=base.baseName "+ sql_limit;
		
		
		
		String sql = sql01 +" union all "+ sql02 +" union all "+ sql03 +" union all "+ sql04 +" union all "
				   + sql05 +" union all "+ sql06 +" union all "+ sql07 +" union all "+ sql08 +" union all "
				   + sql09 +" union all "+ sql10 +" union all "+ sql11 +" union all "+ sql12 +" union all "
				   + sql13 +" union all "+ sql14;
		rs=stmt.executeQuery(sql);
		
  		int i = 0;
  		rs.last();
  		%>
  		
  		var markerArr = new Array(<%=rs.getRow() %>);
  		
  		<%
  		rs.beforeFirst();
		while(rs.next()){
  			if(rs.getString(4).equals("机房环境"))
		        {
	  				if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
					}
		        }
				else if(rs.getString(4).equals("空调"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false && rs.getString(6).equals("无")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
				    }	        	
		        }
				else if(rs.getString(4).equals("变压器"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("异常"))
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
				    }
		        }
				else if(rs.getString(4).equals("交流配电箱"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          		<%
		        	}
		        }
				else if(rs.getString(4).equals("基站主设备"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
				    }		        	
		        }
				else if(rs.getString(4).equals("其他设备"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false && rs.getString(6).equals("无")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
				    }		        	
		        }
				else if(rs.getString(4).equals("开关电源"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
					}
		        }
				else if(rs.getString(4).equals("监控"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		      			<%
					}	        	
		        }
				else if(rs.getString(4).equals("接地系统"))
		        {
					if(rs.getString(6)==null)
		        	{
		        		
					}
	  				else if(rs.getString(6).equals("正常")==false)
		        	{
		        		%>
		        		markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          		<%
		        	}		        	
		        }
				else if(rs.getString(4).equals("塔桅、天馈/GPS"))
		        {
		        	if(rs.getString(5).equals("BTS天线是否倾斜、松动"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("是"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("塔桅连接件"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("正常")==false)
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}		        	
		        }
				else if(rs.getString(4).equals("铁塔塔体"))
		        {
		        	if(rs.getString(5).equals("铁塔整体垂直度是否正常"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("铁塔局部弯曲度是否正常"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}		        	
		        }
				else if(rs.getString(4).equals("铁塔塔灯"))
		        {
		        	if(rs.getString(5).equals("塔灯是否正常"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}		     
		        }
				else if(rs.getString(4).equals("蓄电池检查"))
		        {
		        	if(rs.getString(5).equals("电池壳体有无渗漏和变形"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("有"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("连接处有无松动、腐蚀现象"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("有"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("极柱、安全阀周围有无酸雾、酸液逸出"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("有"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}	        	
		        }
				else if(rs.getString(4).equals("设备检查"))
		        {
		        	if(rs.getString(5).equals("设备运行状态是否正常"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("监控模块是否正常运行"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("电源设备（整流器、蓄电池）是否完好"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("传输设备是否完好"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("否"))
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        	else if(rs.getString(5).equals("室外天馈的外观检查"))
		        	{
		        		if(rs.getString(6)==null)
			        	{
			        		
						}
		  				else if(rs.getString(6).equals("正常")==false)
		        		{
		        			%>
		        			markerArr[<%=i++%>] = {title:"<%=rs.getString(1) %>",content:"（<%=rs.getString(4) %>）<%=rs.getString(5)%>：<%=rs.getString(6)%>",point:"<%=rs.getString(2) %>|<%=rs.getString(3) %>",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}};
		          			<%
		        		}
		        	}
		        }
  			}
  		conn.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	finally{
		DBConn.closeResultSet(rs);
		DBConn.closeStatement(stmt);
	} %>
  		
    
    //标注点数组
/*  var markerArr = [{title:"新区_电信大楼12楼室分_CMIT",content:"我的备注",point:"108.947949|34.898272",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}}
		 ,{title:"印台_陈炉镇上店村_CGIT",content:"我的备注",point:"109.149334|35.054449",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}}
		 ,{title:"宜君_雷塬乡英家塬村_CMIT",content:"我的备注",point:"109.351006|35.405005",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}}
		 ,{title:"印台_金锁关镇半截沟村_DMOU",content:"我的备注",point:"109.040225|35.251793",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}}
		 ,{title:"新区_袁家村_AMIT",content:"我的备注",point:"108.955507|34.892805",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_关庄镇麻子村_CMIT",content:"我的备注",point:"108.899059|34.954645",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_黄堡电信分局_BMIT",content:"我的备注",point:"109.023368|35.003586",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_陈炉镇穆家庄村_CMIT",content:"我的备注",point:"109.109868|35.043388",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_关庄镇道东村_CMIT",content:"我的备注",point:"108.840079|34.997011",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_咸丰路汽车站_BMIT",content:"我的备注",point:"108.945738|34.915772",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_庙湾镇玉门村_DMIT",content:"我的备注",point:"108.721285|35.183103",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_大同路中心血站_AMIT",content:"我的备注",point:"109.091727|35.0734",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_中兴堤崔家沟检察院_BMIT",content:"我的备注",point:"109.067656|35.061514",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_陈炉镇雷家坡村芋园_CMIT",content:"我的备注",point:"109.194355|35.058543",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_北关电信分局_AMIT",content:"我的备注",point:"109.09475|35.11431",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_耀县西城南巷_BMIT",content:"我的备注",point:"108.973685|34.903279",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_五里镇榆舍村_CMIT",content:"我的备注",point:"109.240616|35.408303",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_尧生乡_CMIU",content:"我的备注",point:"109.343776|35.429923",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_尧生乡尧生村_DMIT",content:"我的备注",point:"109.398772|35.422435",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_尧生乡王尧科村_CMIT",content:"我的备注",point:"109.403513|35.455846",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_雷塬乡_DMOU",content:"我的备注",point:"109.393217|35.373152",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_西村乡东定龙村_CMIT",content:"我的备注",point:"109.40676|35.48985",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_彭镇拔头塬村_DMOT",content:"我的备注",point:"109.242158|35.477946",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_彭镇东村_DMIT",content:"我的备注",point:"109.2029|35.512832",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_红旗街电信营业厅室分_BMIT",content:"我的备注",point:"109.071591|35.070718",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_城关镇金盆村_DMIT",content:"我的备注",point:"109.108956|35.373286",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_哭泉乡油坊台_CMOT",content:"我的备注",point:"109.080102|35.325943",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_哭泉乡_CMIU",content:"我的备注",point:"109.079285|35.295085",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_棋盘镇水沟门村_DMIT",content:"我的备注",point:"109.145256|35.287818",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_王益乡老科沟山顶_AMIT",content:"我的备注",point:"109.099109|35.080067",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_西村乡西村_CMOU",content:"我的备注",point:"109.352484|35.485441",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_哭泉乡寨里坡村阳坡_DMOU",content:"我的备注",point:"109.073361|35.249071",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_文明源村_DMIU",content:"我的备注",point:"109.070105|34.97848",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_电信大楼_BMIT",content:"我的备注",point:"108.93355|34.893096",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_下马村_BMIT",content:"我的备注",point:"109.071073|35.00079",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_新村_CMIT",content:"我的备注",point:"109.005722|34.991749",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_尧生乡思弥村_DMIT",content:"我的备注",point:"109.432611|35.419962",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_照金镇高尔塬村_CMOT",content:"我的备注",point:"108.697148|35.0044",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_虎头山教育学院_BMIT",content:"我的备注",point:"109.074511|35.076893",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_铜川阳光中学_AMIT",content:"我的备注",point:"108.942758|34.893155",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_斯正街_AMIT",content:"我的备注",point:"108.935586|34.896943",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_金达路裕丰园物业楼_AMIT",content:"我的备注",point:"108.938696|34.917161",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_耀州路中段_BMOT",content:"我的备注",point:"108.969242|34.91058",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_高楼河镇四兴村_CMIT",content:"我的备注",point:"109.429096|35.11454",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_董坡村_BMIT",content:"我的备注",point:"108.935055|34.926642",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"王益_王家河中学_BMIT",content:"我的备注",point:"109.036444|35.081225",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_李家沟村_BMIT",content:"我的备注",point:"109.031579|35.020183",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_陈坪小学_BMIT",content:"我的备注",point:"108.962668|34.838052",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_太安镇_CMIT",content:"我的备注",point:"108.963994|35.349812",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_金鼎路_AMIT",content:"我的备注",point:"108.950867|34.906632",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_董家河镇西柳池村_CMIT",content:"我的备注",point:"108.960114|34.992292",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_红土镇金华山八面窑_BMIT",content:"我的备注",point:"109.26475|35.100608",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_高楼河镇郗家塬村_CMIT",content:"我的备注",point:"109.386714|35.144012",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_红土镇庞家河村_CMIT",content:"我的备注",point:"109.210124|35.143244",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_高楼河镇高楼河村_DMIU",content:"我的备注",point:"109.415576|35.147675",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"宜君_云梦乡_CMOU",content:"我的备注",point:"109.179647|35.214873",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_阿子乡_CMIU",content:"我的备注",point:"108.809082|34.946419",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"黄堡_罗寨村_CMIU",content:"我的备注",point:"109.076588|35.026441",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"印台_广阳镇上马村_CMIU",content:"我的备注",point:"109.318436|35.144903",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_电信大楼12楼室分1_CMIT",content:"我的备注",point:"108.933222|34.893227",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_鸿基东路药监局_BMIT",content:"我的备注",point:"108.953207|34.897123",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"新区_金谟西路_BMIT",content:"我的备注",point:"108.931752|34.904234",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_照金镇香山寺_CMIT",content:"我的备注",point:"108.737533|35.122882",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ,{title:"耀州_庙湾镇西川煤矿_CMIT",content:"我的备注",point:"108.683464|35.174559",isOpen:0,icon:{w:21,h:21,l:0,t:46,x:1,lb:10}}
		 ];
 */
   
    //创建marker
    function addMarker(){		   
	    var hashmap = {  
	    		Set : function(key,value){this[key] = value;},  
	    		Get : function(key){return this[key];},  
	    		Contains : function(key){return this.Get(key) == null?false:true;},  
	    		Remove : function(key){delete this[key];}  
	    		}
	    var content="";
        for(var i=0;i<markerArr.length;i++){
        	
            var json = markerArr[i];  
            if(hashmap.Contains(json.title))
            { 
            	var a=json.content+"<br>"+hashmap.Get(json.title);
            	hashmap.Set(json.title,a);	
            } 
            
            else
            {
            	hashmap.Set(json.title,json.content);	
            }
            var p0 = json.point.split("|")[0];
            var p1 = json.point.split("|")[1];
            var point = new BMap.Point(p0,p1);
			var iconImg = createIcon(json.icon);
            var marker = new BMap.Marker(point,{icon:iconImg});
			var iw = createInfoWindow(i,hashmap);
			var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
			marker.setLabel(label);
            map.addOverlay(marker);
            label.setStyle({
                        borderColor:"#808080",
                        color:"#333",
                        cursor:"pointer"
            });
			
			(function(){
				var index = i;
				var _iw = createInfoWindow(i,hashmap);
				var _marker = marker;
				_marker.addEventListener("click",function(){
				    this.openInfoWindow(_iw);
			    });
			    _iw.addEventListener("open",function(){
				    _marker.getLabel().hide();
			    })
			    _iw.addEventListener("close",function(){
				    _marker.getLabel().show();
			    })
				label.addEventListener("click",function(){
				    _marker.openInfoWindow(_iw);
			    })
				if(!!json.isOpen){
					label.hide();
					_marker.openInfoWindow(_iw);
				}
			})()
        }
    }
   
    //创建InfoWindow
    function createInfoWindow(i,hashmap){
        var json = markerArr[i];
        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+hashmap.Get(json.title)+"</div>");
        return iw;
    }
    //创建一个Icon
    function createIcon(json){
        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)});
        return icon;
    }
    
    initMap();//创建和初始化地图
</script>
    
    
    
    
    
  </DIV>
</DIV>

</body>
</html>
