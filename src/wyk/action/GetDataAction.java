package wyk.action;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import wyk.bean.BaseInspectData;
import wyk.bean.BaseStation;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import dbc.DBConn;

public class GetDataAction {
	String table;
    List<BaseInspectData> bid;
    Circle circle=new Circle();


	
	private  List<BaseInspectData> jsonToBit(String str) {//json转list
		List<BaseInspectData> bid=null;
        Gson gson = new Gson();
        try{            	
            bid = gson.fromJson(str, new TypeToken<List<BaseInspectData>>(){}.getType());
//            for (BaseInspectData p : bid){           	
//                System.out.println("巡检类型: " + p.getXjlx());
//                System.out.println("巡检内容: " + p.getXjnr());
//                System.out.println("巡检数据: " + p.getXjsj());
//            }
            return  bid;
        } 
	    catch (Exception e) {
//             e.printStackTrace();
        }
	    return bid;
    }
	
	
	public void saveData() {
		System.out.println("连接");
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		BaseStation bs=(BaseStation)req.getSession().getAttribute("baseInfo"); //获取session中的基站信息
//		System.out.println(bs);
		 Connection conn=DBConn.getConnection();
	    	PreparedStatement ps=null;
	    	String sqlzt=null;//巡检状态
	    	String sqlyc=null;//异常
	        String str=null;
	        table=req.getParameter("table").toString();
//	        System.out.println(table.length());
	        if(table.equals("1")){//c1
	    		this.saveZt(bs,-1);//有数据上传，就认为是已巡检
//        		System.out.println("c1表");
//        		System.out.println(req.getParameter("1_jfhj").toString());
	        	if((str =req.getParameter("1_jfhj"))!=null){//机房环境
	        		System.out.println("接收数据");
	        		bid=this.jsonToBit(str);
	        		
	    			sqlyc="replace into yichang_jfhj values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("机房照明")||bid.get(i).getXjnr().equals("交流插座检查")||bid.get(i).getXjnr().equals("机房门窗检查")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_jfhj", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
		    			
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	    		else if((str =req.getParameter("1_kt"))!=null){//空调
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_kt values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("空调状态")||bid.get(i).getXjnr().equals("供电线路检查")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_kt", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						  						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	    		else if((str =req.getParameter("1_byq"))!=null){//变压器
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_byq values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("工作状态")||bid.get(i).getXjnr().equals("油面、漏油")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_byq", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    							    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_jlpdx"))!=null){//交流配电箱
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_jlpdx values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("避雷器状态")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_jlpdx", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_jzzsb"))!=null){//基站主设备
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_jzzsb values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("面板告警")||bid.get(i).getXjnr().equals("风扇")||bid.get(i).getXjnr().equals("独立BBU工作状态")||bid.get(i).getXjnr().equals("板卡")||bid.get(i).getXjnr().equals("直放站近端设备工作状态")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_jzzsb", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_qtsb"))!=null){//其他设备
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_qtsb values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("节能设备")||bid.get(i).getXjnr().equals("微波设备")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_qtsb", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_kgdy"))!=null){//开关电源
	            	bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_kgdy values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("风扇状态")||bid.get(i).getXjnr().equals("监控模块")||bid.get(i).getXjnr().equals("交流单元避雷器")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_kgdy", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_jk"))!=null){//监控
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_jk values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("干接点")||bid.get(i).getXjnr().equals("动环")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_jk", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_jdxt"))!=null){//接地系统
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_jdxt values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("接地线缆锈蚀、接触")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_jdxt", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("1_tw"))!=null){//塔桅、天馈线/GPS
	    			bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_tw values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("BTS天线是否倾斜、松动")||bid.get(i).getXjnr().equals("塔桅连接件")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), bs.getLevel(), "yichang_tw", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表1");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	            else if((str=req.getParameter("1_yzwx"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_dbds"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_fdj"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_jlyrx"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_glcssb"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_xxhc"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_swzdy"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_zxj"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_glzx"))!=null){
	            	
	            }
	            else if((str=req.getParameter("1_gzbq"))!=null){
	            	
	            }
	        	
	        	/*存入c1表*/
    			sqlzt="replace into table_c1 values(?,?,?,?,?,curdate())";
    			bid=this.jsonToBit(str);//解析数据
    			try{
					ps=conn.prepareStatement(sqlzt);
    				for(int i=0;i<bid.size();i++){
    					
    					/*检查C1表在本周期内是否已经录入过该条信息*/
    		        	this.clearXJB(bs.getBaseId(), bs.getLevel(), "table_c1", bid.get(i).getXjlx(), bid.get(i).getXjnr());
    		        	
            			ps.setString(1, bs.getBaseId());
            			ps.setString(2, bs.getBaseName());
            			ps.setString(3, bid.get(i).getXjlx());
            			ps.setString(4, bid.get(i).getXjnr());
            			ps.setString(5, bid.get(i).getXjsj());
            			ps.executeUpdate();
    				}      			
    			}
    			catch(Exception e){
//    				e.printStackTrace();
    			}
    			finally{
    				DBConn.closeConnection(conn);
    				DBConn.closePreparedStatement(ps);
    			}
	        }
	        else if(table.equals("2")){//c2
//	        	System.out.println("c2");
		        	this.saveZt(bs,1);        
	        	if((str =req.getParameter("2_tt"))!=null){//塔体
//	        		System.out.println(str);
	        		bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_tt values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("铁塔局部弯曲度是否正常")||bid.get(i).getXjnr().equals("铁塔整体垂直度是否正常")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), "TT", "yichang_tt", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表2");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	           
	            else if((str =req.getParameter("2_xdcjc"))!=null){//蓄电池检查
	            	bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_xdcjc values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("电池壳体有无渗漏和变形")||bid.get(i).getXjnr().equals("连接处有无松动、腐蚀现象")||bid.get(i).getXjnr().equals("极柱、安全阀周围有无酸雾、酸液逸出")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), "TT", "yichang_xdcjc", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表2");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
	            else if((str =req.getParameter("2_td"))!=null){//塔灯
	            	bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_td values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("塔灯是否正常")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), "TT", "yichang_td", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "C网基站及配套设备作业计划记录表2");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
                else if((str =req.getParameter("2_xdccsdcz1"))!=null){//蓄电池测试电池组1
	    			
	    		}
                else if((str =req.getParameter("2_xdccsdcz2"))!=null){//蓄电池测试电池组2
	    			
	    		}
                else if((str =req.getParameter("2_jg"))!=null){//本次解决问题
	    			
	    		}
                else if((str =req.getParameter("2_tj"))!=null){//塔基
	    			
	    		}
	        	
	        	/*存入c2表*/
	        	sqlzt="replace into table_c2 values(?,?,?,?,?,curdate())";
    			bid=this.jsonToBit(str);//解析数据
    			try{
					ps=conn.prepareStatement(sqlzt);
    				for(int i=0;i<bid.size();i++){
    					
    					/*检查C2表在本周期内是否已经录入过该条信息*/
    		        	this.clearXJB(bs.getBaseId(), "TT", "table_c2", bid.get(i).getXjlx(), bid.get(i).getXjnr());
    		        	
            			ps.setString(1, bs.getBaseId());
            			ps.setString(2, bs.getBaseName());
            			ps.setString(3, bid.get(i).getXjlx());
            			ps.setString(4, bid.get(i).getXjnr());
            			ps.setString(5, bid.get(i).getXjsj());
            			ps.executeUpdate();
    				}      			
    			}
    			catch(Exception e){
//    				e.printStackTrace();
    			}
    			finally{
    				DBConn.closeConnection(conn);
    				DBConn.closePreparedStatement(ps);
    			}
	        }
	        else if(table.equals("3")){//室分
	        	this.saveZt(bs,-1);	
	        	if((str =req.getParameter("3_rru"))!=null){//rru
	        	
	        	}
                else if((str =req.getParameter("3_gxzfz"))!=null){//光纤直放站
	    			
	    		}
                else if((str =req.getParameter("3_gf"))!=null){//干放
	    			
	    		}
	        	
	        	sqlzt="replace into table_sn values(?,?,?,?,?,curdate())";
    			bid=this.jsonToBit(str);//解析数据
    			try{
					ps=conn.prepareStatement(sqlzt);
    				for(int i=0;i<bid.size();i++){
    					
    					/*检查室内表在本周期内是否已经录入过该条信息*/
    		        	this.clearXJB(bs.getBaseId(), "SN", "table_sn", bid.get(i).getXjlx(), bid.get(i).getXjnr());
    		        	
    					ps.setString(1, bs.getBaseId());
            			ps.setString(2, bs.getBaseName());
            			ps.setString(3, bid.get(i).getXjlx());
            			ps.setString(4, bid.get(i).getXjnr());
            			ps.setString(5, bid.get(i).getXjsj());
            			ps.executeUpdate();
    				}      			
    			}
    			catch(Exception e){
//    				e.printStackTrace();
    			}
    			finally{
    				DBConn.closeConnection(conn);
    				DBConn.closePreparedStatement(ps);
    			}
	        }
	        else if(table.equals("4")){//室外
	        	this.saveZt(bs,-1);
	        	if((str =req.getParameter("4_sbjc"))!=null){//设备检查
	        		bid=this.jsonToBit(str);
	    			sqlyc="replace into yichang_sbjc values(?,?,?,?,?,?,?,curdate(),?)";
	    			try{
	    				ps=conn.prepareStatement(sqlyc);
	    				for(int i=0;i<bid.size();i++){
	    					if(bid.get(i).getXjnr().equals("设备运行状态是否正常")||bid.get(i).getXjnr().equals("监控模块是否正常运行")||bid.get(i).getXjnr().equals("电源设备（整流器、蓄电池）是否完好")||bid.get(i).getXjnr().equals("传输设备是否完好")||bid.get(i).getXjnr().equals("室外天馈的外观检查")){
	    						//检查异常表中是否在本周期内已录入过该条异常信息
	    						this.clearYCB(bs.getBaseId(), "SW", "yichang_sbjc", bid.get(i).getXjlx(), bid.get(i).getXjnr());
	    						
	    						ps.setString(1, bs.getBaseId());
				    			ps.setString(2, bs.getBaseName());
				    			ps.setString(3, bs.getLevel());
				    			ps.setString(4, req.getSession().getAttribute("xjry").toString());
				    			ps.setString(5, bid.get(i).getXjlx());
				    			ps.setString(6, bid.get(i).getXjnr());
				    			ps.setString(7, bid.get(i).getXjsj());
				    			ps.setString(8, "室外直放站（拉远RRU）巡检表");
				    			ps.executeUpdate();
	    					}
	    				}
	    			}
	    			catch(Exception e){
//	    				e.printStackTrace();
	    			}
	    		}
                else if((str =req.getParameter("4_sbxx"))!=null){//设备信息
	    			
	    		}
                else if((str =req.getParameter("4_yxhj"))!=null){//运行环境
	    			
	    		}
                else if((str =req.getParameter("4_xxhc"))!=null){//信息核查
	    			
	    		}
                else if((str =req.getParameter("4_wywx"))!=null){//物业维系
	    			
	    		}
                else if((str =req.getParameter("4_jg"))!=null){//结果
	    			
	    		}
	        	/*存入sw表*/
	        	sqlzt="replace into table_sw values(?,?,?,?,?,curdate())";
    			bid=this.jsonToBit(str);//解析数据
    			try{
					ps=conn.prepareStatement(sqlzt);
    				for(int i=0;i<bid.size();i++){

    					/*检查室外表在本周期内是否已经录入过该条信息*/
    		        	this.clearXJB(bs.getBaseId(), "SW", "table_sw", bid.get(i).getXjlx(), bid.get(i).getXjnr());
    		        	
    					ps.setString(1, bs.getBaseId());
            			ps.setString(2, bs.getBaseName());
            			ps.setString(3, bid.get(i).getXjlx());
            			ps.setString(4, bid.get(i).getXjnr());
            			ps.setString(5, bid.get(i).getXjsj());
            			ps.executeUpdate();
    				}      			
    			}
    			catch(Exception e){
    				e.printStackTrace();
    			}
    			finally{
    				DBConn.closeConnection(conn);
    				DBConn.closePreparedStatement(ps);
    			}
	        }
	}



	public void saveZt(BaseStation bs,int type){//把上传的信息存入状态表
		HttpServletRequest req=(HttpServletRequest)ServletActionContext.getRequest();
		HttpSession session=(HttpSession)req.getSession();
		 Connection conn=DBConn.getConnection();
	    	PreparedStatement ps=null;
	    	String sql=null;
//	    	System.out.println("type   "+type);
//	    	System.out.println("category   "+bs.getCategory());
	    if(type==1){//铁塔
//	    	System.out.println("状态铁塔");
	    	this.clearZTB(1, bs.getLevel(), bs.getBaseId()); //检查铁塔在本周期内是否已经巡检过
	    	
	    	sql="replace into zt_tt values(?,?,?,?,curdate())";
	    }
	    else{//不是铁塔
	    	if(bs.getCategory()==0){//基站
				if(bs.getLevel().equals("A")){
					this.clearZTB(2, "A", bs.getBaseId()); //检查A类基站在本周期内是否已经巡检过
					
					sql="replace into zt_a values(?,?,?,?,curdate())";
				}
				else if(bs.getLevel().equals("B")){
					this.clearZTB(2, "B", bs.getBaseId()); //检查B类基站在本周期内是否已经巡检过
					
					sql="replace into zt_b values(?,?,?,?,curdate())";
				}
				else if(bs.getLevel().equals("C")||bs.getLevel().equals("D")){
					this.clearZTB(2, bs.getLevel(), bs.getBaseId()); //检查C/D类基站在本周期内是否已经巡检过
					
					sql="replace into zt_cd values(?,?,?,?,curdate())";
				}	
			}
			else if(bs.getCategory()==1){//室分
				this.clearZTB(3, bs.getLevel(), bs.getBaseId()); //检查室分在本周期内是否已经巡检过
				
				sql="replace into zt_sn values(?,?,?,?,curdate())";
			}
			else if(bs.getCategory()==2){//室外
//				System.out.println("室外");
				this.clearZTB(4, bs.getLevel(), bs.getBaseId()); //检查室分在本周期内是否已经巡检过
				
				sql="replace into zt_sw values(?,?,?,?,curdate())";
			}
	    }
	
		try{
			ps=conn.prepareStatement(sql);
			ps.setString(1, bs.getBaseId());
			ps.setString(2, bs.getBaseName());
			ps.setString(3, bs.getLevel());
			ps.setString(4, session.getAttribute("xjry").toString());
			ps.executeUpdate();
		}
		catch(Exception e){
//			e.printStackTrace();
		}
		finally{
			DBConn.closeConnection(conn);
			DBConn.closePreparedStatement(ps);
		}
	}
	
	
	/****
	 * 检查巡检状态表(zt_a,zt_b.....)在本周期内是否已经有过数据录入
	 * @param kindId:铁塔1/基站2/室分3/室外4
	 * @param type:基站分类(A/B/C/D)，只有在kindID是2时才有效
	 * @param baseId:基站号
	 */
	public void clearZTB(int kindId,String type,String baseId)
	{
		String lastDate = null;
		String beginDay = null;
		String endDay   = null;
		String table    = null;
		int    result   = 0;
        Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		switch (kindId) {
			case 1://铁塔
				beginDay = circle.ttFirstDay;
				endDay  = circle.ttLastDay;
				table    = "zt_tt";
				break;
			case 2://基站
				switch (type) {
				case "A":
					beginDay = circle.aFirstDay;
					endDay  = circle.aLastDay;
					table    = "zt_a";
					break;
				case "B":
					beginDay = circle.bFirstDay;
					endDay  = circle.bLastDay;
					table    = "zt_b";
					break;
				case "C":
					beginDay = circle.cdFirstDay;
					endDay  = circle.cdLastDay;
					table    = "zt_cd";
					break;
				case "D":
					beginDay = circle.cdFirstDay;
					endDay  = circle.cdLastDay;
					table    = "zt_cd";
					break;

				default:
					break;
			}
				break;
			case 3://室内
				beginDay = circle.snFirstDay;
				endDay  = circle.snLastDay;
				table    = "zt_sn";
				break;
			case 4://室外
				beginDay = circle.swFirstDay;
				endDay  = circle.swLastDay;
				table    = "zt_sw";
				break;

			default:
				break;
		}
		
//		System.out.println("本次巡检周期开始时间："+beginDay+",结束时间："+endDay);	
		String sqls="select * from "+table+" where baseId=? and unix_timestamp(xjrq) between  unix_timestamp('"+beginDay+"') and unix_timestamp('"+endDay+"') ";
//		System.out.println(sqls);	
		try{
			ps=conn.prepareStatement(sqls);
			ps.setString(1, baseId);
			rs=ps.executeQuery();
			while(rs.next()){
//	        	System.out.println(rs.getString(1));
//	        	System.out.println(rs.getString(2));
//	        	System.out.println(rs.getString(3));
//	        	System.out.println(rs.getString(4));
//	        	System.out.println(rs.getString(5));
	        	lastDate = rs.getString(5);
			}			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(lastDate!=null)
		{
			String sqld="delete from "+table+" where baseId=? and xjrq=?";
			try {
				ps=conn.prepareStatement(sqld);
				ps.setString(1, baseId);
				ps.setString(2, lastDate);
				result=ps.executeUpdate();
//				System.out.println("执行结果是："+result);			
//				if(result>0)
//					System.out.println("该条数据已成功删除！");
//				else
//					System.out.println("数据删除失败！");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		DBConn.closeConnection(conn);
		DBConn.closePreparedStatement(ps);
		DBConn.closeResultSet(rs);
		
		//return lastDate;	
	}

	/****
	 * 检查异常表在本周期内是否已经有过数据录入
	 * @param baseId 基站编号
	 * @param level  基站类型：A/B/C/D/TT/SN/SW
	 * @param table  异常表名："yichang_****"
	 * @param xjlx   巡检类型
	 * @param xjnr   巡检内容
	 */
	public void clearYCB(String baseId,String level, String table,String xjlx, String xjnr)
	{
		String lastDate = null;
		String beginDay = null;
		String endDay   = null;
		int    result   = 0;
        Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		switch (level) {
		case "A":
			beginDay = circle.aFirstDay;
			endDay  = circle.aLastDay;
			break;
		case "B":
			beginDay = circle.bFirstDay;
			endDay  = circle.bLastDay;
			break;
		case "C":
			beginDay = circle.cdFirstDay;
			endDay  = circle.cdLastDay;
			break;
		case "D":
			beginDay = circle.cdFirstDay;
			endDay  = circle.cdLastDay;
			break;
		case "TT":
			beginDay = circle.ttFirstDay;
			endDay  = circle.ttLastDay;
			break;
		case "SN":
			beginDay = circle.snFirstDay;
			endDay  = circle.snLastDay;
			break;
		case "SW":
			beginDay = circle.swFirstDay;
			endDay  = circle.swLastDay;
			break;
		default:
			beginDay = circle.swFirstDay;
			endDay  = circle.swLastDay;
			break;
		}

		
//		System.out.println("本次巡检周期开始时间："+beginDay+",结束时间："+endDay);	
		String sqls="select * from "+table+" where baseId=? and yclx=? and yccs=? and unix_timestamp(xjrq) between  unix_timestamp('"+beginDay+"') and unix_timestamp('"+endDay+"') ";
//		System.out.println(sqls);	
		try{
			ps=conn.prepareStatement(sqls);
			ps.setString(1, baseId);
			ps.setString(2, xjlx);
			ps.setString(3, xjnr);
			rs=ps.executeQuery();
			while(rs.next()){
//	        	System.out.println(rs.getString(1));
//	        	System.out.println(rs.getString(2));
//	        	System.out.println(rs.getString(3));
//	        	System.out.println(rs.getString(4));
//	        	System.out.println(rs.getString(5));
//	        	System.out.println(rs.getString(6));
//	        	System.out.println(rs.getString(7));
//	        	System.out.println(rs.getString(8));
//	        	System.out.println(rs.getString(9));
	        	lastDate = rs.getString(8);
			}			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(lastDate!=null)//本周期内已有过巡检
		{
			String sqld="delete from "+table+" where baseId=? and yccs=? and xjrq=?";
			try {
				ps=conn.prepareStatement(sqld);
				ps.setString(1, baseId);
				ps.setString(2, xjnr);
				ps.setString(3, lastDate);
				result=ps.executeUpdate();
//				System.out.println("执行结果是："+result);			
//				if(result>0)
//					System.out.println("该条数据已成功删除！");
//				else
//					System.out.println("数据删除失败！");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		DBConn.closeConnection(conn);
		DBConn.closePreparedStatement(ps);
		DBConn.closeResultSet(rs);
		
		//return lastDate;	
	}
	
	/****
	 * 检查巡检表在本周期内是否已经有过数据录入
	 * @param baseId 基站编号
	 * @param level  基站类型：A/B/C/D/TT/SN/SW
	 * @param table  巡检表名：table_c1,table_c2,table_sn,table_sw
	 * @param xjlx   异常类型
	 * @param xjnr   异常参数
	 */
	public void clearXJB(String baseId,String level, String table,String xjlx, String xjnr)
	{//C2表对应铁塔，周期是半年？？C1表对应基站，按照基站等级确定周期？？
		String lastDate = null;
		String beginDay = null;
		String endDay   = null;
		int    result   = 0;
        Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement ps=null;
		
		switch (level) {
		case "A":
			beginDay = circle.aFirstDay;
			endDay  = circle.aLastDay;
			break;
		case "B":
			beginDay = circle.bFirstDay;
			endDay  = circle.bLastDay;
			break;
		case "C":
			beginDay = circle.cdFirstDay;
			endDay  = circle.cdLastDay;
			break;
		case "D":
			beginDay = circle.cdFirstDay;
			endDay  = circle.cdLastDay;
			break;
		case "TT":
			beginDay = circle.ttFirstDay;
			endDay  = circle.ttLastDay;
			break;
		case "SN":
			beginDay = circle.snFirstDay;
			endDay  = circle.snLastDay;
			break;	
		case "SW":
			beginDay = circle.swFirstDay;
			endDay  = circle.swLastDay;
			break;
		default:
			beginDay = circle.swFirstDay;
			endDay  = circle.swLastDay;
			break;
		}

		
//		System.out.println("本次巡检周期开始时间："+beginDay+",结束时间："+endDay);	
		String sqls="select * from "+table+" where baseId=? and xjlx=? and xjnr=? and unix_timestamp(xjrq) between  unix_timestamp('"+beginDay+"') and unix_timestamp('"+endDay+"') ";
//		System.out.println(sqls);	
		try{
			ps=conn.prepareStatement(sqls);
			ps.setString(1, baseId);
			ps.setString(2, xjlx);
			ps.setString(3, xjnr);
			rs=ps.executeQuery();
			while(rs.next()){
//	        	System.out.println(rs.getString(1));
//	        	System.out.println(rs.getString(2));
//	        	System.out.println(rs.getString(3));
//	        	System.out.println(rs.getString(4));
//	        	System.out.println(rs.getString(5));
//	        	System.out.println(rs.getString(6));
	        	lastDate = rs.getString(6);
			}			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		if(lastDate!=null)//本周期内已有过巡检
		{
			String sqld="delete from "+table+" where baseId=? and xjnr=? and xjrq=?";
			try {
				ps=conn.prepareStatement(sqld);
				ps.setString(1, baseId);
				ps.setString(2, xjnr);
				ps.setString(3, lastDate);
				result=ps.executeUpdate();
//				System.out.println("执行结果是："+result);			
//				if(result>0)
//					System.out.println("该条数据已成功删除！");
//				else
//					System.out.println("数据删除失败！");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		DBConn.closeConnection(conn);
		DBConn.closePreparedStatement(ps);
		DBConn.closeResultSet(rs);
		
		//return lastDate;	
	}
	

}
