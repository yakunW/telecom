package zlq.bean;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import zlq.bean.YichangDao;
import zlq.bean.Yichang;

public class YichangDaoImpl implements YichangDao{

	

	@Override
	public List<Yichang> ycSearch(String stationName,String ycName,String level,String date1,String date2) {
		// TODO Auto-generated method stub
        List<Yichang> ycList=new ArrayList<Yichang>();
		PreparedStatement pstmt = null;
		PreparedStatement pstmtdate = null;
		DataBaseConnection dbc = null;
        String lastdate=null;
        //System.out.println(baseName);
		try {	
			boolean a=false;
			String sqlbase="select baseName from base where stationName='"+stationName+"' ";
			String sqlbase2="select baseName from base where category=";
			String sqldate="select xjrq from ";//记录最后一次异常时间
	        String ssql="SELECT *,COUNT(baseName),MAX(xjrq) FROM ";
	        String gsql=" group by baseName,xjry";
	        
	        String sql_limit=null;
	        if((date1!=null)&&(date1!=""))
	        {sql_limit="WHERE xjrq>='"+date1+"'";a=true;}
	        if((date2!=null)&&(date2!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE xjrq<='"+date2+"'";a=true;}
	        	else
	        		sql_limit+=" AND xjrq<='"+date2+"'";
	        }
	        if((stationName!=null)&&(stationName!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE baseName in ("+sqlbase+") ";a=true;}
	        	else
	        		sql_limit+=" AND baseName in ("+sqlbase+") ";
	        }
	        if((ycName!=null)&&(ycName!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE yclx='"+ycName+"'";a=true;}
	        	else
	        		sql_limit+=" AND yclx='"+ycName+"'";
	        }
	        if((level!=null)&&(level!="")){
	        	if(level.equals("A类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='A') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='A') ";
	        	}else if(level.equals("B类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='B') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='B') ";
	        	}else if(level.equals("C类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='C') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='C') ";
	        	}else if(level.equals("D类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='D') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='D') ";
	        	}else if(level.equals("室内基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=1)  ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=1)  ";
	        	}else if(level.equals("直放站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=2) ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=2) ";
	        	}
	        }
	        
	        String sql01=ssql+" yichang_byq "+ sql_limit +" and ycz not in ('无','正常')"+gsql;
			String sql02=ssql+" yichang_jdxt "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql03=ssql+" yichang_jfhj "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql04=ssql+" yichang_jk "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql05=ssql+" yichang_jlpdx "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql06=ssql+" yichang_jzzsb "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql07=ssql+" yichang_kgdy "+ sql_limit+" and ycz<>'正常'"+gsql;
			String sql08=ssql+" yichang_kt "+ sql_limit+" and ycz not in ('无','正常')"+gsql;
			String sql09=ssql+" yichang_qtsb "+ sql_limit+" and ycz not in ('无','正常')"+gsql;
			String sql10=ssql+" yichang_td "+ sql_limit+" and ycz not in ('无','是')"+gsql;
			String sql11=ssql+" yichang_tt "+ sql_limit+" and ycz<>'是'"+gsql;
			String sql12=ssql+" yichang_tw "+ sql_limit+" and ycz not in ('否','正常')"+gsql;
			String sql13=ssql+" yichang_xdcjc "+ sql_limit+" and ycz<>'无'"+gsql;
			String sql14=ssql+" yichang_sbjc "+ sql_limit+" and ycz not in ('是','正常')"+gsql;

			String sql = sql01 + " union all " + sql02+ " union all " + sql03+ " union all " + sql04+ " union all " + sql05+ " union all "
					   + sql06 + " union all " + sql07+ " union all " + sql08+ " union all " + sql09+ " union all " + sql10+ " union all "
					   + sql11 + " union all " + sql12+ " union all " + sql13+ " union all " + sql14;
	        
	        //String temp=selectsql(ycName);

	        //sqldate=sqldate+temp+" ORDER BY xjrq  desc";
	        
	        
	                		        		        
	        //sql=sql+temp;
	        //System.out.println(sql);
	     // 连接数据库
	     	dbc = new DataBaseConnection();
	     	pstmt = dbc.getConnection().prepareStatement(sql);
	     	//pstmtdate = dbc.getConnection().prepareStatement(sqldate);
	     			
	     // 进行数据库查询操作
	     	ResultSet rs = pstmt.executeQuery();
	     	//ResultSet rsdate = pstmtdate.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集   
	        int totalyc=0;
	        
			while (rs.next()) {
				Yichang yichang = new Yichang();
				setyc(yichang,rs.getString("baseId"),rs.getString("baseName"),rs.getString("level"),rs.getString("xjry"),rs.getString("yclx"),rs.getString("yccs"),rs.getString("ycz"),rs.getString("xjrq"),rs.getString("ssb"));
				yichang.setYcNum(rs.getInt("COUNT(baseName)"));
				yichang.setDate(rs.getString("MAX(xjrq)"));
				ycList.add(yichang);
			}
//			while(rsdate.next())
//	        {
//	        		lastdate= rsdate.getString("xjrq");		        		
//	        		break;        	
//	        }	
//			yichang.setDate(lastdate);
//			yichang.setYcNum(totalyc);
			rs.close();
		    pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		
		return ycList;
	}
	public List<Yichang> ycSearchMX(String stationName,String ycName,String level,String date1,String date2){
		// TODO Auto-generated method stub
		List<Yichang> ycList=new ArrayList<Yichang>();
		PreparedStatement pstmt = null;
		PreparedStatement pstmtdate = null;
		DataBaseConnection dbc = null;
        String lastdate=null;
        //System.out.println(baseName);
		try {	
			boolean a=false;
			String sqlbase="select baseName from base where stationName='"+stationName+"' ";
			String sqldate="select xjrq from ";//记录最后一次异常时间
	        String ssql="SELECT * FROM ";
	        //String gsql=" group by baseName";
	        
	        String sql_limit=null;
	        if((date1!=null)&&(date1!=""))
	        {sql_limit="WHERE xjrq>='"+date1+"'";a=true;}
	        if((date2!=null)&&(date2!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE xjrq<='"+date2+"'";a=true;}
	        	else
	        		sql_limit+=" AND xjrq<='"+date2+"'";
	        }
	        if((stationName!=null)&&(stationName!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE baseName in ("+sqlbase+") ";a=true;}
	        	else
	        		sql_limit+=" AND baseName in ("+sqlbase+") ";
	        }
	        if((ycName!=null)&&(ycName!=""))
	        {
	        	if(a==false)
	        	{sql_limit+="WHERE yclx='"+ycName+"'";a=true;}
	        	else
	        		sql_limit+=" AND yclx='"+ycName+"'";
	        }
	        if((level!=null)&&(level!="")){
	        	if(level.equals("A类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='A') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='A') ";
	        	}else if(level.equals("B类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='B') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='B') ";
	        	}else if(level.equals("C类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='C') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='C') ";
	        	}else if(level.equals("D类基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=0 and level='D') ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=0 and level='D') ";
	        	}else if(level.equals("室内基站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=1)  ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=1)  ";
	        	}else if(level.equals("直放站")){
	        		if(a==false)
		        	{sql_limit+="WHERE baseName in (select baseName from base where category=2) ";a=true;}
		        	else
		        		sql_limit+=" AND baseName in (select baseName from base where category=2) ";
	        	}
	        }
	        
	        String sql01=ssql+" yichang_byq "+ sql_limit +" and ycz not in ('无','正常')";
			String sql02=ssql+" yichang_jdxt "+ sql_limit+" and ycz<>'正常'";
			String sql03=ssql+" yichang_jfhj "+ sql_limit+" and ycz<>'正常'";
			String sql04=ssql+" yichang_jk "+ sql_limit+" and ycz<>'正常'";
			String sql05=ssql+" yichang_jlpdx "+ sql_limit+" and ycz<>'正常'";
			String sql06=ssql+" yichang_jzzsb "+ sql_limit+" and ycz<>'正常'";
			String sql07=ssql+" yichang_kgdy "+ sql_limit+" and ycz<>'正常'";
			String sql08=ssql+" yichang_kt "+ sql_limit+" and ycz not in ('无','正常')";
			String sql09=ssql+" yichang_qtsb "+ sql_limit+" and ycz not in ('无','正常')";
			String sql10=ssql+" yichang_td "+ sql_limit+" and ycz not in ('无','是')";
			String sql11=ssql+" yichang_tt "+ sql_limit+" and ycz<>'是'";
			String sql12=ssql+" yichang_tw "+ sql_limit+" and ycz not in ('否','正常')";
			String sql13=ssql+" yichang_xdcjc "+ sql_limit+" and ycz<>'无'";
			String sql14=ssql+" yichang_sbjc "+ sql_limit+" and ycz not in ('是','正常')";

			String sql = sql01 + " union all " + sql02+ " union all " + sql03+ " union all " + sql04+ " union all " + sql05+ " union all "
					   + sql06 + " union all " + sql07+ " union all " + sql08+ " union all " + sql09+ " union all " + sql10+ " union all "
					   + sql11 + " union all " + sql12+ " union all " + sql13+ " union all " + sql14;
	        

	        //System.out.println(sql);
	     // 连接数据库
	     	dbc = new DataBaseConnection();
	     	pstmt = dbc.getConnection().prepareStatement(sql);
	     	//pstmtdate = dbc.getConnection().prepareStatement(sqldate);
	     			
	     // 进行数据库查询操作
	     	ResultSet rs = pstmt.executeQuery();
	     	//ResultSet rsdate = pstmtdate.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集   
	        int totalyc=0;
	        
			while (rs.next()) {
				Yichang yichang = new Yichang();
				setyc(yichang,rs.getString("baseId"),rs.getString("baseName"),rs.getString("level"),rs.getString("xjry"),rs.getString("yclx"),rs.getString("yccs"),rs.getString("ycz"),rs.getString("xjrq"),rs.getString("ssb"));
				
				ycList.add(yichang);
			}
			rs.close();
		    pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			dbc.close();
		}
		
		return ycList;
	}
	private void setyc(Yichang yichang, String baseid,String basename,String category,String staffname,String yclxname,String yccsname,String yczname,String date,String ssb){
	   yichang.setBaseId(baseid);
   	   yichang.setBaseName(basename);
   	   yichang.setCategory(category);
   	   yichang.setStaffName(staffname);
   	   yichang.setYclxName(yclxname);	
   	   yichang.setYccsName(yccsname);
   	   yichang.setYczName(yczname);
   	   yichang.setDate(date);
   	   yichang.setTable(ssb);
	}
//	private String selectsql(String ycName)
//	{
//		String temp="";
//		if(ycName.equals("机房环境"))
//        {
//        	temp=" yichang_jfhj  ";
//        }
//        else if(ycName.equals("空调"))
//        {
//        	temp=" yichang_kt  ";
//        }
//        else if(ycName.equals("变压器"))
//        {
//        	temp=" yichang_byq  ";
//        }
//        else if(ycName.equals("交流配电箱"))
//        {
//        	temp=" yichang_jlpdx  ";
//        }
//        else if(ycName.equals("基站主设备"))
//        {
//        	temp=" yichang_jzzsb  ";
//        }
//        else if(ycName.equals("其他设备"))
//        {
//        	temp=" yichang_qtsb  ";
//        }
//        else if(ycName.equals("开关电源"))
//        {
//        	temp=" yichang_kgdy  ";
//        }
//        else if(ycName.equals("监控"))
//        {
//        	temp=" yichang_jk  ";
//        }
//        else if(ycName.equals("接地系统"))
//        {
//        	temp=" yichang_jdxt  ";
//        }
//        else if(ycName.equals("塔桅、天馈线/GPS"))
//        {
//        	temp=" yichang_tw  ";
//        }
//        else if(ycName.equals("铁塔塔体"))
//        {
//        	temp=" yichang_tt  ";
//        }
//        else if(ycName.equals("铁塔塔灯"))
//        {
//        	temp=" yichang_td  ";
//        }
//        else if(ycName.equals("蓄电池检查"))
//        {
//        	temp=" yichang_xdcjc  ";
//        }
//        else if(ycName.equals("设备检查"))
//        {
//        	temp=" yichang_sbjc  ";
//        }
//		return temp;
//	}
}