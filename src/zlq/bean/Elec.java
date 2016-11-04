package zlq.bean;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.math.*;

public class Elec {
	private String baseid;
    private String basename;
    private String baserank;
    private String checkername;
    private String lastchecktime;
    private double lastchecknum;
    private String presentchecktime;
    private double presentchecknum;
    private String picname;
    private long daysBetween;
	private String avgStr;
    private double power;
    
	public String getBaseid() {
		return baseid;
	}
	public void setBaseid(String baseid) {
		this.baseid = baseid;
	}
	
	public String getBasename() {
		return basename;
	}	
	public void setBasename(String basename) {
		this.basename = basename;
	}
	
	public String getBaserank() {
		return baserank;
	}	
	public void setBaserank(String baserank) {
		this.baserank = baserank;
	}
	
	public String getCheckername() {
		return checkername;
	}
	public void setCheckername(String checkername) {
		this.checkername = checkername;
	}
	
	public String getLastchecktime() {
		return lastchecktime;
	}
	public void setLastchecktime(String lastchecktime) {
		this.lastchecktime = lastchecktime;
	}
	
	public double getLastchecknum() {
		return lastchecknum;
	}
	public void setLastchecknum(double lastchecknum) {
		this.lastchecknum = lastchecknum;
	}
	
	public String getPresentchecktime() {
		return presentchecktime;
	}
	public void setPresentchecktime(String presentchecktime) {
		this.presentchecktime = presentchecktime;
	}
	
	public double getPresentchecknum() {
		return presentchecknum;
	}
	public void setPresentchecknum(double presentchecknum) {
		this.presentchecknum = presentchecknum;
	}
	
	public String getPicname() {
		return picname;
	}
	public void setPicname(String picname) {
		this.picname = picname;
	}
    
	public long getDaysBetween() {
		return daysBetween;
	}
	public void setDaysBetween(String presentchecktime,String lastchecktime) {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dt1 = sdf.parse(presentchecktime);
			Date dt2 = sdf.parse(lastchecktime);
			long daysBetween = (dt1.getTime() - dt2.getTime() + 1000000)/ (3600 * 24 * 1000);
			this.daysBetween = daysBetween;
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public String getAvgStr() {
		return avgStr;
	}
	public void setAvgStr(double lastchecknum, double presentchecknum,String presentchecktime,String lastchecktime) {
		try {
			BigDecimal b1 = new BigDecimal(Double.toString(presentchecknum));
		    BigDecimal b2 = new BigDecimal(Double.toString(lastchecknum));
		    
		    double n1=b1.doubleValue();
   		    double n2=b2.doubleValue();
   		    double power=0;
   		    int k=10;
   		    try{
			    if(n1<n2)
		        {
				    while(n2/10>=1){
					    n2=n2/10;
					    k=k*10;
				    }		   
				    power=b1.doubleValue()+k-b2.doubleValue();
		        }
		        else
		        	{power=b1.subtract(b2).doubleValue();}
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
			
		    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dt1 = sdf.parse(presentchecktime);
			Date dt2 = null;
			long daysBetween = 0;
			if(lastchecktime!=null){
				dt2 = sdf.parse(lastchecktime);
				daysBetween = (dt1.getTime() - dt2.getTime() + 1000000)/ (3600 * 24 * 1000);
			}
			else{
				daysBetween = (dt1.getTime() + 1000000)/ (3600 * 24 * 1000);
			}
			if(daysBetween==0)
			{
				this.avgStr="0";
			}
			else
			{
				double avg=power/(double)daysBetween;
		        DecimalFormat df1 = new DecimalFormat("0.000");
		        String avgStr=df1.format(avg);
		        this.avgStr = avgStr;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}
	
	public double getPower() {
		return power;
	}
	public void setPower(double lastchecknum, double presentchecknum) {
		 BigDecimal b1 = new BigDecimal(Double.toString(presentchecknum));
	     BigDecimal b2 = new BigDecimal(Double.toString(lastchecknum));
	     double n1=b1.doubleValue();
		 double n2=b2.doubleValue();
		 int k=10;
		 try{
			 if(n1<n2)
		     {
			    while(n2/10>=1){
				    n2=n2/10;
				    k=k*10;
			    }		   
		        this.power=b1.doubleValue()+k-b2.doubleValue();
		     }
		     else
		        {this.power=b1.subtract(b2).doubleValue();}
		 }catch(Exception e){
			 e.printStackTrace();
		 }
	}
}
