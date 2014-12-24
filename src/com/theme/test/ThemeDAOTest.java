package com.theme.test;

import java.util.List;

import org.junit.Test;
import org.theme.dao.ThemeDAO;

import junit.framework.TestCase;

public class ThemeDAOTest extends TestCase{
  @Test
  public void testTheme(){
	  ThemeDAO dao=new ThemeDAO();
	  List<Integer> list=dao.findCount("1");
	  System.out.println(list.get(0));
  }
}
