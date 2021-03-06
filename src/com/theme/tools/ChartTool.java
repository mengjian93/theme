package com.theme.tools;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chart.vo.PieData;
import com.chart.vo.Series;
import com.chart.vo.Title;
import com.chart.vo.Axis;
import com.theme.dao.ThemeDAO;
import com.theme.vo.Theme;

import net.sf.json.JSONArray;

public class ChartTool {
	public JSONArray toChart(String themeid, String xAxisType,String serType) {
		ThemeDAO dao = new ThemeDAO();
		Theme theme = dao.getOneTheme(themeid);
		List<Integer> data = dao.findCount(themeid);
		List<String> leList = dao.findOpt(themeid);
		Series series = new Series(serType, data);
		Title title = new Title(theme);
		Axis xAxis = new Axis(xAxisType, leList);
		List<PieData> pieData=new ArrayList<PieData>();
		for(int i=0;i<leList.size();i++){
			PieData pie=new PieData();
			pie.setName(leList.get(i));
			pie.setValue(data.get(i).toString());
			pieData.add(pie);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pieData", pieData);
		map.put("series", series);
		map.put("xAxis", xAxis);
		map.put("title", title);
		JSONArray json = JSONArray.fromObject(map);
		System.out.println(json);
		return json;
	}
}
