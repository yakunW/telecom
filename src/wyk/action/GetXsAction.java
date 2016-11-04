package wyk.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import wyk.bean.Checked;
import wyk.bean.Uncheck;
import dbc.DBConn;

public class GetXsAction {//获取详细巡检状态
	int category;
	String level;
	Checked cd;
	Uncheck uc;
	List<Checked> checkedList;
	List<Uncheck> uncheckList;
	
	public String getUncheck(){//获得未巡检的详细信息
		List<Uncheck> uncheckList=this.unCheck();
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		req.setAttribute("uncheckList",uncheckList);
//		System.out.println("未巡检");
		return "uncheck";
	}
	public String getChecked(){//获得已巡检的详细信息
		List<Checked> checkedList=this.checked();
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
//		this.category=Integer.parseInt(req.getParameter("category").toString());
//		System.out.println(category);
		req.setAttribute("checkedList",checkedList);
		
		return "checked";
	}
	public List<Uncheck> unCheck(){
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;		
		uncheckList=new ArrayList<Uncheck>();
		String sql=null;
		try{
			if(level.equals(null)||level.equals("")){//level为空，是室外直放站或铁塔
				sql="select baseId,baseName from base where category=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, category);
			}
			else if(level.equals("CD")){//c/d类基站
				sql="select baseId,baseName from base where category=? and level=? or level=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, category);
				ps.setString(2, "C");
				ps.setString(3, "D");
			}
			else{//a,b类基站和室分
				sql="select baseId,baseName from base where category=? and level=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, category);
				ps.setString(2, level);
			}
			rs=ps.executeQuery();
			while(rs.next()){
				uc=new Uncheck();
				uc.setBaseId(rs.getString("baseId"));
				uc.setBaseName(rs.getString("baseName"));
				uncheckList.add(uc);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DBConn.closeConnection(conn);
			DBConn.closePreparedStatement(ps);
			DBConn.closeResultSet(rs);
		}

		checkedList=this.checked();
		for(int i=uncheckList.size()-1;i>=0;i--){
			for(int j=checkedList.size()-1;j>=0;j--){
				if(uncheckList.get(i).getBaseId().equals(checkedList.get(j).getBaseId())){//判断总表和已巡检项相同的
					uncheckList.remove(i);
					 checkedList.remove(j);
					break;
				}
			}
		}
		return uncheckList;
	}
	
	public List<Checked> checked(){
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;
		Circle circle=new Circle();		
		checkedList=new ArrayList<Checked>();
		String tableName=null;
		String sql=null;
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
//		System.out.println(category);
//		System.out.println(level);
			if(category==0){//基站或铁塔
				if(level.equals(null)||level.equals("")){//铁塔
//					System.out.println("铁塔");
					req.setAttribute("tableName", "C网基站及配套设备作业计划记录表2");
					sql="select * from zt_tt where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.ttFirstDay+"') and unix_timestamp('"+circle.ttLastDay+"')";						
				}
				else{//基站
//					System.out.println("基站");
					req.setAttribute("tableName", "C网基站及配套设备作业计划记录表1");
					tableName="zt_"+level;
					if(level.equals("A")){
						sql="select * from "+tableName+" where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.aFirstDay+"') and unix_timestamp('"+circle.aLastDay+"')";
					}
					else if(level.equals("B")){
						sql="select * from "+tableName+" where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.bFirstDay+"') and unix_timestamp('"+circle.bLastDay+"')";
					}
					else if(level.equals("CD")){
						sql="select * from "+tableName+" where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.cdFirstDay+"') and unix_timestamp('"+circle.cdLastDay+"')";
					}
				}
				
			}
			else if(category==1){//室内
//				System.out.println("室内");
				req.setAttribute("tableName", "室内分布单点巡检测试表");
				sql="select * from zt_SN where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.snFirstDay+"') and unix_timestamp('"+circle.snLastDay+"')";

			}
			else if(category==2){//室外
				req.setAttribute("tableName", "室外直放站（拉远RRU）巡检表");
				sql="select * from zt_SW where  unix_timestamp(xjrq) between  unix_timestamp('"+circle.swFirstDay+"') and unix_timestamp('"+circle.swLastDay+"')";
			}	
		try{
			ps=conn.prepareStatement(sql);			
			rs=ps.executeQuery();
			while(rs.next()){
				cd=new Checked();
				cd.setBaseId(rs.getString("baseId"));
				cd.setBaseName(rs.getString("baseName"));
				cd.setLevel(rs.getString("level"));
				cd.setXjry(rs.getString("xjry"));
				cd.setXjrq(rs.getDate("xjrq"));
				checkedList.add(cd);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DBConn.closeConnection(conn);
			DBConn.closePreparedStatement(ps);
			DBConn.closeResultSet(rs);
		}
		return checkedList;
	}
	
	public String convert(String str){
		if(str==null){
			return "";
		}
		else{
			return str;
		}
	}

	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}

}
