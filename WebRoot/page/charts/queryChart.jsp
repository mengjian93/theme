<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../page/common/header.jsp"%>
<div id="mainChart" style="height:300px;width: 500px;margin: auto"></div>
<!-- <script type="text/javascript">
	var myChart = echarts.init(document.getElementById('main'));
	myChart.setOption({
		title:'',
		tooltip : {
			trigger : 'axis'
		},
		legend : {
			x:'center',
			y:'bottom',
			data : [ '蒸发量', '降水量','其后偶' ]
		},
		toolbox : {
			show : true,
			x:'right',
			y:'top',
			feature : {
				magicType : {
					show : true,
					type : ['bar','pie']
				},
				restore : {
					show : true
				}
			}
		},
	calculable : true,
	xAxis : [ {
		type : 'category',
		data : [ '1月', '2月', '3月', '4月', '5月',
				'6月', '7月', '8月', '9月', '10月',
				'11月', '12月' ]
	} ],
	yAxis : [ {
		type : 'value',
		splitArea : {
			show : true
		}
	} ],
	series : [
			{
				name : '蒸发量',
				type : 'bar',
				data : [ 2.0, 4.9, 7.0, 23.2, 25.6,
						76.7, 135.6, 162.2, 32.6,
						20.0, 6.4, 3.3 ]
			},
			{
				name : '降水量',
				type : 'bar',
				data : [ 2.6, 5.9, 9.0, 26.4, 28.7,
						70.7, 175.6, 182.2, 48.7,
						18.8, 6.0, 2.3 ]
			} ]
	});
	</script>  -->
