package com.theme.dao;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;

import com.theme.imp.base.HibernateSessionFactory;
import com.theme.vo.Theme;

public  class CommDAO {
	/*
	 * 查询单个公共方法
	 */
	@SuppressWarnings("unchecked")
	public static <T> List<T> query(Object o,String tb,List<String> counlm,String tag) throws Exception {
		String sql="select * from"+tb+"  where id="+tag;
		Session session=HibernateSessionFactory.getSession();
		List<T> obj=(List<T>)session.createSQLQuery(sql).addEntity(o.getClass()).list();
		session.close();
		return obj;
	}
    public static void main(String[] args) throws Exception {
    	List<Theme> t1=new ArrayList<Theme>();
    	Theme t=new Theme();
    	t1=CommDAO.query(t,"tb_theme",null,"1");
    	System.out.println(t1.size());
	}
}
