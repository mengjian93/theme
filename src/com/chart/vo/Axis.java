package com.chart.vo;

import java.util.List;

public class Axis {
	private String type;
	private List<String> data;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public Axis(String type, List<String> data) {
		this.data=data;
		this.type=type;
	}
   
}
