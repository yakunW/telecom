package wyk.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.google.gson.Gson;

import dbc.DBConn;

public class UpdatePwdAction {
	String ysmm;
	String xmm;
	
	public void updatepwd(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpSession session=(HttpSession)req.getSession();
		HttpServletResponse res=(HttpServletResponse)ServletActionContext.getResponse();
		Gson gson =new Gson();
		ysmm=req.getParameter("ysmm");
		xmm=req.getParameter("xmm");
		LoginAction la=new LoginAction();
		Connection conn=DBConn.getConnection();
    	ResultSet rs=null;
    	PreparedStatement ps=null;
    	String sql=null;
		try{
			if(la.loginCheck(session.getAttribute("xjry").toString(), ysmm)){//旧密码通过
				sql="update staff set password=? where name=? ";
				ps=conn.prepareStatement(sql);
				ps.setString(1, xmm);
				ps.setString(2, session.getAttribute("xjry").toString());
				ps.executeUpdate();
				String loginResult = gson.toJson("success");
				res.setContentType("application/json; charset=utf-8");//返回一段文本
				PrintWriter out = res.getWriter();
			    out.print(loginResult);
				out.flush();
				out.close();
			}
			else{//旧密码输入错误
				String loginResult = gson.toJson("pwdError");
				res.setContentType("application/json; charset=utf-8");//返回一段文本
				PrintWriter out = res.getWriter();
			    out.print(loginResult);
				out.flush();
				out.close();
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
