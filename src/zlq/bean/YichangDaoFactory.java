package zlq.bean;

import zlq.bean.YichangDao;
//import zlq.bean.YichangDaoImpl;

public class YichangDaoFactory {

	public static YichangDao getYichangDao(){
		return new YichangDaoImpl();
	}
	
}
