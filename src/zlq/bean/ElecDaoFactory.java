package zlq.bean;

import zlq.bean.ElecDao;
import zlq.bean.ElecImpl;

public class ElecDaoFactory {
    public static ElecDao getElecDaoInstance(){
    	return new ElecImpl();
    }
}
