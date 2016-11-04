package cn.edu.bupt.anm.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.po.Base;
import cn.edu.bupt.anm.po.Task;

public class TaskDaoImpl implements Dao<Task>{

	@Override
	public List<Task> list(String sql) {
		List<Task> tasks = new ArrayList<Task>();
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs = null;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
//			System.out.println("sql:"+sql);
			pstmt = dbc.getConnection().prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				Task task = new Task();
				task.setStationId(rs.getInt("stationId"));
				task.setStationName(rs.getString("stationName"));
				task.setNames(rs.getString("names"));
				task.setLeader(rs.getString("leader"));
				task.setAreas(rs.getString("areas"));
				tasks.add(task);
			}
		} catch (Exception e) {
			System.out.println("task list error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return tasks;
	}

	@Override
	public int recordCount(String sql) {
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
	public int add(Task task) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		String sql = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "INSERT INTO task(stationName,names,leader,areas) "
					+ "VALUES(?,?,?,?)";
			System.out.println(sql);
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, task.getStationName());
			pstmt.setString(2, task.getNames());
			pstmt.setString(3, task.getLeader());
			pstmt.setString(4, task.getAreas());
			isSuccess = pstmt.executeUpdate();
//			System.out.println);
		} catch (Exception e) {
			System.out.println("task add error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int modify(Task task) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		String sql = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "UPDATE task SET names=?,leader=?,areas=? WHERE stationName=?";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, task.getNames());
			pstmt.setString(2, task.getLeader());
			pstmt.setString(3, task.getAreas());
			pstmt.setString(4, task.getStationName());
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("task update error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int resetPassword(int id) {
		return id;
		// TODO Auto-generated method stub
		
	}

	@Override
	public int del(String sql,int id) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("del task error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

}
