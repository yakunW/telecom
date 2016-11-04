package wyk.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Circle {
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
    
	Circle(){
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar ca=Calendar.getInstance();//获取当前日期 
		Calendar today=Calendar.getInstance();
//		System.out.println("今天是"+today);
		try{
			/*获取a类基站本次巡检的起始日期和结束日期*/
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			aFirstDay=format.format(ca.getTime());
			ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
			aLastDay=format.format(ca.getTime());		   
			/*获取b类基站本次巡检的起始日期和结束日期*/
			ca=Calendar.getInstance();
			ca.set(Calendar.DAY_OF_MONTH,1);//设置为1号,当前日期既为本月第一天 
			int monthb=ca.get(Calendar.MONTH)+1;//获取本月的月份
			if(monthb%2==1){//本月为巡检周期的第一个月
				bFirstDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH,1);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				bLastDay=format.format(ca.getTime());
			
			}
			else if(monthb%2==0){//本月为巡检周期的第二个月
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				bLastDay=format.format(ca.getTime());	
				ca.add(Calendar.MONTH , -1);//减一个月
				ca.set(Calendar.DAY_OF_MONTH, 1);
				bFirstDay=format.format(ca.getTime());
			
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
			   
			}
			else if(monthcd%3==1){//本月是巡检周期的第一个月
				cdFirstDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH, 2);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				cdLastDay=format.format(ca.getTime());
			   
			}
			else if(monthcd%3==2){//本月是巡检周期的第二个月 				
				ca.add(Calendar.MONTH, 1);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				cdLastDay=format.format(ca.getTime());
				ca.add(Calendar.MONTH, -2);
				ca.set(Calendar.DAY_OF_MONTH, 1);
				cdFirstDay=format.format(ca.getTime());
			  
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
			   
			}
			else{
				ca.set(Calendar.MONTH, 5);
				ttFirstDay=format.format(ca.getTime());
				ca.set(Calendar.MONTH, 11);
				ca.set(Calendar.DAY_OF_MONTH,ca.getActualMaximum(Calendar.DAY_OF_MONTH));
				ttLastDay=format.format(ca.getTime());	
			   
			}
			/*获取室内本次巡检的起始日期和结束日期（同a类基站）*/
			snFirstDay=aFirstDay;//
			snLastDay=aLastDay;
			/*获取室分本次巡检的起始日期和结束日期（同c/d类基站）*/
			swFirstDay=cdFirstDay;
			swLastDay=cdLastDay;
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}
