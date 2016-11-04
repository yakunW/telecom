package wyk.action;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import wyk.bean.Xjb;
import zlq.bean.Judgett;

import com.google.gson.Gson;

import dbc.DBConn;

public class GetHistoryTableAction {//获取巡检表
	String baseId;
	String xjrq;
	String baseName;
	String level;
	String xjry;
	String tableName;

	public String getHistoryTable(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpSession session=req.getSession(); 
		req.setAttribute("baseId", baseId);
		req.setAttribute("baseName", baseName);
		req.setAttribute("level", level);
		req.setAttribute("xjry", xjry);
		req.setAttribute("xjrq", xjrq); 
		
		if(tableName.equals("flag"))
		{
            Judgett jtt=new Judgett();
            String date1=session.getAttribute("period1").toString();
            String date2=session.getAttribute("period2").toString();
           
            tableName=jtt.judgetype(date1, date2, baseId);
		}
		req.setAttribute("tableName", tableName);
		System.out.println("基站号"+baseId);
		System.out.println("等级"+level);
		System.out.println("名称"+baseName);
		System.out.println("人员"+xjry);
		System.out.println("巡检日期"+xjrq); 
//		System.out.println("表名"+tableName); 
		
		List<Xjb> xjbList=null;	
		xjbList=new ArrayList<Xjb>();
		xjbList=this.getXjb();
		req.setAttribute("xjbList", xjbList);
		
		return "xjb";
	}
	public List<Xjb> getXjb(){
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpSession session=req.getSession(); 
		String period1  = session.getAttribute("period1").toString();
		String period2  = session.getAttribute("period2").toString();
		//String xjrq=session.getAttribute("xjrq").toString();
		System.out.println(xjrq);
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;		
		List<Xjb> xjbList=new ArrayList<Xjb>();
		Xjb xjb=null;
		Circle circle=new Circle();
		String sql=null;
		
		if(tableName.equals("C网基站及配套设备作业计划记录表1")){
			
			if(level.equalsIgnoreCase("A")){
				sql="select * from(select * from table_c1 where baseId=? and xjrq='"+xjrq+"' order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and xjrq='"+xjrq+"' order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("B")){
				
				sql="select * from(select * from table_c1 where baseId=? and xjrq='"+xjrq+"' order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and xjrq='"+xjrq+"' order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("C")){
				sql="select * from(select * from table_c1 where baseId=? and xjrq='"+xjrq+"' order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and xjrq='"+xjrq+"' order by xjlx) as b";
			}
			else if(level.equalsIgnoreCase("D")){
				sql="select * from(select * from table_c1 where baseId=? and xjrq='"+xjrq+"' order by xjlx) as a"
						+" union all "+"select * from(select * from table_c2 where baseId="+baseId+" and xjlx like '蓄电池%' and xjrq='"+xjrq+"' order by xjlx) as b";
			}
		}
		else if(tableName.equals("C网基站及配套设备作业计划记录表2")){
			sql="select * from table_c2 where baseId=? and  xjlx not like '蓄电池%' and xjrq='"+xjrq+"' order by xjlx";
		}
		else if(tableName.equals("室内分布单点巡检测试表")){
			sql="select * from table_sn where baseId=? and xjrq='"+xjrq+"' order by xjlx";
		}
		else if(tableName.equalsIgnoreCase("室外直放站（拉远RRU）巡检表")){
			sql="select * from table_sw where baseId=? and xjrq='"+xjrq+"' order by xjlx";
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
	public String getXjrq() {
		return xjrq;
	}
	public void setXjrq(String xjrq) {
		this.xjrq = xjrq;
	}

	
}
