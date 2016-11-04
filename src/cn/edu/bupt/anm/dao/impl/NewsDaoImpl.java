package cn.edu.bupt.anm.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.po.News;

public class NewsDaoImpl implements Dao<News>{

	@Override
	public List<News> list(String sql) {
		List<News> allnews = new ArrayList<News>();
//		String sql = "SELECT * FROM news ORDER BY date desc";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		try{
			//连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			//进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				News news = new News();
				news.setId(rs.getInt(1));
				news.setTitle(rs.getString(2));
				news.setContext(rs.getString(3));
				news.setDate(rs.getDate(4).toString());
				allnews.add(news);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return allnews;
	}

	@Override
	public int recordCount(String sql) {
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs = null;
//		System.out.println(sql);
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
	public int add(News news) {
		String sql = "INSERT INTO news(title,context,date) VALUES(?,?,curdate())";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		int isSuccess = 0;
		try{
			//连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getContext());
			//进行数据库更新操作
			isSuccess = pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			System.out.println("news add error:" + e.getMessage());
		}finally{
			dbc.close();
		}
		return isSuccess;
	}

	@Override
	public int modify(News news) {
		String sql = "UPDATE news SET title=?,context=?,date=curdate() WHERE Id=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		int isSuccess = 0;
		try{
			//连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, news.getTitle());
			pstmt.setString(2, news.getContext());
			pstmt.setInt(3, news.getId());
			//进行数据库更新操作
			isSuccess = pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			System.out.println("news modify error:" + e.getMessage());
		}finally{
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
//		String sql = "DELETE FROM news WHERE Id=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		int isSuccess = 0;
		try{
			//连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
//			pstmt.setInt(1,id);
			//进行数据库更新操作
			isSuccess = pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e){
			System.out.println("news del error:" + e.getMessage());
		}finally{
			dbc.close();
		}
		return isSuccess;
	}

}
