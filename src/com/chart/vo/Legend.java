package com.chart.vo;

import java.util.List;

public class Legend {
	private List<String> data;

	public List<String> getData() {
		return data;
	}
	public void setData(List<String> data) {
		this.data = data;
	}
	public Legend(List<String> data) {
		this.data=data;
	}
}
