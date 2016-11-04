package zlq.bean;

import java.util.List;

import zlq.bean.Yichang;

public interface YichangDao {

	public List<Yichang> ycSearch(String stationName,String ycName,String level,String period1,String period2);
	public List<Yichang> ycSearchMX(String stationName,String ycName,String level,String period1,String period2);
}
