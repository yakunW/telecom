package zlq.bean;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import dbc.DBConn;
import zlq.bean.XunjianDao;
import zlq.bean.Xunjian;

public class XunjianDaoImpl implements XunjianDao{

	public int Getcount(String date1,String date2,String xjName,String stationName,String level){
		int count=0,counta=0,countb=0,countcd=0,countsn=0,countsw=0,counttt=0;
		DataBaseConnection dbc = null;
		PreparedStatement pstmt = null;	
     	ResultSet rs=null;
     	//String sql="select count(distinct zt_a.baseId)+count(distinct zt_b.baseId)+count(distinct zt_cd.baseId)+count(distinct zt_sn.baseId)+count(distinct zt_sw.baseId)+count(distinct zt_tt.baseId)"
     	//		   +" from zt_a,zt_b,zt_cd,zt_sn,zt_sw,zt_tt where unix_timestamp(zt_a.xjrq)=unix_timestamp(zt_b.xjrq)=unix_timestamp(zt_cd.xjrq)=unix_timestamp(zt_sn.xjrq)=unix_timestamp(zt_sw.xjrq)=unix_timestamp(zt_tt.xjrq) between  unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
   
     	String sqlbase="select baseName from base where stationName='"+stationName+"' ";
   
     	String sqla="select count(distinct baseId) from zt_a where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlb="select count(distinct baseId) from zt_b where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlcd="select count(distinct baseId) from zt_cd where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsn="select count(distinct baseId) from zt_sn where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsw="select count(distinct baseId) from zt_sw where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqltt="select count(distinct baseId) from zt_tt where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	
     	if((xjName!=null)&&(xjName!="")){
     		sqla+=" and xjry='"+xjName+"'";
     		sqlb+=" and xjry='"+xjName+"'";
     		sqlcd+=" and xjry='"+xjName+"'";
     		sqlsn+=" and xjry='"+xjName+"'";
     		sqlsw+=" and xjry='"+xjName+"'";
     		sqltt+=" and xjry='"+xjName+"'";
     	}
     	else{
     		
     	}
     	if((stationName!=null)&&(stationName!="")){
     		sqla+=" and baseName in ("+sqlbase+") ";
     		sqlb+=" and baseName in ("+sqlbase+") ";
     		sqlcd+=" and baseName in ("+sqlbase+") ";
     		sqlsn+=" and baseName in ("+sqlbase+") ";
     		sqlsw+=" and baseName in ("+sqlbase+") ";
     		sqltt+=" and baseName in ("+sqlbase+") ";
     	}
     	else{
     		
     	}
     	if((level!=null)&&(level!="")){
     		if(level.equals("A类基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqla);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("B类基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlb);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("C类基站")){
     			sqlcd+=" and level= 'C'";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlcd);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("D类基站")){
     			sqlcd+=" and level= 'D'";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlcd);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("室内基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlsn);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("直放站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlsw);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("铁塔")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqltt);
     				rs=pstmt.executeQuery();
     				if(rs.next()){
     					count=rs.getInt(1);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     	}
     	else{
     		try{
 				dbc=new DataBaseConnection();
 				pstmt=dbc.getConnection().prepareStatement(sqla);
 				rs=pstmt.executeQuery();
 				if(rs.next()){
 					counta=rs.getInt(1);
 				}
// 				System.out.println(counta);
 				pstmt=dbc.getConnection().prepareStatement(sqlb);
 				rs=pstmt.executeQuery();
 				if(rs.next()){
 					countb=rs.getInt(1);
 				}
// 				System.out.println(countb);
 				pstmt=dbc.getConnection().prepareStatement(sqlcd);
 				rs=pstmt.executeQuery();
 				if(rs.next()){
 					countcd=rs.getInt(1);
 				}
// 				System.out.println(countcd);
 				pstmt=dbc.getConnection().prepareStatement(sqlsn);
 				rs=pstmt.executeQuery();
 				if(rs.next()){
 					countsn=rs.getInt(1);
 				}
// 				System.out.println(countsn);
 				pstmt=dbc.getConnection().prepareStatement(sqlsw);
 				rs=pstmt.executeQuery();
 				if(rs.next()){
 					countsw=rs.getInt(1);
 				}
// 				System.out.println(countsw);
// 				pstmt=dbc.getConnection().prepareStatement(sqltt);
// 				rs=pstmt.executeQuery();
// 				if(rs.next()){
// 					counttt=rs.getInt(1);
// 				}
 				count=counta+countb+countcd+countsn+countsw+counttt;
// 				System.out.println(count);
 				rs.close();
 				pstmt.close();
 				
 			}catch(Exception e){
 				e.printStackTrace();
 			}finally{
 				dbc.close();
 			}
     	}
     	
		return count;
	}
	
	public List<Xunjian> MxxjSearch(String date1,String date2,String xjName,String stationName,String level)
    {
    	List<Xunjian> xjList=new ArrayList<Xunjian>();
    	DataBaseConnection dbc = null;
		PreparedStatement pstmt = null;	
     	ResultSet rs=null;
     	
     	String sqlbase="select baseName from base where stationName='"+stationName+"' ";
     	String sqla="select * from zt_a where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlb="select * from zt_b where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlcd="select * from zt_cd where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsn="select * from zt_sn where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsw="select * from zt_sw where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqltt="select * from zt_tt where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	
     	if((xjName!=null)&&(xjName!="")){
     		sqla+=" and xjry='"+xjName+"'";
     		sqlb+=" and xjry='"+xjName+"'";
     		sqlcd+=" and xjry='"+xjName+"'";
     		sqlsn+=" and xjry='"+xjName+"'";
     		sqlsw+=" and xjry='"+xjName+"'";
     		sqltt+=" and xjry='"+xjName+"'";
     	}
     	else{
     		
     	}
     	if((stationName!=null)&&(stationName!="")){
     		sqla+=" and baseName in ("+sqlbase+") ";
     		sqlb+=" and baseName in ("+sqlbase+") ";
     		sqlcd+=" and baseName in ("+sqlbase+") ";
     		sqlsn+=" and baseName in ("+sqlbase+") ";
     		sqlsw+=" and baseName in ("+sqlbase+") ";
     		sqltt+=" and baseName in ("+sqlbase+") ";
     	}
     	else{
     		
     	}
     	if((level!=null)&&(level!="")){
     		if(level.equals("A类基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqla);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("B类基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlb);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("C类基站")){
     			sqlcd+=" and level= 'C'";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlcd);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("D类基站")){
     			sqlcd+=" and level= 'D'";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlcd);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("室内基站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlsn);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("直放站")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqlsw);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("铁塔")){
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sqltt);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xunjian.setXjName(rs.getString("xjry"));
     	   				xunjian.setXjDate(rs.getString("xjrq"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     	}
     	else{
     		String Sql=sqla+" union all "+sqlb+" union all "+sqlcd+" union all "+sqlsn+" union all "+sqlsw+" union all "+sqltt;
     		try{
 				dbc=new DataBaseConnection();
 				pstmt=dbc.getConnection().prepareStatement(Sql);
 				rs=pstmt.executeQuery();
 				while(rs.next()){
 					Xunjian xunjian=new Xunjian();
 					xunjian.setBaseId(rs.getString("baseId"));
 	   				xunjian.setBaseName(rs.getString("baseName"));
 	   				xunjian.setBaserank(rs.getString("level"));
 	   				xunjian.setXjName(rs.getString("xjry"));
 	   				xunjian.setXjDate(rs.getString("xjrq"));
 	   				xjList.add(xunjian);
 				}
 				
 				rs.close();
 				pstmt.close();
 				
 			}catch(Exception e){
 				e.printStackTrace();
 			}finally{
 				dbc.close();
 			}
     	}
     	return xjList;
    }
	public List<Xunjian> UnxjSearch(String date1,String date2,String xjName,String stationName,String level)
    {
		List<Xunjian> xjList = new ArrayList<Xunjian>();
    	DataBaseConnection dbc = null;
		PreparedStatement pstmt = null;	
     	ResultSet rs=null;
     	
     	String sqlbase="select baseName from base where stationName='"+stationName+"' ";
     	String sqla="select baseid from zt_a where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlb="select baseid from zt_b where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlcd="select baseid from zt_cd where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsn="select baseid from zt_sn where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqlsw="select baseid from zt_sw where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	String sqltt="select baseid from zt_tt where unix_timestamp(xjrq) between unix_timestamp('"+ date1 +"') and unix_timestamp('"+ date2 +"') ";
     	
     	if((xjName!=null)&&(xjName!="")){
     		sqla+=" and xjry='"+xjName+"'";
     		sqlb+=" and xjry='"+xjName+"'";
     		sqlcd+=" and xjry='"+xjName+"'";
     		sqlsn+=" and xjry='"+xjName+"'";
     		sqlsw+=" and xjry='"+xjName+"'";
     		sqltt+=" and xjry='"+xjName+"'";
     	}
     	else{
     		
     	}
     	if((stationName!=null)&&(stationName!="")){
     		sqla+=" and baseName in ("+sqlbase+") ";
     		sqlb+=" and baseName in ("+sqlbase+") ";
     		sqlcd+=" and baseName in ("+sqlbase+") ";
     		sqlsn+=" and baseName in ("+sqlbase+") ";
     		sqlsw+=" and baseName in ("+sqlbase+") ";
     		sqltt+=" and baseName in ("+sqlbase+") ";
     	}
     	else{
     		
     	}
     	if((level!=null)&&(level!="")){
     		if(level.equals("A类基站")){
     			String sql="";
     			if((stationName!=null)&&(stationName!="")){
     				sql="select baseId,baseName,level from base where stationName='"+stationName+"' and category=0 and level='A' AND baseId not in ("+sqla+")";
     			}
     			else{
     				sql="select baseId,baseName,level from base where category=0 and level='A' AND baseId not in ("+sqla+")";
     			}
     			
     			
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("B类基站")){
     			String sql="";
     			if((stationName!=null)&&(stationName!="")){
     				sql="select baseId,baseName,level from base where stationName='"+stationName+"' and category=0 and level='B' AND baseId not in ("+sqlb+")";
     			}
     			else{
     				sql="select baseId,baseName,level from base where category=0 and level='B' AND baseId not in ("+sqlb+")";
     			}
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("C类基站")){
     			String sql="";
     			if((stationName!=null)&&(stationName!="")){
     				sql="select baseId,baseName,level from base where stationName='"+stationName+"' and category=0 and level='C' AND baseId not in ("+sqlcd+")";
     			}
     			else
     			{
     				sql="select baseId,baseName,level from base where category=0 and level='C' AND baseId not in ("+sqlcd+")";
     			}
     			System.out.println(sql);
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("D类基站")){
     			String sql="";
     			if((stationName!=null)&&(stationName!="")){
     				sql="select baseId,baseName,level from base where stationName='"+stationName+"' and category=0 and level='D' AND baseId not in ("+sqlcd+")";
     			}
     			else
     			{
     				sql="select baseId,baseName,level from base where category=0 and level='D' AND baseId not in ("+sqlcd+")";
     			}
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("室内基站")){
     			String sql="select baseId,baseName,level from base where category=1 AND baseId not in ("+sqlsn+")";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("直放站")){
     			String sql="select baseId,baseName,level from base where category=2 AND baseId not in ("+sqlsw+")";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     		else if(level.equals("铁塔")){
     			String sql="select baseId,baseName,level from base where category=0 AND baseId not in ("+sqltt+")";
     			try{
     				dbc=new DataBaseConnection();
     				pstmt=dbc.getConnection().prepareStatement(sql);
     				rs=pstmt.executeQuery();
     				while(rs.next()){
     					Xunjian xunjian=new Xunjian();
     					xunjian.setBaseId(rs.getString("baseId"));
     	   				xunjian.setBaseName(rs.getString("baseName"));
     	   				xunjian.setBaserank(rs.getString("level"));
     	   				xjList.add(xunjian);
     				}
     				rs.close();
     				pstmt.close();
     				
     			}catch(Exception e){
     				e.printStackTrace();
     			}finally{
     				dbc.close();
     			}
     		}
     	}
     	else{
     		String Sql=sqla+" union all "+sqlb+" union all "+sqlcd+" union all "+sqlsn+" union all "+sqlsw+" union all "+sqltt;
     		String sql="";
 			if((stationName!=null)&&(stationName!="")){
 				sql="select baseId,baseName,level from base where stationName='"+stationName+"' and baseId not in ("+Sql+")";
 			}
 			else
 			{
 				sql="select baseId,baseName,level from base where baseId not in ("+Sql+")";
 			}
 			try{
 				dbc=new DataBaseConnection();
 				pstmt=dbc.getConnection().prepareStatement(sql);
 				rs=pstmt.executeQuery();
 				while(rs.next()){
 					Xunjian xunjian=new Xunjian();
 					xunjian.setBaseId(rs.getString("baseId"));
 	   				xunjian.setBaseName(rs.getString("baseName"));
 	   				xunjian.setBaserank(rs.getString("level"));
 	   				xjList.add(xunjian);
 				}
 				
 				rs.close();
 				pstmt.close();
 				
 			}catch(Exception e){
 				e.printStackTrace();
 			}finally{
 				dbc.close();
 			}
     	}
     	return xjList;
    }
}
