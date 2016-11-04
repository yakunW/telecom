<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="zlq.bean.Xunjian"%>
<%@page import="zlq.bean.Judgett" %>
<%@page import="javax.servlet.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";

List<Xunjian>  xjList=(List<Xunjian>)request.getAttribute("xjList");
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
	<link href="images/skin.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" type="text/css" href="css/commonstyle.css">
	<script type="text/javascript" src="js/changepage.js"></script>
	<script type="text/javascript" src="js/toExcel.js" charset="utf-8"></script>
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
<script language="javascript">
	function exportExcel(){
		window.location.href="toExcelxjMX";
	}
</script>
 </head>
<body>
<div style="position:absolute;left:0px;"> 
   <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style="color:#419224;font-weight:bolder;font-size:30px;">巡检综合统计查询结果</font>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">  <tr>
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;" class="include">
		 
    	  <table border="0" cellspacing="0" align="center">
    	  
    	  <tr>
    	    <td width="70%"></td>
    	    <td><a href="xjback" style="text-decoration:underline;">返回</a></td>   
    	    <td><a href="javascript:;" onclick="exportExcel()">导出至excel</a></td> 	  	
    	  	
    	  </tr>
    	  </table>
    	  <div id="r">
    	  <% int sumitems=0;
    	     
    	     for(int j=0;j<xjList.size();j++)
    	     {
    		  if(sumitems%10==0){
    		%>
    	<table class=gridView id="table_<%=(sumitems/10)+1 %>" 
	      style="WIDTH: 100%;BORDER-COLLAPSE: collapse;<%if(sumitems/10==0){%>display:block;<%}else{%>display:none;<%} %>" 
	      cellSpacing=0 rules=all border=1>
    		
    		<tr style="font-weight: bolder">
    			  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>基站编号</TD>
                  <TD class=gridViewHeader style="WIDTH: 40%" scope=col>基站名称</TD>
                  <TD class=gridViewHeader style="WIDTH: 5%" scope=col>基站等级</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检人员</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检日期</TD>
                  <TD class=gridViewHeader style="WIDTH: 10%" scope=col>巡检表</TD>
    		</tr>
                 <%}
                	sumitems++;
                 %>
    		<TR onmouseover="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#e2f9ff';" 
                	onmouseout="if(choose!=<%=sumitems %>)this.style.backgroundColor = '#ffffff';" 
                	onclick="choose_notice(this,<%=sumitems %>)" 
                	id="news<%=sumitems %>">
    			<td class=gridViewItem><%=xjList.get(j).getBaseId() %>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=xjList.get(j).getBaseName()%>&nbsp;</td>
    			<%
    			   if(xjList.get(j).getBaserank()!=null&&xjList.get(j).getBaserank()!=""){
    			%>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=xjList.get(j).getBaserank()%>&nbsp;</td>
    			<%}
    			   else{
    			%>
    			<td class=gridViewItem id="title<%=sumitems %>">&nbsp;</td>
    			<%} %>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=xjList.get(j).getXjName()%>&nbsp;</td>
    			<td class=gridViewItem id="title<%=sumitems %>"><%=xjList.get(j).getXjDate() %>&nbsp;</td>
                <td class=gridViewItem id="title<%=sumitems %>">
                    <%
                       Judgett jtt=new Judgett();
                       String level=session.getAttribute("level").toString();
                       String date1=session.getAttribute("period1").toString();
                       String date2=session.getAttribute("period2").toString();
                       if(jtt.judgett(xjList.get(j).getXjDate().toString(), xjList.get(j).getBaseId())&&jtt.judgejz(date1, date2, xjList.get(j).getBaseId()))
                       {
                    %>
                    <input type="button" value="查看基站巡检信息" 
                    onclick="window.open('gethistorytable.action?tableName=<%="C网基站及配套设备作业计划记录表1" %>&baseId=<%=xjList.get(j).getBaseId()%>&xjrq=<%=xjList.get(j).getXjDate()%>&baseName=<%=xjList.get(j).getBaseName()%>&level=<%=xjList.get(j).getBaserank()%>&xjry=<%=xjList.get(j).getXjName()%>','<%=xjList.get(j).getBaseId()%>','newwindow','width=600')"/>
                    <input type="button" value="查看铁塔巡检信息" 
                    onclick="window.open('gethistorytable.action?tableName=<%="C网基站及配套设备作业计划记录表2" %>&baseId=<%=xjList.get(j).getBaseId()%>&xjrq=<%=xjList.get(j).getXjDate()%>&baseName=<%=xjList.get(j).getBaseName()%>&level=<%=xjList.get(j).getBaserank()%>&xjry=<%=xjList.get(j).getXjName()%>','<%=xjList.get(j).getBaseId()%>','newwindow','width=600')"/>
                    <%}else { %>
                    <input type="image" src="images/btn_see.png" 
                    onclick="window.open('gethistorytable.action?tableName=<%="flag" %>&baseId=<%=xjList.get(j).getBaseId()%>&xjrq=<%=xjList.get(j).getXjDate()%>&baseName=<%=xjList.get(j).getBaseName()%>&level=<%=xjList.get(j).getBaserank()%>&xjry=<%=xjList.get(j).getXjName()%>','<%=xjList.get(j).getBaseId()%>','newwindow','width=600')"/>
                    <%} %>
                </td>
    		</tr>
    		<%if(sumitems%10==0){ %>
    	</table>
    	<%} %>
    	<%} %>
    	<%if(sumitems%10!=0){%>
            </TABLE>
            <%}%>
				
            <input type="hidden" id="notice" name="notice" value=""/>
</div>
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
      
    </table></td>
    <td background="images/mail_rightbg.gif">&nbsp;</td>
  </tr>
  <tr>
    <td valign="bottom" background="images/mail_leftbg.gif"><img src="images/buttom_left2.gif" width="17" height="17" /></td>
    <td background="images/buttom_bgs.gif"><img src="images/buttom_bgs.gif" width="17" height="17"></td>
    <td valign="bottom" background="images/mail_rightbg.gif"><img src="images/buttom_right2.gif" width="16" height="17" /></td>
  </tr>
</table>
</body>
</html>
