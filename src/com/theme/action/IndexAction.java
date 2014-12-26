package com.theme.action;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.theme.dao.ThemeDAO;

import com.opensymphony.xwork2.ActionSupport;
import com.theme.vo.Options;
import com.theme.vo.Theme;

public class IndexAction extends ActionSupport{
	ThemeDAO dao=new ThemeDAO();
	private List<Theme> list;
	private List<Options> optList;
	private Theme theme;
    private String id;
    public JSONObject resu;
	public JSONObject getResu() {
		return resu;
	}
	public void setResu(JSONObject resu) {
		this.resu = resu;
	}
	public List<Options> getOptList() {
		return optList;
	}
	public void setOptList(List<Options> optList) {
		this.optList = optList;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Theme getTheme() {
		return theme;
	}
	public void setTheme(Theme theme) {
		this.theme = theme;
	}
	public List<Theme> getList() {
		return list;
	}
	public void setList(List<Theme> list) {
		this.list = list;
	}
	private static final long serialVersionUID = 1L;
	public String init() {
	    list=dao.allTheme();
		return SUCCESS;
	}
	public String count() {
		theme=dao.getOneTheme(id);
		optList=dao.queryOpt(id);
		return SUCCESS;
	}
	public String getCount() {
		id.split(",");
		List<String> opt=Arrays.asList(id.split(","));
		dao.countAll(opt);
		String ip=ServletActionContext.getRequest().getRemoteAddr();
		System.out.println(ip);
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("result", "success");
		resu=JSONObject.fromObject(map);
		return SUCCESS;
		
	}
}
