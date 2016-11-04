package wyk.action;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import dbc.DBConn;
public class GetXunjianZtAction {//获取巡检状态：剩余天数，已巡检基站个数
	String aFirstDay=null;
	String aLastDay=null;
	String bFirstDay=null;
	String bLastDay=null;
	String cdFirstDay=null;
	String cdLastDay=null;
	String ttFirstDay=null;
	String ttLastDay=null;
	String snFirstDay=null;
	String snLastDay=null;
	String swFirstDay=null;
	String swLastDay=null;
	long from=0,to=0;
	long countA=0,leftA=0,countB=0,leftB=0,countCD=0,leftCD=0,countTT=0,leftTT=0,countSN=0,countSW;//count是已巡检个数，left是巡检剩余天数
    
	public String execute(){
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		Statement stmt=null;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar ca=Calendar.getInstance();//获取当前日期 
		Calendar today=Calendar.getInstance();
		try{
			/*获取a类基站本次巡检的起始日期和结束日期*/
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			aFirstDay=format.format(ca.getTime());
			ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
			aLastDay=format.format(ca.getTime());
		    from = format.parse(format.format(today.getTime())).getTime();
			to = format.parse(aLastDay).getTime();
		    leftA=(to - from) / (1000 * 60 * 60 * 24);
			/*获取b类基站本次巡检的起始日期和结束日期*/
			ca=Calendar.getInstance();
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			int monthb=ca.get(Calendar.MONTH)+1;//获取本月的月份
			if(monthb%2==1){//本月为巡检周期的第一个月
				bFirstDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH,1);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				bLastDay=format.format(ca.getTime());
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(bLastDay).getTime();
				    leftB=(to - from) / (1000 * 60 * 60 * 24);
			}
			else if(monthb%2==0){//本月为巡检周期的第二个月
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				bLastDay=format.format(ca.getTime());	
				ca.add(Calendar.MONTH , -1);//减一个月
				ca.set(Calendar.DAY_OF_MONTH, 1);
				bFirstDay=format.format(ca.getTime());
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(bLastDay).getTime();
				    leftB=(to - from) / (1000 * 60 * 60 * 24);
			}
		
			/*获取c/d类基站本次巡检的起始日期和结束日期*/
			ca=Calendar.getInstance();
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			int monthcd=ca.get(Calendar.MONTH)+1;//获取本月的月份
//			System.out.println(monthcd);
			if(monthcd%3==0){//本月是巡检周期的最后一个月
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				cdLastDay=format.format(ca.getTime());	
				ca.add(Calendar.MONTH, -2);//获取本周期的第一个月
				ca.set(Calendar.DAY_OF_MONTH,1);
				cdFirstDay=format.format(ca.getTime());
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(cdLastDay).getTime();
				    leftCD=(to - from) / (1000 * 60 * 60 * 24);
			}
			else if(monthcd%3==1){//本月是巡检周期的第一个月
				cdFirstDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH, 2);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				cdLastDay=format.format(ca.getTime());
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(cdLastDay).getTime();
				    leftCD=(to - from) / (1000 * 60 * 60 * 24);
			}
			else if(monthcd%3==2){//本月是巡检周期的第二个月 				
				ca.add(Calendar.MONTH, 1);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				cdLastDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH, -2);
				ca.set(Calendar.DAY_OF_MONTH, 1);
				cdFirstDay=format.format(ca.getTime());
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(cdLastDay).getTime();
				    leftCD=(to - from) / (1000 * 60 * 60 * 24);
			}
			/*获取铁塔基站本次巡检的起始日期和结束日期*/
			ca=Calendar.getInstance();
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			int monthtt=ca.get(Calendar.MONTH)+1;//获取本月的月份
			if(monthtt<=6){
				ca.set(Calendar.MONTH, 0);
				ttFirstDay=format.format(ca.getTime());
				ca.set(Calendar.MONTH, 5);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				ttLastDay=format.format(ca.getTime());	
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(ttLastDay).getTime();
				    leftTT=(to - from) / (1000 * 60 * 60 * 24);
			}
			else{
				ca.set(Calendar.MONTH, 5);
				ttFirstDay=format.format(ca.getTime());
				ca.set(Calendar.MONTH, 11);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				ttLastDay=format.format(ca.getTime());	
			    from = format.parse(format.format(today.getTime())).getTime();
					to = format.parse(ttLastDay).getTime();
				    leftTT=(to - from) / (1000 * 60 * 60 * 24);
			}
			/*获取室内本次巡检的起始日期和结束日期（同a类基站）*/
			
			/*获取室分本次巡检的起始日期和结束日期（同c/d类基站）*/
		}
		catch(Exception e){
			e.printStackTrace();
		}
				
		try
		{
			stmt=conn.createStatement();
			rs=stmt.executeQuery("select count(distinct baseId) from zt_a where  unix_timestamp(xjrq) between  unix_timestamp('"+aFirstDay+"') and unix_timestamp('"+aLastDay+"')");
	  		if(rs.next()){
	  			countA=rs.getInt(1);
	  		}
			rs=stmt.executeQuery("select count(distinct baseId) from zt_b where  unix_timestamp(xjrq) between  unix_timestamp('"+bFirstDay+"') and unix_timestamp('"+bLastDay+"')");
			if(rs.next()){
				countB=rs.getInt(1);
			}
			rs=stmt.executeQuery("select count(distinct baseId) from zt_cd where  unix_timestamp(xjrq) between  unix_timestamp('"+cdFirstDay+"') and unix_timestamp('"+cdLastDay+"')");
			if(rs.next()){
				countCD=rs.getInt(1);
			}
			rs=stmt.executeQuery("select count(distinct baseId) from  zt_tt where  unix_timestamp(xjrq) between  unix_timestamp('"+ttFirstDay+"') and unix_timestamp('"+ttLastDay+"')");
			if(rs.next()){
				countTT=rs.getInt(1);
			}
			rs=stmt.executeQuery("select count(distinct baseId) from zt_sn where  unix_timestamp(xjrq) between  unix_timestamp('"+aFirstDay+"') and unix_timestamp('"+aLastDay+"')");//室分巡检和A类基站周期相同
			if(rs.next()){
				countSN=rs.getInt(1);
			}
			rs=stmt.executeQuery("select count(distinct baseId) from zt_sw where  unix_timestamp(xjrq) between  unix_timestamp('"+cdFirstDay+"') and unix_timestamp('"+cdLastDay+"')");//室分巡检和A类基站周期相同
			if(rs.next()){
				countSW=rs.getInt(1);
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			DBConn.closeConnection(conn);
			DBConn.closeResultSet(rs);
			DBConn.closeStatement(stmt);
		}
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		req.setAttribute("countA", countA);
		req.setAttribute("leftA", leftA);
		req.setAttribute("countB", countB);
		req.setAttribute("leftB", leftB);	 
		req.setAttribute("countCD", countCD);
		req.setAttribute("leftCD", leftCD);
		req.setAttribute("countTT", countTT);
		req.setAttribute("leftTT", leftTT);
		req.setAttribute("countSN", countSN);
		req.setAttribute("countSW", countSW);
		
 
	  		return "success";
}
}