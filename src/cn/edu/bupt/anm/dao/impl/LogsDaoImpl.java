package cn.edu.bupt.anm.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.po.Log;

public class LogsDaoImpl implements Dao<Log> {
	/*
	 * 查询全部
	 */
	public List<Log> list(String sql) {
		List<Log> Logs = new ArrayList<Log>();
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs = null;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
//			System.out.println("sql:"+sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Log Log = new Log();
				Log.setDate(rs.getTimestamp(1));
				Log.setMessage(rs.getString(2));
				Logs.add(Log);
			}
//			System.out.println(Logs.size());
		} catch (Exception e) {
			System.out.println("Log list error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return Logs;
	}

/*
 * 获取记录总数
 */
	public int recordCount(String sql){
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs = null;
		try{
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
				return rs.getInt(1);
		}catch(SQLException e){
			System.out.println("get recordCount error:"+e.getMessage());
		}finally{
			try{
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(dbc != null)
					dbc.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

@Override
public int add(Log object) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int modify(Log object) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int resetPassword(int id) {
	// TODO Auto-generated method stub
	return 0;
}

@Override
public int del(String sql, int id) {
	// TODO Auto-generated method stub
	return 0;
}
	
}
