package com.theme.action;


import net.sf.json.JSONArray;
import com.constant.Type;
import com.opensymphony.xwork2.ActionSupport;
import com.theme.tools.ChartTool;

public class ChartsAction extends ActionSupport {

	/**
	 * 
	 */
	private JSONArray data;
	public JSONArray getData() {
		return data;
	}

	public void setData(JSONArray data) {
		this.data = data;
	}



	private String id;
	ChartTool tool=new ChartTool();
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	

	private static final long serialVersionUID = 1L;

	public String initChart() {
		
		return SUCCESS;
	}
	public String showCharts() {
        data=tool.toChart(id, Type.CHART_TYPE_CATEGORY, Type.CHART_TYPE_BAR);		
		System.out.println(data);
        return SUCCESS;
	}
	
	
}
