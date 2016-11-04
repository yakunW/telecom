package zlq.bean;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import cn.edu.bupt.anm.conn.DataBaseConnection;
import zlq.bean.ElecDao;
import zlq.bean.Elec;
import dbc.DBConn;

public class ElecImpl implements ElecDao {
//    public int searchByTime(){
//    	int num=0;    	
//    	String sql="select basename from dljc where presentchecktime is ?";
//    	PreparedStatement pstmt = null;
//		DataBaseConnection dbc = null;
//		
//		try {
//			 
//		     dbc=new DataBaseConnection();
//		     pstmt=dbc.getConnection().prepareStatement(sql);
//		     pstmt.setString(1,null);
//		     ResultSet rs=pstmt.executeQuery();
//		     
//		     while(rs.next())
//		     {
//		    	 num++;
//		     }
//		     rs.close();
//			 pstmt.close();
//		     
//		} catch (Exception e) {
//			e.printStackTrace();
//			// TODO: handle exception
//			
//		} finally{
//			dbc.close();
//		}
//			
//    	return num;
//    }
//    public int searchById(){
//    	int count=0;
//    	String sql="select baseid from dljc";
//    	PreparedStatement pstmt=null;
//    	DataBaseConnection dbc=null;
//    	
//    	try {
//			
//			dbc = new DataBaseConnection();
//			pstmt = dbc.getConnection().prepareStatement(sql);
//			ResultSet rs = pstmt.executeQuery();
//			
//			while(rs.next()){
//				count++;
//			}
//			rs.close();
//			pstmt.close();
//		} catch (Exception e) {
//			e.printStackTrace();
//			// TODO: handle exception
//		} finally{
//			dbc.close();
//		}
//		return count;
//    }
    
    public List<Elec> elecSearch(String basename,String checkername,String starttime, String endtime) {
    	List<Elec> eleclist = new ArrayList<Elec>();
    	
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
//		System.out.println(basename);
//		System.out.println(checkername);
//		System.out.println(starttime);
//		System.out.println(endtime);
		
		try{
			boolean a=false;
	        String sql="SELECT * FROM dljc  "; 
	        if((starttime!=null)&&(starttime!=""))
	        {sql=sql+"WHERE presentchecktime>='"+starttime+"'";a=true;}
	        if((endtime!=null)&&(endtime!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE presentchecktime<='"+endtime+"'";a=true;}
	        	else
	        	 sql+=" AND presentchecktime<='"+endtime+"'";
	        }
	        if((basename!=null)&&(basename!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE basename='"+basename+"'";a=true;}
	        	else
	        	 sql+=" AND basename='"+basename+"'";
	        }
	        if((checkername!=null)&&(checkername!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE checkername='"+checkername+"'";a=true;}
	        	else
	        	 sql+=" AND checkername='"+checkername+"'";
	        }
	       	        		        		        
	        sql+=" ORDER BY baseid";
	     // 连接数据库
	     	dbc = new DataBaseConnection();
	     	pstmt = dbc.getConnection().prepareStatement(sql);
	     			
	     // 进行数据库查询操作
	     	ResultSet rs = pstmt.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集  
	        //System.out.println("最后的查询结果为：");  

			while (rs.next()) {
				Elec elec=new Elec();
				elec.setBaseid(rs.getString("baseid"));
				elec.setBasename(rs.getString("basename"));
				elec.setBaserank(rs.getString("baserank"));
				elec.setCheckername(rs.getString("checkername"));
				elec.setLastchecktime(rs.getString("lastchecktime"));
				elec.setLastchecknum(rs.getDouble("lastchecknum"));
				elec.setPresentchecktime(rs.getString("presentchecktime"));
				elec.setPresentchecknum(rs.getDouble("presentchecknum"));
				elec.setDaysBetween(rs.getString("presentchecktime"), rs.getString("lastchecktime"));
				elec.setPower(rs.getDouble("lastchecknum"), rs.getDouble("presentchecknum"));
				elec.setAvgStr(rs.getDouble("lastchecknum"), rs.getDouble("presentchecknum"), rs.getString("presentchecktime"), rs.getString("lastchecktime"));
				elec.setPicname(rs.getString("picname"));
				eleclist.add(elec);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return eleclist;
    }
    
    
    public List<Elec> elecSearchBytime(String basename,String checkername,String starttime, String endtime) {
    	List<Elec> eleclist = new ArrayList<Elec>();
    	
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		try{
			boolean a=false;
			String sqltemp="SELECT basename,baserank,SUM(presentchecknum),SUM(lastchecknum)FROM ";
	        String sql="SELECT * FROM dljc "; 
	        if((starttime!=null)&&(starttime!=""))
	        {sql=sql+"WHERE presentchecktime>='"+starttime+"'";a=true;}
	        if((endtime!=null)&&(endtime!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE presentchecktime<='"+endtime+"'";a=true;}
	        	else
	        	 sql+=" AND presentchecktime<='"+endtime+"'";
	        }
	        if((basename!=null)&&(basename!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE basename='"+basename+"'";a=true;}
	        	else
	        	 sql+=" AND basename='"+basename+"'";
	        }
	        if((checkername!=null)&&(checkername!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE checkername='"+checkername+"'";a=true;}
	        	else
	        	 sql+=" AND checkername='"+checkername+"'";
	        }
	        String Sql=sqltemp+"("+sql+")"+"as a   GROUP BY basename";
	     // 连接数据库
	     	dbc = new DataBaseConnection();
	     	pstmt = dbc.getConnection().prepareStatement(Sql);
	     			
	     // 进行数据库查询操作
	     	ResultSet rs = pstmt.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集    

			while (rs.next()) {
				Elec elec=new Elec();
				elec.setBasename(rs.getString("basename"));
				elec.setBaserank(rs.getString("baserank"));
                elec.setPower(rs.getDouble("SUM(lastchecknum)"), rs.getDouble("SUM(presentchecknum)"));
				eleclist.add(elec);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return eleclist;
    }
    
    public List<Elec> elecSearchBychecker(String basename,String checkername,String starttime, String endtime){
        List<Elec> eleclist = new ArrayList<Elec>();
        
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs=null;
		try{
			boolean a=false;
			//String sqltemp="SELECT *,SUM(presentchecknum),SUM(lastchecknum)FROM ";
	        String sql="SELECT * FROM dljc "; 
	        if((starttime!=null)&&(starttime!=""))
	        {sql=sql+"WHERE presentchecktime>='"+starttime+"'";a=true;}
	        if((endtime!=null)&&(endtime!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE presentchecktime<='"+endtime+"'";a=true;}
	        	else
	        	 sql+=" AND presentchecktime<='"+endtime+"'";
	        }
	        if((basename!=null)&&(basename!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE basename='"+basename+"'";a=true;}
	        	else
	        	 sql+=" AND basename='"+basename+"'";
	        }
	        if((checkername!=null)&&(checkername!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE checkername='"+checkername+"'";a=true;}
	        	else
	        	 sql+=" AND checkername='"+checkername+"'";
	        }
	        //String Sql=sqltemp+"("+sql+")"+"as a ";
	     // 连接数据库
	     	dbc = new DataBaseConnection();
	     	pstmt = dbc.getConnection().prepareStatement(sql);
	     			
	     // 进行数据库查询操作
	     	rs = pstmt.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集    

	         
			while (rs.next()) {
				Elec elec=new Elec(); 
				elec.setBaseid(rs.getString("baseid"));
				elec.setBasename(rs.getString("basename"));
				elec.setBaserank(rs.getString("baserank"));
				elec.setCheckername(rs.getString("checkername"));
				elec.setLastchecknum(rs.getDouble("lastchecknum"));
				elec.setPresentchecktime(rs.getString("presentchecktime"));
				elec.setPresentchecknum(rs.getDouble("presentchecknum"));
				elec.setDaysBetween(rs.getString("presentchecktime"), rs.getString("lastchecktime"));
				elec.setPower(rs.getDouble("lastchecknum"), rs.getDouble("presentchecknum"));
				elec.setAvgStr(rs.getDouble("lastchecknum"), rs.getDouble("presentchecknum"), rs.getString("presentchecktime"), rs.getString("lastchecktime"));
				elec.setPicname(rs.getString("picname"));
				eleclist.add(elec);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			
			dbc.close();
		}
		return eleclist;
    }
    
    public List<Elec> elecSearchByBase(String basename,String checkername,String starttime, String endtime){
        List<Elec> eleclist = new ArrayList<Elec>();
    	
		PreparedStatement pstmt = null;
		 Connection conn=DBConn.getConnection();
		
		try{
			boolean a=false;
			String sqltemp="SELECT basename,baserank,SUM(presentchecknum),SUM(lastchecknum)FROM ";
	        String sql="SELECT * FROM dljc "; 
	        if((starttime!=null)&&(starttime!=""))
	        {sql=sql+"WHERE presentchecktime>='"+starttime+"'";a=true;}
	        if((endtime!=null)&&(endtime!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE presentchecktime<='"+endtime+"'";a=true;}
	        	else
	        	 sql+=" AND presentchecktime<='"+endtime+"'";
	        }
	        if((basename!=null)&&(basename!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE basename='"+basename+"'";a=true;}
	        	else
	        	 sql+=" AND basename='"+basename+"'";
	        }
	        if((checkername!=null)&&(checkername!=""))
	        {
	        	if(a==false)
	        	{sql+="WHERE checkername='"+checkername+"'";a=true;}
	        	else
	        	 sql+=" AND checkername='"+checkername+"'";
	        }
	        String Sql=sqltemp+"("+sql+")"+"as a   GROUP BY basename";
	     // 连接数据库
	     	pstmt = conn.prepareStatement(Sql);
	     			
	     // 进行数据库查询操作
	     	ResultSet rs = pstmt.executeQuery();
	        //执行sql查询语句，返回查询数据的结果集  
	        //System.out.println("最后的查询结果为：");  

			while (rs.next()) {
				Elec elec=new Elec();
				elec.setBasename(rs.getString("basename"));
				elec.setBaserank(rs.getString("baserank"));
				elec.setPower(rs.getDouble("SUM(lastchecknum)"), rs.getDouble("SUM(presentchecknum)"));
				//System.out.println(elec.getBasename());
				eleclist.add(elec);
			}
			rs.close();
			pstmt.close();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConn.closeConnection(conn);
		}
		return eleclist;
    }
    
    //插入记录
    @SuppressWarnings("null")
	public void elecInsert(String baseid,String basename,String baserank,String checkername,String lastchecktime, double lastchecknum,String presentchecktime,double presentchecknum,String picname)
    {   
		Statement pstmt = null;
		DataBaseConnection dbc = null;
		ResultSet rs=null;
		String sql="";
		boolean flag=judge(baseid,presentchecktime);
		if(flag)
		{
			if(lastchecktime=="")
			{
				sql="INSERT into dljc (baseid,basename,baserank,checkername,lastchecknum,presentchecktime,presentchecknum,picname) values('"+baseid+"','"+basename+"','"+baserank+"','"+checkername+"','"+lastchecknum+"','"+presentchecktime+"','"+presentchecknum+"','"+picname+"')";
			}
			else{
				sql="INSERT into dljc (baseid,basename,baserank,checkername,lastchecktime,lastchecknum,presentchecktime,presentchecknum,picname) values('"+baseid+"','"+basename+"','"+baserank+"','"+checkername+"','"+lastchecktime+"','"+lastchecknum+"','"+presentchecktime+"','"+presentchecknum+"','"+picname+"')";
			}
		}
		else
		{
			sql="update dljc set checkername='"+checkername+"', presentchecknum='"+presentchecknum+"',picname='"+picname+"' where baseid='"+baseid+"' and presentchecktime='"+presentchecktime+"'";
		}
		
		try {
			dbc = new DataBaseConnection();
			pstmt=dbc.getConnection().createStatement();
			pstmt.executeUpdate(sql);
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally{
			dbc.close();
		}
    }
    
    public boolean judge(String baseid,String presentchecktime)
    {
    	boolean flag=true;
    	String sql="select * from dljc where baseid='"+baseid+"' and presentchecktime='"+presentchecktime+"'";
    	System.out.println(sql);
    	PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		try{
			dbc=new DataBaseConnection();
			pstmt=dbc.getConnection().prepareStatement(sql);
			ResultSet rs=pstmt.executeQuery();
			if(rs.next())
			{
				flag=false;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			dbc.close();
		}
		return flag;
    }
    
//    public void elecdel(int bsid,String date)
//    {
//    	Statement stm=null;
//    	DataBaseConnection dbc=null;
//    	String sql ="delete from dljc where bsid='"+bsid+"' and presentchecktime='"+date+"'";
//    	System.out.println(sql);
//    	try{
//    		dbc=new DataBaseConnection();
//    		stm=dbc.getConnection().createStatement();
//    		stm.executeUpdate(sql);
//    		stm.close();
//    	}catch(Exception e)
//    	{
//    		e.printStackTrace();
//    	}finally{
//    		dbc.close();
//    	}
//    }
}
