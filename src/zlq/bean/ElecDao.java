package zlq.bean;

import java.util.List;
import zlq.bean.Elec;

public interface ElecDao {
//    public int searchByTime();//
//    public int searchById();//
    public List<Elec> elecSearch(String basename,String checkername,String starttime, String endtime) ;
    public List<Elec> elecSearchBytime(String basename,String checkername,String starttime, String endtime) ;//按时间段查询
    public List<Elec> elecSearchBychecker(String basename,String checkername,String starttime, String endtime) ;//按巡检人员查询
    public List<Elec> elecSearchByBase(String basename,String checkername,String starttime, String endtime);//按基站名称查询
    public void elecInsert(String baseid,String basename,String baserank,String checkername,String lastchecktime, double lastchecknum,String presentchecktime,double presentchecknum,String picname);
//    public void elecdel(int bsid,String date);
}
