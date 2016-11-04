package cn.edu.bupt.anm.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.po.Base;
import cn.edu.bupt.anm.po.Staff;

public class BaseDaoImpl implements Dao<Base> {

	@Override
	public List<Base> list(String sql) {
		List<Base> bases = new ArrayList<Base>();
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
				Base base = new Base();
				base.setBaseId(rs.getString("baseId"));
				base.setCategory(rs.getInt("category"));
				base.setBaseName(rs.getString("baseName"));
				base.setLevel(rs.getString("level"));
				base.setLongitude(rs.getString("longitude"));
				base.setLatitude(rs.getString("latitude"));
				base.setAddress(rs.getString("address"));
				base.setStationName(rs.getString("stationName"));
				base.setArea(rs.getString("area"));
				base.setCell_id(rs.getString("cell_id"));
				bases.add(base);
			}
		} catch (Exception e) {
			System.out.println("base list error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return bases;
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
	public int add(Base base) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		String sql = null;
		int isSuccess = 0;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "INSERT INTO base(baseid,category,baseName,level,longitude,latitude,address,stationName,area,cell_id) "
					+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, base.getBaseId());
			pstmt.setInt(2, base.getCategory());
			pstmt.setString(3, base.getBaseName());
			pstmt.setString(4, base.getLevel());
			pstmt.setString(5, base.getLongitude());
			pstmt.setString(6, base.getLatitude());
			pstmt.setString(7, base.getAddress());
			pstmt.setString(8, base.getStationName());
			pstmt.setString(9, base.getArea());
			pstmt.setString(10, base.getCell_id());
			isSuccess = pstmt.executeUpdate();
//			System.out.println("staff add success");
		} catch (Exception e) {
			System.out.println("base add error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int modify(Base base) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		int isSuccess = 0;
		String sql = null;
		try{
			// 连接数据库
			dbc = new DataBaseConnection();
			sql = "UPDATE base SET category=?,level=?,longitude=?,latitude=?,address=?,stationName=?,area=?,cell_id=?,baseName=? "
					+ "WHERE baseId=?";
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(10, base.getBaseId());
			pstmt.setInt(1, base.getCategory());
			pstmt.setString(2, base.getLevel());
			pstmt.setString(3, base.getLongitude());
			pstmt.setString(4, base.getLatitude());
			pstmt.setString(5, base.getAddress());
			pstmt.setString(6, base.getStationName());
			pstmt.setString(7, base.getArea());
			pstmt.setString(8, base.getCell_id());
			pstmt.setString(9, base.getBaseName());
			isSuccess = pstmt.executeUpdate();
//			System.out.println("staff add success");
		} catch (Exception e) {
			System.out.println("base modify error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int resetPassword(int id) {
		// TODO Auto-generated method stub
		return 0;
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
			System.out.println("del base error:" + e.getMessage());
		} finally {
			dbc.close();
		}
		return isSuccess;
	}
}
