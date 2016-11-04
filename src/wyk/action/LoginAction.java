package wyk.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import wyk.bean.BaseInspectData;
import wyk.bean.BaseStation;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dbc.DBConn;

public class LoginAction {
	String name;
	String password;
	String longitude;
	String latitude;//纬度
	
	public void login(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpServletResponse res=(HttpServletResponse)ServletActionContext.getResponse();
		HttpSession session=(HttpSession)req.getSession();
		
		name=req.getParameter("name").toString();
		password=req.getParameter("password").toString();
		longitude=req.getParameter("longitude").toString();
		latitude=req.getParameter("latitude").toString();
		
		System.out.println("姓名"+name);
		System.out.println(password);
		System.out.println(longitude);
		System.out.println(latitude);

		Position position=new Position();
		BaseStation bs=new BaseStation(); 
		Gson gson =new Gson();
		List<BaseStation> list = new ArrayList<BaseStation>();
		if(loginCheck(name,password)){//登陆验证通过
			try{
				list=position.checkPosition(Double.parseDouble(longitude), Double.parseDouble(latitude));
//				for(int i = 0; i < list.size(); i++){
//					System.out.println(list.get(i).baseName);
//				}
			}
			catch(Exception e){
				System.out.println("longitude"+longitude+"latitude"+latitude);
				e.printStackTrace();
			}
			if(list.size() == 1){//经纬度验证通过，返回基站信息	
//				System.out.println("登陆"+bs.getBaseId());
				session.setAttribute("baseInfo", list.get(0));
				session.setAttribute("xjry", name);
				String loginResult = gson.toJson(list);
				list.clear();
				res.setContentType("application/json; charset=utf-8");
				try{
					PrintWriter out = res.getWriter();
				    out.print(loginResult);
					out.flush();
					out.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}

			}else if(list.size() > 1){
				String loginResult = gson.toJson(list);
				list.clear();
				res.setContentType("application/json; charset=utf-8");
				try{
					PrintWriter out = res.getWriter();
				    out.print(loginResult);
					out.flush();
					out.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
			else{//经纬度验证不通过
				System.out.println("地理位置验证失败");
				String loginResult = gson.toJson("positionError");
				res.setContentType("application/json; charset=utf-8");//返回一段文本
				try{
					PrintWriter out = res.getWriter();
				    out.print(loginResult);
					out.flush();
					out.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
		}
		else{//登陆验证不通过
			String loginResult = gson.toJson("loginError");
			res.setContentType("application/json; charset=utf-8");//返回一段文本
			try{
				PrintWriter out = res.getWriter();
			    out.print(loginResult);
				out.flush();
				out.close();
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
//	
	public void login2(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpServletResponse res=(HttpServletResponse)ServletActionContext.getResponse();
		Gson gson =new Gson();
		HttpSession session=(HttpSession)req.getSession();
		System.out.println("1111111111111111");
		try{
			BaseStation bs = gson.fromJson(req.getParameter("baseInfo").toString(), new TypeToken<BaseStation>(){}.getType());
			System.out.println("bs:"+bs.baseId);
			session.setAttribute("baseInfo", bs);
			session.setAttribute("xjry", req.getParameter("xjry"));
		}
		catch(Exception e){
			System.out.println("222222222222222222222");
			String loginResult = gson.toJson("loginError");
			res.setContentType("application/json; charset=utf-8");//返回一段文本
			PrintWriter out;
			try {
				out = res.getWriter();
				out.print(loginResult);
				out.flush();
				out.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	
	public boolean loginCheck(String name,String password ){//登陆验证函数
		    Connection conn=DBConn.getConnection();
	    	ResultSet rs=null;
	    	PreparedStatement ps=null;
	    	String sql="select * from staff where name=? and password=? and authority=?";
	    	try{
//	    		System.out.println("姓名"+name);
//	    		System.out.println(password);
	    		ps=conn.prepareStatement(sql);
	    		ps.setString(1, name);
	    		ps.setString(2, password);
	    		ps.setInt(3, 1);
	    		rs=ps.executeQuery();
	    		if(rs.next()){
	    			System.out.println("登陆成功");
	    			return true;
	    		}
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    return false;
	}
	
	
}
