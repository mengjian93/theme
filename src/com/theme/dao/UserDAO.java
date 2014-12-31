package com.theme.dao;

//import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.theme.imp.base.HibernateSessionFactory;
import com.theme.vo.User;

public class UserDAO {
	Session session = null;

	// 登录操作，根据密码和登录名查询用户
	public User login(User user,String loginName,String password) {
		session = HibernateSessionFactory.getSession();
		Criteria c = session.createCriteria(user.getClass());
		c.add(Restrictions.eq("loginName", loginName));
		c.add(Restrictions.eq("password", password));
		int l=c.list().size();
		if (l==1) {
			user=(User) c.list().get(0);
			session.close();
			return user;
		}
		session.close();
		return null;
	}
   //修改登录密码
	public void update(User user, String password) {
		session = HibernateSessionFactory.getSession();
		Transaction tc=session.beginTransaction();
		user.setPassword(password);
		session.update(user);
		System.out.println("成功");
		tc.commit();
		session.close();
	}

}
