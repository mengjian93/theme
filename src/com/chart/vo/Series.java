package com.chart.vo;

import java.util.List;

public class Series {
	private List<Integer> data;
	private String type;
	

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}


	public List<Integer> getData() {
		return data;
	}

	public void setData(List<Integer> data) {
		this.data = data;
	}

	public Series(String type, List<Integer> data) {
		
		this.data=data;
		this.type=type;
	}
}
