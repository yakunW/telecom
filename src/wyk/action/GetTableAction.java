package wyk.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import wyk.bean.Xjb;

import com.google.gson.Gson;

import dbc.DBConn;

public class GetTableAction {//获取巡检表
	String baseId;
	Date xjrq;
	String baseName;
	String level;
	String xjry;
	String tableName;

	public String getTable(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		req.setAttribute("baseId", baseId);
		req.setAttribute("baseName", baseName);
		req.setAttribute("level", level);
		req.setAttribute("xjry", xjry);
		req.setAttribute("xjrq", xjrq); 
		req.setAttribute("tableName", tableName);
//		System.out.println("基站号"+baseId);
//		System.out.println("等级"+level);
//		System.out.println("名称"+baseName);
//		System.out.println("人员"+xjry);
//		System.out.println("巡检日期"+xjrq); 
		
		List<Xjb> xjbList=null;	
		xjbList=new ArrayList<Xjb>();
		xjbList=this.getXjb();
		req.setAttribute("xjbList", xjbList);
		
		return "xjb";
	}
	public List<Xjb> getXjb(){
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;		
		List<Xjb> xjbList=new ArrayList<Xjb>();
		Xjb xjb=null;
		Circle circle=new Circle();
		String sql=null;

		if(tableName.equalsIgnoreCase("C网基站及配套设备作业计划记录表1")){
			if(level.equalsIgnoreCase("A")){
				sql="select * from(select * from table_c1 where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.cdFirstDay+"') and unix_timestamp('"+circle.cdLastDay+"') order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and unix_timestamp(xjrq) between  unix_timestamp('"+circle.aFirstDay+"') and unix_timestamp('"+circle.aLastDay+"') order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("B")){
				sql="select * from(select * from table_c1 where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.cdFirstDay+"') and unix_timestamp('"+circle.cdLastDay+"') order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and unix_timestamp(xjrq) between  unix_timestamp('"+circle.aFirstDay+"') and unix_timestamp('"+circle.aLastDay+"') order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("C")){
				sql="select * from(select * from table_c1 where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.cdFirstDay+"') and unix_timestamp('"+circle.cdLastDay+"') order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and unix_timestamp(xjrq) between  unix_timestamp('"+circle.aFirstDay+"') and unix_timestamp('"+circle.aLastDay+"') order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("D")){
				sql="select * from(select * from table_c1 where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.cdFirstDay+"') and unix_timestamp('"+circle.cdLastDay+"') order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and unix_timestamp(xjrq) between  unix_timestamp('"+circle.aFirstDay+"') and unix_timestamp('"+circle.aLastDay+"') order by xjlx) as b";
			}
		}
		else if(tableName.equalsIgnoreCase("C网基站及配套设备作业计划记录表2")){
			sql="select * from table_c2 where baseId=? and  xjlx not like '蓄电池%' and unix_timestamp(xjrq) between  unix_timestamp('"+circle.ttFirstDay+"') and unix_timestamp('"+circle.ttLastDay+"') order by xjlx";
		}
		else if(tableName.equalsIgnoreCase("室内分布单点巡检测试表")){
			sql="select * from table_sn where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.snFirstDay+"') and unix_timestamp('"+circle.snLastDay+"') order by xjlx";
		}
		else if(tableName.equalsIgnoreCase("室外直放站（拉远RRU）巡检表")){
			sql="select * from table_sw where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+circle.swFirstDay+"') and unix_timestamp('"+circle.swLastDay+"') order by xjlx";
		}
		
		
		try{
			ps=conn.prepareStatement(sql);
			ps.setString(1, baseId);
			System.out.println(sql);
			rs=ps.executeQuery();
			while(rs.next()){
//				System.out.println("取表数据成功");
				xjb=new Xjb();
				xjb.setBaseId(rs.getString("baseId"));
				xjb.setBaseName(rs.getString("baseName"));
				xjb.setXjlx(rs.getString("xjlx"));
				xjb.setXjnr(rs.getString("xjnr"));
				xjb.setXjsj(rs.getString("xjsj"));
				xjbList.add(xjb);
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
		return xjbList;
	}

	

	public String getBaseId() {
		return baseId;
	}

	public void setBaseId(String baseId) {
		this.baseId = baseId;
	}

	public String getBaseName() {
		return baseName;
	}

	public void setBaseName(String baseName) {
		try{
			this.baseName=new String(baseName.getBytes("ISO8859-1"),"utf-8");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getXjry() {
		return xjry;
	}

	public void setXjry(String xjry) {
		try{
			this.xjry=new String(xjry.getBytes("ISO8859-1"),"utf-8");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		try{
			this.tableName=new String(tableName.getBytes("ISO8859-1"),"utf-8");
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public Date getXjrq() {
		return xjrq;
	}
	public void setXjrq(Date xjrq) {
		this.xjrq = xjrq;
	}

	
}
