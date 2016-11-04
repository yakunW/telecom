package cn.edu.bupt.anm.dao;

import java.util.List;

public interface Dao<T> {
//	//查找单个记录
//	public T find(String sql);
	public List<T> list(String sql);
	//获取记录总数
	public int recordCount(String sql) ;
	//添加
	public int add(T object);
	//修改
	public int modify(T object);
	//重置密码
	public int resetPassword(int id);
	//删除
	public int del(String sql,int id);
}
