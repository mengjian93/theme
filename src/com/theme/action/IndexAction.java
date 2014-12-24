package com.theme.action;

import java.util.List;

import org.theme.dao.ThemeDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.theme.vo.Theme;

public class IndexAction extends ActionSupport{
	ThemeDAO dao=new ThemeDAO();
	private List<Theme> list;
	public List<Theme> getList() {
		return list;
	}
	public void setList(List<Theme> list) {
		this.list = list;
	}
	private static final long serialVersionUID = 1L;
	public String init() {
	    list=dao.allTheme();
	    System.out.println(list.size());
		return SUCCESS;
	}
}
