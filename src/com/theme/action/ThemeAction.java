package com.theme.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.theme.dao.ThemeDAO;
import com.theme.vo.Options;
import com.theme.vo.Theme;

public class ThemeAction extends ActionSupport {// 主题相关页面跳转action

	private static final long serialVersionUID = 1L;
	private String id;
	private JSONObject data;// json对象，与前台交互
	ThemeDAO dao = new ThemeDAO();
	List<String> option_name = new ArrayList<String>();
	private String theme_name;
	private String tag;

	public String getTheme_name() {
		return theme_name;
	}

	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public List<String> getOption_name() {
		return option_name;
	}

	public void setOption_name(List<String> option_name) {
		this.option_name = option_name;
	}

	public JSONObject getData() {
		return data;
	}

	public void setData(JSONObject data) {
		this.data = data;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	// 查询所有主题
	public String getTheme() {
		List<Theme> list1 = dao.allTheme();
		List<Theme> list = new ArrayList<Theme>();
		for (Theme t : list1) {
			if (t.getTag().equals("1")) {
				t.setTag("是");
			} else {
				t.setTag("否");
			}
			list.add(t);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", list);
		data = JSONObject.fromObject(map);
		System.out.println(data);
		return SUCCESS;
	}

	public String save() {
		List<Options> listOp = new ArrayList<Options>();
		for (int i = 0; i < option_name.size(); i++) {
			Options o = new Options();
			o.setOption_name(option_name.get(i));
			listOp.add(o);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		if (theme_name.equals("") || listOp.size() == 0) {
			map.put("name", "error");
			return ERROR;
		}
		map.put("name", "success");
		dao.saveTheme(tag, theme_name, listOp);
		data = JSONObject.fromObject(map);
		return SUCCESS;
	}


	public String init() {
		return SUCCESS;
	}

	public String updateOp() {
		option_name = dao.findOpt(id);
		Theme t = dao.getOneTheme(id);
		theme_name = t.getTheme_name();
		tag = t.getTag();
		id = t.getId() + "";
		return SUCCESS;
	}

	public String update() {
		dao.updateTheme(id, tag, theme_name, option_name);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "success");
		data = JSONObject.fromObject(map);
		return SUCCESS;
	}

	public String delete() {
		dao.delete(id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "success");
		data = JSONObject.fromObject(map);
		return SUCCESS;
	}

}
