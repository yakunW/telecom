package wyk.action;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import wyk.bean.BaseStation;
import dbc.DBConn;
public class Position {
	
	
	public List<BaseStation> checkPosition(double lon, double lat){
//		BaseStation bs = null;
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		Statement stmt=null;
		System.out.println("long"+lon+"    la	"+lat);
		List<BaseStation> list = new ArrayList<BaseStation>();
		List<String> ids = new ArrayList<String>();
		try
		{
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select baseId,category,baseName,level,longitude,latitude from base;");
			
//			if(rs.next()){
//				baseId=rs.getString("baseId");
//			}
			double distance=0;
//			double limit=1000000;
			rs.next();
			do{
				distance=calPosition(lon,lat,Double.parseDouble(rs.getString("longitude")),Double.parseDouble(rs.getString("latitude")));//计算距离
//	  			System.out.println("测试距离是"+distance);
				if(distance<0.300){//单位是千米
//	  				limit=distance;
	  				ids.add(rs.getString("baseId"));
	  			}
			}
			while(rs.next());
//	  		System.out.println("最终距离是"+limit);
//	  		System.out.println("hello");
	  		System.out.println("size:"+ids.size());
			for(int i = 0; i < ids.size(); i++){
				String sql = "select baseId,category,baseName,level,longitude,latitude from base where baseId="+"'"+ids.get(i)+"'";
//				System.out.println(sql);
				rs=stmt.executeQuery(sql);
				while(rs.next()){
					BaseStation bs = new BaseStation();
					bs.setBaseId(ids.get(i));
			  		bs.setNear(true);
	//		  		bs.setBaseId(rs.getString(1));
			  		bs.setCategory(Integer.parseInt(rs.getString(2)));
			  		bs.setBaseName(rs.getString(3));
			  		bs.setLevel(rs.getString(4));
			  		bs.setLongitude(rs.getString(5));
			  		bs.setLatitude(rs.getString(6));
			  		list.add(bs);
				}
			}
	  		conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (NumberFormatException e){
			System.out.println("1");
			e.printStackTrace();
		}
		finally{
			DBConn.closeResultSet(rs);
			DBConn.closeStatement(stmt);
			return list;
		}
//		if(bs != null){
//			return bs;
//		}else{
//			return new BaseStation(false);
//		}
	}
	
	public double calPosition(Double lon1, Double lat1, Double lon2, Double lat2){
		double R = 6371; //����ƽ��뾶
		 double distance = 0.0; //����
		        double dLat = (lat2 - lat1) * Math.PI / 180; //γ�����Ļ���
		        double dLon = (lon2 - lon1) * Math.PI / 180; //�������Ļ���
		        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) 
		                + Math.cos(lat1 * Math.PI / 180) 
		                * Math.cos(lat2 * Math.PI / 180) * Math.sin(dLon / 2) 
		                * Math.sin(dLon / 2); 
		        distance = (2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))) * R; //��õľ���
//		        System.out.println("距离是"+distance);
		        return distance;
	}

	public static void main(String[] args) {
		
	} 

}
