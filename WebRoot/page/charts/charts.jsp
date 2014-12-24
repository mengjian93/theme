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
				var myChart = echarts.init(document.getElementById('mainChart'));
				//var val = obj[0];
				//alert(val.title.text);
				//myChart.hideLoading();
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
					            magicType : {show: true, type: ['pie', 'bar']},
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
				 myChart.setOption(option);    
			}
		});
	}
</script>
</head>
<body>
	<div id="showChart"></div>
	<table id="themeInfoTable1">
	</table>

</body>
</html>
