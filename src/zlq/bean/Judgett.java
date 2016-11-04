package zlq.bean;

import java.sql.*;

import cn.edu.bupt.anm.conn.DataBaseConnection;

public class Judgett {
	public boolean judgett(String date1,String baseId){
		boolean flag=false;
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from zt_tt where baseId=? and xjrq=' "+date1+"'";
		try {
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, baseId);
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
			}		
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally{
			dbc.close();			
		}
		return flag;
	}
	public boolean judgejz(String date1,String date2,String baseid){
		boolean flag=false;
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from zt_a where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+date1+"') and unix_timestamp('"+date2+"') "
				+" union all "+"select * from zt_b where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+date1+"') and unix_timestamp('"+date2+"') "
				+" union all "+"select * from zt_cd where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+date1+"') and unix_timestamp('"+date2+"') ";
		try {
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, baseid);
			pstmt.setString(2, baseid);
			pstmt.setString(3, baseid);
			rs=pstmt.executeQuery();
			if(rs.next()){
				flag=true;
			}		
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally{
			dbc.close();			
		}
		return flag;
	}
	public String judgetype(String date1,String date2,String baseid){
		String tablename=null;
		int category=0;
		DataBaseConnection dbc=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql1="select category from base where baseId='"+baseid+"'";
		try {
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql1);
			rs=pstmt.executeQuery();
			if(rs.next()){
				category=rs.getInt(1);
			}
			if(category==0){
				if(judgett(date1, baseid)&&!judgejz(date1, date2, baseid)){
					tablename="C网基站及配套设备作业计划记录表2";
				}
				else if(!judgett(date1,baseid)&&judgejz(date1, date2, baseid)){
					tablename="C网基站及配套设备作业计划记录表1";
				}
				else if(judgett(date1, baseid)&&judgejz(date1, date2, baseid)){
					tablename="double";
				}
						
			}
			else if(category==1){
				tablename="室内分布单点巡检测试表";
			}
			else if(category==2){
				tablename="室外直放站（拉远RRU）巡检表";
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally{
			dbc.close();			
		}
		return tablename;
	}

}
