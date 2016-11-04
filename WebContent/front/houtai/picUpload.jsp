<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="dbc.DBConn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/front/";
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
	<link rel="stylesheet" type="text/css" href="../css/commonstyle.css">
	<link rel="stylesheet" type="text/css" href="../css/picupload.css">
	<script type="text/javascript" src="../js/check.js" charset="utf-8"></script>
	<link rel="stylesheet" href="../editor/themes/default/default.css" />
	
		<script src="editor/kindeditor-min.js"></script>
		<script>
			KindEditor.ready(function(K) {
				var uploadbutton = K.uploadbutton({
					button : K('#uploadButton')[0],
					fieldName : 'imgFile',
					url : 'editor/jsp/upload_json.jsp?dir=image',
					afterUpload : function(data) {
						if (data.error === 0) {
							var url = K.formatUrl(data.url, 'absolute');
							K('#url').val(url);
						} else {
							alert(data.message);
						}
					},
					afterError : function(str) {
						alert('自定义错误信息: ' + str);
					}
				});
				uploadbutton.fileBox.change(function(e) {
					uploadbutton.submit();
				});
			});
		</script>
		<script type="text/javascript">
		
		</script>
 </head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="17" valign="top" background="images/mail_leftbg.gif"><img src="images/left-top-right.gif" width="17" height="29" /></td>
    <td valign="top" background="images/content-bg.gif"><table width="100%" height="31" border="0" cellpadding="0" cellspacing="0" class="left_topbg" id="table2">
    </table></td>
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
		  <form action="houtai/AddPic" method="post">
    		<table align="center">
    			<tr>
    				<td colspan=2 align="center" id="title">首页图片</td>
    			</tr>
    			<tr>
    				<td colspan=2 align="left" width="660">
    					<table>
						<%  Connection conn=DBConn.getConnection();
							ResultSet rs=null;
							Statement stmt=null;
							int i=1;
							try {
								stmt=conn.createStatement();
								rs=stmt.executeQuery("select pic_id,pic_path from pics;");
								while(rs.next()){
									if(i%4==1){%><tr><%} %>
								<td onmouseover="document.getElementById('option_<%=i %>').style.display='block'" 
								onmouseout="document.getElementById('option_<%=i %>').style.display='none'">
								<div class="pics"><img src="<%=rs.getString(2)%>" width="150" height="90"/>
								<ul class="option" id="option_<%=i %>"><li>
								<font style="font-size:14px;margin-left: 10px;">第<%=i %>张</font>
								<img src="images/deletepic.gif" width="18" height="18" 
									style="cursor: pointer;margin-left: 70px;" 
									onclick="if(confirm('您确定要删除该图片吗？'))location.href='houtai/DelPic?id=<%=rs.getInt(1) %>'"/>
								</li></ul>
								</div></td>
									<%if(i%4==0){%></tr><%} i++;%>
								<%}
								if(i==1){%><tr><td style="padding-left:260px;">您还没有上传图片！</td></tr><%}
								else if((i-1)%4!=0){%></tr><%}
								conn.close();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							finally{
								DBConn.closeResultSet(rs);
								DBConn.closeStatement(stmt);
							}
						  	 %>
						</table>
					</td>
    			</tr>
    			<tr>
    				<td width="25%" align="right">图片路径：</td>
    				<td align="left"><div class="upload">
			<input class="ke-input-text" type="text" id="url" name="url" value="" readonly="readonly" /> 
			<input type="button" id="uploadButton" value="Upload" />
			<font style="color: red;">*</font><font style="font-size:14px">图片大小不能超过1000KB。</font>
		</div></td>
    			</tr>
    			<tr>
    				<td colspan=2 align="center">
    					<input type="submit" value="上传" onclick="return checkpic()"/>&nbsp;&nbsp;&nbsp;
    					<input type="button" value="取消" onclick="history.back(-1)"/>
    				</td>
    			</tr>
    		</table>
    	</form>
		  
        </td>
      </tr>
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
