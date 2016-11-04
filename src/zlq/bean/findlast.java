package zlq.bean;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Calendar;
import java.sql.*;
import java.text.*;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import zlq.bean.Elec;

public class findlast {
	public String searchlasttime(String basename){
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
		String lasttime="";
		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			Calendar ca=Calendar.getInstance();
//			int month=ca.get(Calendar.MONTH);
//			month=month-1;
//			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
//			ca.add(Calendar.MONTH, -1);
//			ca.set(Calendar.DAY_OF_MONTH,1);
//			String aFirstDay=sdf.format(ca.getTime());
//			ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//			String aLastDay=sdf.format(ca.getTime());
			String sql="select presentchecktime from dljc where basename = '"+ basename+"' ORDER BY presentchecktime  desc" ;
			dbc=new DataBaseConnection();
		    pstmt=dbc.getConnection().prepareStatement(sql);
		    ResultSet rs=pstmt.executeQuery();
		    while(rs.next()){
		    	lasttime=rs.getString("presentchecktime");
		    	break;
		    	
		    }
		    rs.close();
			pstmt.close();
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			dbc.close();
		}
		return lasttime;
	}
	
	public double searchlastnum(String basename){
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
		double lastnum=0;
		try {
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//			Calendar ca=Calendar.getInstance();
//			int month=ca.get(Calendar.MONTH);
//			month=month-1;
//			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
//			ca.add(Calendar.MONTH, -1);
//			ca.set(Calendar.DAY_OF_MONTH,1);
//			String aFirstDay=sdf.format(ca.getTime());
//			ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
//			String aLastDay=sdf.format(ca.getTime());
			String sql="select presentchecknum from dljc where basename = '"+ basename +"' ORDER BY presentchecktime  desc";
			dbc=new DataBaseConnection();
		    pstmt=dbc.getConnection().prepareStatement(sql);
		    ResultSet rs=pstmt.executeQuery();
		    while(rs.next()){
		    	lastnum=rs.getDouble("presentchecknum");
		    	break;
		    }
		    rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			dbc.close();
		}
		return lastnum;
	}

}
