package com.chart.vo;

import com.theme.vo.Theme;

public class Title {
	private String text;

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Title(Theme t) {
      this.text=t.getTheme_name();
	}

}
