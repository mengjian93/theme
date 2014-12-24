package com.theme.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;
import org.theme.dao.UserDAO;
import com.opensymphony.xwork2.ActionSupport;
import com.theme.vo.User;

public class UserAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @return
	 */
	private String loginName;
	private String password;
	private JSONObject result;
	UserDAO dao = new UserDAO();
	User user = new User();

	public String getLoginName() {
		return loginName;
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String login() {
		user = dao.login(user, loginName, password);
		Map<String, String> map = new HashMap<String, String>();
		if (user == null) {
			map.put("name", "error");
			result = JSONObject.fromObject(map);
			System.out.println(result);
			return ERROR;
		}
		map.put("name", "success");
		result = JSONObject.fromObject(map);
		System.out.println(result);
		return SUCCESS;
	}

	public String init() {
		return SUCCESS;
	}
}