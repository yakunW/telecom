package zlq.bean;

import zlq.bean.XunjianDao;
import zlq.bean.XunjianDaoImpl;

public class XunjianDaoFactory {

	public static XunjianDao getXunjianDao(){
		return new XunjianDaoImpl();
	}
}
