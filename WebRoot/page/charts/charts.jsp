<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../page/common/header.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>My JSP 'charts.jsp' starting page</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(function() {//初始化主题datagrid
		$("#themeInfoTable1").datagrid({
			url : 'getTheme.action',
			datatype : 'json',
			fitColumns : 'true',
			height : 350,
			nowrap : false,
			striped : true,
			modal : true,
			toolbar : [ {
				text : '查看主题投票情况',
				iconCls : 'icon-remove',
				handler : function() {
					var row = $('#themeInfoTable1').datagrid('getSelected');
					var url = "getCharts.action?id=" + row.id + "";
					showChart();
					initChart(url);
				}
			} ],
			pagination : true,
			rownumbers : true,
			columns : [ [ {
				field : "ck",
				title : "cheID",
				width : "20",
				checkbox : "true"
			}, {
				field : 'id',
				title : '主题编号',
				width : 300,
			}, {
				field : 'theme_name',
				title : '主题内容',
				width : 300
			}, {
				field : 'tag',
				title : '是否多选',
				width : 300
			} ] ],
		});
	});
	function showChart() {
		$("#showChart").dialog({
			title : '投票情况查看',
			href : 'showCharts.action',
			width : 600,
			height : 400,
			closable : false,
			modal : true,//屏幕不能编辑
			toolbar:[
				{
					text : '柱状图查看',
					iconCls : 'icon-edit',
					handler : function() {
						change();
					}
			}],
			buttons : [ {
				text : '完成',
				handler : function() {
					location.href = "initcharts.action";
				}
			} ]
		});
	}
	function initChart(url) {
		$.ajax({
			url : url,
			type : 'post',
			dataType : 'json',
			success : function(obj) {
			
				option = {
					    title : {
					        text:obj[0].title.text,
					    },
					    tooltip : {
					        trigger: 'axis',
					    },
					    toolbox: {
					        show : true,
					        feature : {
					            magicType : {show: true, type: ['line', 'bar']},
					            restore : {show: true},
					        }
					    },
					    calculable : true,
					    xAxis : [
					        {
					            type :obj[0].xAxis.type,
					            data : obj[0].xAxis.data,
					        }
					    ],
					    yAxis : [
					        {
					            type : 'value'
					        }
					    ],
					    series : [
					        {
					            type:obj[0].series.type,
					            data:obj[0].series.data,  
					        },
					    ]
					};
				option2 = {
					    title : {
					    	text:obj[0].title.text,
					        x:'center'
					    },
					    tooltip : {
					        trigger: 'item',
					        formatter: "{a} <br/>{b} : {c} ({d}%)"
					    },
					    legend: {
					        orient : 'vertical',
					        x : 'left',
					        //data:['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
					       
					    },
					    calculable : true,
					    series : [
					        {
					            name:'访问来源',
					            type:'pie',
					            radius : '55%',
					            data:[
					                {value:335, name:'直接访问'},
					                {value:310, name:'邮件营销'},
					                {value:234, name:'联盟广告'},
					                {value:135, name:'视频广告'},
					                {value:1548, name:'搜索引擎'}
					            ]
					        }
					    ]
					};
				 change(option2);
			}
		});
	}
	
	function change(option){
		var myChart = echarts.init(document.getElementById('mainChart'));
		myChart.setOption(option);  
	}
</script>
</head>
<body>
	<div id="showChart"></div>
	<table id="themeInfoTable1">
	</table>

</body>
</html>
