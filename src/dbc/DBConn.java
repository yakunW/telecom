package dbc;
import java.io.*;
import java.util.*;
import java.sql.*;

import javax.sql.*;
import javax.naming.*;

public class DBConn {
	private static DataSource ds=null;
	
	public DBConn(){
		
	}
	
	
	
	public static void closeConnection(Connection conn){
		if(conn!=null){
			try{
				conn.close();
				conn=null;
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
	}
	
	public static void closeStatement(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
				stmt = null;
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
	}

	public static void closePreparedStatement(PreparedStatement pstmt) {
		if (pstmt != null) {
			try {
				pstmt.close();
				pstmt = null;
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
	}

	public static void closeResultSet(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
				rs = null;
			} catch (SQLException exp) {
				exp.printStackTrace();
			}
		}
	}
	/* 获取数据库连接的函数*/  
    public static Connection getConnection() {  
            Connection con = null;  //创建用于连接数据库的Connection对象  
        try {  
            Class.forName("com.mysql.jdbc.Driver");// 加载Mysql数据驱动  
              
            con = DriverManager.getConnection(  
                    "jdbc:mysql://localhost:3306/jizhan?useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull", "root", "123");// 创建数据连接 
            
              
        } catch (Exception e) {  
            System.out.println("数据库连接失败" + e.getMessage());  
        }  
        return con; //返回所建立的数据库连接  
    }  
}
