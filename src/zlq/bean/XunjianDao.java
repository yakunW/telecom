package zlq.bean;

import java.util.List;

import zlq.bean.Xunjian;
public interface XunjianDao {
	//public List<Xunjian> xjSearch(String baseName,String xjName,String date1,String date2);
	public List<Xunjian> MxxjSearch(String date1,String date2,String xjName,String stationName,String level);
	public List<Xunjian> UnxjSearch(String date1,String date2,String xjName,String stationName,String level);
	public int Getcount(String date1,String date2,String xjName,String stationName,String level);
}
