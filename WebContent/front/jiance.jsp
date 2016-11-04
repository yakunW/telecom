<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.util.Date"%>
<%@ page language="java" import="dbc.DBConn"%>
<%@ page language="java" import="java.text.*" %>
<%@ page language="java" import="java.math.*"%>
<%@page import="zlq.bean.ElecDao"%>
<%@page import="zlq.bean.ElecDaoFactory"%>
<%@page import="zlq.bean.Elec"%>
<%@page import="java.util.Calendar;"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
String picPath=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/uploadImg/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 
    <base href="<%=basePath%>">
    
    <title>电量统计/查询</title>
    
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
   String Sql="select baseId from base";
   Connection conn1=DBConn.getConnection();
   ResultSet rs1=null;
   PreparedStatement pstmt = null;
   int total=0;
   try
   {
		pstmt=conn1.prepareStatement(Sql);
		rs1=pstmt.executeQuery();
		while(rs1.next()){
		   total++;}
   }catch(Exception e){}
   
   SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
   Calendar ca=Calendar.getInstance();//获取当前日期
   ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
   String aFirstDay=format.format(ca.getTime());
   ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
   String aLastDay=format.format(ca.getTime());
   Sql="select distinct baseid from dljc where  unix_timestamp(presentchecktime) between  unix_timestamp('"+ aFirstDay +"') and unix_timestamp('"+ aLastDay +"')";
   int checkednum=0;
   try
   {
		pstmt=conn1.prepareStatement(Sql);
		rs1=pstmt.executeQuery();
		while(rs1.next()){
		   checkednum++;}
   }catch(Exception e){}
%> 
<script type="text/javascript" language="javascript"
  	  src="js/My97DatePicker/WdatePicker.js">
</script>
<script type="text/javascript" src="js/check.js" charset="utf-8"></script> 
<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
       <script type="text/javascript" src="js/highcharts.js"></script>
       <%
           int uncheckednum=total-checkednum;
           DecimalFormat df = new DecimalFormat("#.0000");
           try{
           String s=df.format((double)checkednum/(double)total);   
		   double checked=Double.parseDouble(s);
		   String s1=df.format((double)uncheckednum/(double)total);
		   double unchecked=Double.parseDouble(s1);
        %>
       <script type="text/javascript">
        $(function () {
        
    $('#container').highcharts({
        chart: {
            backgroundColor:null,
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: ''
        },
        colors:[
                        
                        '#40ffff',
                        '#FF8800 ',
                        'yellow',//第三个颜色
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
                size:'70%',
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.3f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '基站',
            data: [
                ['已检测',<%=checked%>],           
                ['未检测',<%=unchecked%>]
            ]
        }]
    });
});
       </script>
       <%}
		   catch(Exception e){} %>
      <style type="text/css">
      h2{
      text-align:center;
      }
      #chakan{
      position:relative;
      left:200px;
      top:110px;
      font-size:25px;
      padding:20px,0px,20px,0px;
      }
      #chakan td{
      padding:20px;
      }
      #caption{
      font-size:30px;
      }
      #tu{     
      position:absolute;
      top:170px;
      right:120px;
      }
      #tu td{
      text-align:right;
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
    <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">基站用电检测</font>
</div>

<DIV id=con style="position:absolute;top:50px;left:0px;">
  <UL id=tags>
    <LI class=selectTag><A onClick="selectTag('tagContent0',this)" 
      href="javascript:void(0)">基站用电检测</A> </LI>
    <LI><A onClick="selectTag('tagContent1',this)" 
      href="javascript:void(0)">电量检测数据</A> </LI>   
  </UL>
  <DIV id=tagContent>
    
    <!-- 第一个div开始 -->
    <DIV class="tagContent selectTag" id=tagContent0>    

    <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">  
    <tr align="center">
    <td id="caption" > 当月电量检测状态查看：</td>
    <td id="caption">  当月电量检测基站图形展示：</td>
    </tr>
    <tr height="450" align="center" style="position:relative">
    <td id="caption">      
        <table width="100%" border="1" cellpadding="0" cellspacing="0" align="center"> 
            <tr height="50">           
            <td class=gridViewHeader style="WIDTH: 30%" scope=col>已检测基站电表数量：</td>
            <td class=gridViewHeader style="WIDTH: 10%" scope=col><%=checkednum %></td>
            </tr>
            <tr height="50">
            <td class=gridViewHeader style="WIDTH: 30%" scope=col>未检测基站电表数量：</td>
            <td class=gridViewHeader style="WIDTH: 10%" scope=col><%=uncheckednum %></td>
            </tr>
            <tr height="50">
            <td class=gridViewHeader style="WIDTH: 30%" scope=col>电量检测基站总数量：</td>
            <td class=gridViewHeader style="WIDTH: 10%" scope=col><%=total %></td>
            </tr>
           </table>    
    </td>
    <td id="container"  >&quot;&quot;</td>
    </tr>
    </table>


       
    </DIV>
    <!--第一个div结束  -->
    <!-- 第二个div开始 -->
    <DIV class="tagContent" id=tagContent1>    
       <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="middle" background="../images/mail_leftbg.gif">&nbsp;<br><br></td>
    <td valign="top"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px;
PADDING-TOP: 10px; text-align:center;" >
		  <%
    		String message = "";
			if(session.getAttribute("message") == null);
    			//out.println("-----------------------");
    		else
    			message = (String)session.getAttribute("message");
    		session.setAttribute("message", "");
	    %>
	    <font style="text-align:center;font-weight:bolder;font-size:20px;font-family:'楷体';color:red">
	    	<%=message %>
		   <%
		    Sql="select * from dljc where  unix_timestamp(presentchecktime) between  unix_timestamp('"+ aFirstDay +"') and unix_timestamp('"+ aLastDay +"')";
		  	Connection conn=DBConn.getConnection();
			ResultSet rs=null;
			Statement stmt=null;
			int sumitems=0;
			try
			{
				stmt=conn.createStatement();
				rs=stmt.executeQuery(Sql);
		  		while(rs.next()){
            	if(sumitems%10==0){
            %>
             
            <TABLE class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
                <TR>
                  <td class=gridViewHeader style="WIDTH: 15%" scope=col>基站名称</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>基站等级</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>检测人员</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>电表上次检测日期</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>电表上次检测数据</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>电表本次检测日期</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>电表本次检测数据</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>检测间隔天数</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>该时间段用电量</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>平均日用电量</td>
    				<td class=gridViewHeader style="WIDTH: 9%" scope=col>查看照片</td>
                </TR>
                <%}
                	sumitems++;                                    
                 %>
                 
		        <TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
                 
                  <TD class=gridViewItem><%=rs.getString(2) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(3) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(4) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(5) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(6) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(7) %></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%=rs.getString(8) %></TD>
                  <%
                      try{
		                   BigDecimal b1=new BigDecimal(rs.getString(8));
                  		   BigDecimal b2=new BigDecimal(rs.getString(6));
                  		   double n1=b1.doubleValue();
                  		   double n2=b2.doubleValue();
                  		   double power=0;
                  		   int k=10;
                  		   if(n1<n2)
                  		   {
                  			   while(n2/10>=1){
                  				   n2=n2/10;
                  				   k=k*10;
                  			   }
                  			   
                  		       power=b1.doubleValue()+k-b2.doubleValue();
                  		   }
                  		   else
                  		      {power=b1.subtract(b2).doubleValue();}
		                   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		                   Date dt1=sdf.parse(rs.getString(7));
		                   Date dt2 = null;
		       		       long daysBetween = 0;
		       			   if(rs.getString(5)!=null&&rs.getString(5)!=""){
		       				   dt2 = sdf.parse(rs.getString(5));       				
		       				   daysBetween = (dt1.getTime() - dt2.getTime() + 1000000)/ (3600 * 24 * 1000);	
		       			   }		       			  
		       			   else{
		       			   	   daysBetween = (dt1.getTime() + 1000000)/ (3600 * 24 * 1000);
		       			   }
		                   String avgStr="0";
		                   if(daysBetween==0)
		       			   {
		       				 avgStr="0";
		       			   }
		       			   else
		       			   {
		       				  double avg=power/(double)daysBetween;
		       		          DecimalFormat df1 = new DecimalFormat("0.000");
		       		          avgStr=df1.format(avg);
		       			   }
                   %>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= daysBetween%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= power%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= avgStr%></TD>    
                  <%}
                   catch (Exception e)
                   {
                  %>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= ""%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= ""%></TD>
                  <TD class=gridViewItem id="title<%=sumitems %>"><%= ""%></TD> 
                  <% } String picname=rs.getString(9);
                       if(picname==null||picname.equals(""))
                       {
                  %>                             
                  <TD class=gridViewItem id="title<%=sumitems %>"><a href="/yunwei/system_pic/image/no_pic.png" style="text-decoration:underline;" target="_blank"><%=rs.getString(9) %></a></TD> 
                  <%}
                    else{ 
                   %>
                  <TD class=gridViewItem id="title<%=sumitems %>"><a href="<%=picPath %><%=picname %>" style="text-decoration:underline;" target="_blank"><%=rs.getString(9) %></a></TD>                  
                  <%} %>              
                </TR>               
                <%if(sumitems%10==0){ %>
            </TABLE> 
            <%} %>
            <%}
            if(sumitems%10!=0){%>
            </TABLE>
             <%} 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				finally{
					DBConn.closeResultSet(rs);
					DBConn.closeStatement(stmt);
				}%>
				
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
      				<%for(int j=2;j<=(sumitems+9)/10;j++){ %>
      				<td id="page<%=j %>"><a href="javascript:void(0);" onclick="change_page(<%=j %>)"><%=j %></a></td>
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
    <td >&nbsp;</td>
  </tr>
   

</body>
</html>
