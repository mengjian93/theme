package com.theme.vo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity(name="tb_theme")
@Table(name="tb_theme")
public class Theme {
	@Id
	@GeneratedValue
	private int id;//id
	@Column(name="theme_name")
	private String theme_name;//主题
	@Column(name="tag")
	private String tag;//是否多选
	@Column(name="deflag")
	private String deflag="0";//删除标记
	public int getId() {
		return id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getDeflag() {
		return deflag;
	}
	public void setDeflag(String deflag) {
		this.deflag = deflag;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTheme_name() {
		return theme_name;
	}
	public void setTheme_name(String theme_name) {
		this.theme_name = theme_name;
	}

}
