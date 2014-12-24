package com.theme.vo;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity(name="tb_options")
public class Options {
	@Id
	@GeneratedValue
	private int id;//id
	private String option_name;//选项
	@ManyToOne(targetEntity=Theme.class)  
    @JoinColumn(name="themeId")  
    private Theme themeId;  
	private int count=0;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOption_name() {
		return option_name;
	}
	public void setOption_name(String option_name) {
		this.option_name = option_name;
	}
	public Theme getThemeId() {
		return themeId;
	}
	public void setThemeId(Theme themeId) {
		this.themeId = themeId;
	}
}
