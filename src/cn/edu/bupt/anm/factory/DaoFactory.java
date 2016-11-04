package cn.edu.bupt.anm.factory;

import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.dao.impl.BaseDaoImpl;
import cn.edu.bupt.anm.dao.impl.NewsDaoImpl;
import cn.edu.bupt.anm.dao.impl.StaffDaoImpl;
import cn.edu.bupt.anm.dao.impl.TaskDaoImpl;
import cn.edu.bupt.anm.dao.impl.LogsDaoImpl;

public class DaoFactory {
	public static Dao getStaffDaoInstance(){
		return new StaffDaoImpl();
	}
	public static Dao getTaskDaoInstance(){
		return new TaskDaoImpl();
	}
	public static Dao getBaseDaoInstance(){
		return new BaseDaoImpl();
	}
	public static Dao getNewsDaoInstance(){
		return new NewsDaoImpl();
	}public DaoFactory() {
		// TODO Auto-generated constructor stub
	}
	public static Dao getLogsDaoInstance(){
		return new LogsDaoImpl();
	}
}
