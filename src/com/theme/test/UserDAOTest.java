package com.theme.test;

import org.junit.Test;

import com.theme.dao.UserDAO;
import com.theme.vo.User;

import junit.framework.TestCase;

public class UserDAOTest extends TestCase{
	@Test
	public void testDAO(){
		UserDAO userdao=new UserDAO();
		User user=new User();
		user=userdao.login(user,"12","11");
		//userdao.update(user, "1111");
		System.out.println(user);
		System.out.println("hhah");
	}

}
