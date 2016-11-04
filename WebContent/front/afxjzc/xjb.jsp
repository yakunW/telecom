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
  <!-- <td height="100" background="images/right_title_bg.jpg" style="text-align: center;"></td> -->
 
    <base href="<%=basePath%>">
    
    <title><%=java.net.URLEncoder.encode(request.getAttribute("tableName").toString(),"utf8")%></title>
    
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
 <style type="text/css"> 
 .gridView{

 text-align:center;
  margin-top:10px;
  margin-bottom:20px;
 }
 .gridView td{
 padding:5px;
 } 
 </style>
<script >
    var tab=document.getElementById("table");
    var name="";
    for(var i=0,j=0;i <tab.rows.length;i++,j++) {
        if(name==tab.rows[i].cells[0].innerHTML) {
             tab.rows[i].deleteCell(0)
        } else  {
            name=tab.rows[i].cells[0].innerHTML;
            if(i>0)tab.rows[i-j].cells[0].rowSpan=j;
            j=0;
        }
    }
    var name2="";
    for(var i=0,j=0;i <tab.rows.length;i++,j++) {
        if(name2==tab.rows[i].cells[1].innerHTML) {
             tab.rows[i].deleteCell(1)
        } else  {
            name2=tab.rows[i].cells[1].innerHTML;
            if(i>0)tab.rows[i-j].cells[1].rowSpan=j;
            j=0;
        }
    }
</script > 


 </head>
<body onload="document.getElementById('password').focus();">

<table width="100%">
<tr>
<td style="width:20%">
    <font style="color:#bb000b; font-weight:bolder;font-size:20px;font-family:'楷体';">陕西省铜川市</font>
    </td>
<td style="width:60%;text-align:center">
<font style="text-align:center;color:#419224;font-weight:bolder;font-size:30px;"><%=request.getAttribute("tableName") %></font>
</td>
<td style="width:20%"></td>
</tr>
</table>

<%		    List<Xjb> xjbList=(List<Xjb>)request.getAttribute("xjbList");
            
 %>
 
<table width="100%" border="0" cellpadding="0" cellspacing="0" style="position:absolute;top:50px;left:0px;">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
     
    </table></td>
    <td width="16" valign="top" background="images/mail_rightbg.gif"><img src="images/nav-right-bg.gif" width="16" height="29" /></td>
  </tr>
  <tr>
    <td valign="middle" background="images/mail_leftbg.gif">&nbsp;</td>
    <td valign="top" bgcolor="#F7F8F9">
     <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td colspan="2" valign="top">&nbsp;</td>
        <td>&nbsp;</td>
        <td valign="top">&nbsp;</td>
      </tr>
      <tr>
      	<td width="100%" colspan="4" style="PADDING-RIGHT: 10px; PADDING-LEFT: 10px; PADDING-BOTTOM: 10px; COLOR: #566984; 
PADDING-TOP: 10px; text-align:center;">
	<TABLE class=gridView align="center" style="padding:10px,10px,10px,10px;BORDER-COLLAPSE: collapse;text-align:center;" cellSpacing=0 rules=all border=1>
<tr>
<td>基站编号</td>
<td>基站名称</td>
<td>基站等级</td>
<td>巡检人员</td>
<td>巡检日期</td>
</tr>
<tr>
<td><%=request.getAttribute("baseId") %></td>
<td><%=request.getAttribute("baseName") %></td>
<td><%=request.getAttribute("level") %></td>
<td><%=request.getAttribute("xjry") %></td>
<td><%=request.getAttribute("xjrq") %></td>
</tr>
</table>

<!-- c1表开始 -->
<TABLE class=gridView id="table" align="center" style="BORDER-COLLAPSE: collapse; "  cellSpacing=0 rules=all border=1,solid,#eee >      
<%for(int i=0;i<xjbList.size();i++){
 %>
  <tr>
  <td style="empty-cells:show;"><%=xjbList.get(i).getXjlx() %></td>
  <td style="empty-cells:show;text-align:left"><%=xjbList.get(i).getXjnr() %></td>
  <%
      if(xjbList.get(i).getXjsj()!=null&&xjbList.get(i).getXjsj()!=""){

  %>
  <td style="empty-cells:show;text-align:left"><%=xjbList.get(i).getXjsj() %></td><%}else{ %>
  <td style="empty-cells:show;text-align:left">&nbsp</td><%} %>
  </tr>
 <%} %> 
          </TABLE>     
      <script type="text/javascript">
window.onload = function(){
	var tab = document.getElementById("table");
	var maxCol = 1, val, count, start;
	
	for(var col = maxCol-1; col >= 0 ; col--){
		count = 1;
		val = "";
		for(var i=0; i<tab.rows.length; i++){
			if(val == tab.rows[i].cells[col].innerHTML){
				count++;
			}else{
				if(count > 1){ //合并
					start = i - count;
					tab.rows[start].cells[col].rowSpan = count;
					for(var j=start+1; j<i; j++){
						tab.rows[j].cells[col].style.display = "none";
					}
					count = 1;
				}
				val = tab.rows[i].cells[col].innerHTML;
			}
		}
		if(count > 1 ){ //合并，最后几行相同的情况下
			start = i - count;
			tab.rows[start].cells[col].rowSpan = count;
			for(var j=start+1; j<i; j++){
				tab.rows[j].cells[col].style.display = "none";
			}
		}
	}
};

</script>
     </TABLE>  
        </td>
      </tr>  
    </table>


</body>
</html>
