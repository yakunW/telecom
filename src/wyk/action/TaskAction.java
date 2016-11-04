package wyk.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import wyk.bean.Task;
import dbc.DBConn;

public class TaskAction {
	
	List<Task> taskList;
	Task task;
	public String getTask(){
		 Connection conn=DBConn.getConnection();
	    	ResultSet rs=null;
	    	PreparedStatement ps=null;
	    	String sql="select * from task";
	    	taskList=new ArrayList<Task>();
	    	try{
	    		ps=conn.prepareStatement(sql);
	    		rs=ps.executeQuery();
	    		while(rs.next()){
	    			task=new Task();
	    			task.setStationName(rs.getString("stationName"));
	    			task.setNames(rs.getString("names"));
	    			task.setLeader(rs.getString("leader"));
	    			task.setAreas(rs.getString("areas"));
	    			taskList.add(task);
	    		}
	    	}
	    	catch(Exception e){
	    		e.printStackTrace();
	    	}
	    	finally{
				DBConn.closeConnection(conn);
				DBConn.closePreparedStatement(ps);
				DBConn.closeResultSet(rs);
			}
			HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
			req.setAttribute("taskList", taskList);
	    	return "success";
	}
}
