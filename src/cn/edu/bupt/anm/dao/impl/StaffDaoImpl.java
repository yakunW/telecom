package cn.edu.bupt.anm.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.po.Staff;

public class StaffDaoImpl implements Dao<Staff> {
	/*
	 * 查询全部
	 */
	public List<Staff> list(String sql) {
		List<Staff> staffs = new ArrayList<Staff>();
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
				Staff staff = new Staff();
				staff.setId(rs.getInt("id"));
				staff.setName(rs.getString("name"));
				staff.setSex(rs.getString("sex"));
				staff.setPassword(rs.getString("password"));
				staff.setTelephone(rs.getString("telephone"));
				staff.setAuthority(2);
				staffs.add(staff);
			}
//			System.out.println(staffs.size());
		} catch (Exception e) {
			System.out.println("staff list error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return staffs;
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
	/*
	 * 
	 */
	public int add(Staff staff) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
//		ResultSet rs = null;
		String sql = null;
		int isSuccess = 0;
		String message = "";
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "INSERT INTO staff(name,sex,password,telephone,authority) VALUES(?,?,?,?,?)";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, staff.getName());
			pstmt.setString(2, staff.getSex());
			pstmt.setString(3,staff.getPassword());
			pstmt.setString(4, staff.getTelephone());
			pstmt.setInt(5, staff.getAuthority());
			isSuccess = pstmt.executeUpdate();
			message = "添加" + staff.getName() + ",权限为" + staff.getAuthority();
		} catch (Exception e) {
			System.out.println("staff add error:" + e.getMessage());
		} finally {
			sql = "INSERT INTO log(date,message) VALUES(?,?)";
			try {
				pstmt = dbc.getConnection().prepareStatement(sql);
				Date now = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				pstmt.setString(1, dateFormat.format(now));
				//System.out.println(dateFormat.format(now));
				if(isSuccess == 1) pstmt.setString(2,message+",成功！");
				else pstmt.setString(2,message+",失败！");
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			dbc.close();
		}
		return isSuccess;
	}
	/*
	 * 
	 */
	public int modify(Staff staff) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		String sql = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "UPDATE staff SET name=?,sex=?,telephone=? WHERE id=?";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, staff.getName());
			pstmt.setString(2, staff.getSex());
			pstmt.setString(3, staff.getTelephone());
			pstmt.setInt(4, staff.getId());
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("staff update error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int resetPassword(int id) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		String sql = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "UPDATE staff SET password=111111 WHERE id=?";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, id);
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("resetPassword error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int del(String sql,int id) {
		PreparedStatement pstmt = null;
		Connection conn = null;
		DataBaseConnection dbc = null;
		ResultSet rs = null;
		int isSuccess = 0;
		String message = "",sql0 = "";
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			conn = dbc.getConnection();
//			为添加日志准备，获得删除的人名和权限
			sql0 = "select name,authority from staff where id=?";
			pstmt = conn.prepareStatement(sql0);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			pstmt =conn.prepareStatement(sql);
//			pstmt.setInt(1, id);
			isSuccess = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("del staff error1:" + e.getMessage());
		} finally {
			if(isSuccess == 1){
				try{
					if(rs.next()){
						sql0 = "INSERT INTO log(date,message) VALUES(?,?)";
						pstmt = conn.prepareStatement(sql0);
						Date now = new Date(); 
						SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						pstmt.setString(1, dateFormat.format(now));
						message = "删除" + rs.getString("name")+",权限为"+rs.getInt("authority");
						pstmt.setString(2,message+",成功！");
						pstmt.executeUpdate();
//						System.out.println(message);
					}
				}catch (Exception e) {
					System.out.println("del staff error2:" + e.getMessage());
				} 
		}
			dbc.close();
		}
		return isSuccess;
	}

}
