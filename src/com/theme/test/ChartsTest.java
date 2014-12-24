package com.theme.test;


import org.junit.Test;

import com.constant.Type;
import com.theme.tools.ChartTool;

import junit.framework.TestCase;

public class ChartsTest extends TestCase{
	@Test
    public void testCharts(){
//		Theme  t1=new Theme();
//		t1.setTheme_name("傻不傻");
//		Title t=new Title(t1);
//		System.out.println(JSONObject.fromObject(t));
		/*ChartTool tool=new ChartTool();
		List<String> data=new ArrayList<String>();
		List<Integer> data1=new ArrayList<Integer>();
		data.add("1");
		data1=new ThemeDAO().findCount("1");
		Legend legend=new Legend(data);
		Series series=new Series("c", data1);
		Theme t=new Theme();
		t.setTheme_name("666");
		Title title=new Title(t);
		Axis axis=new Axis("6", data);*/
		ChartTool chartTool=new ChartTool();
		chartTool.toChart("8", Type.CHART_TYPE_CATEGORY,Type.CHART_TYPE_BAR);
    }

}
