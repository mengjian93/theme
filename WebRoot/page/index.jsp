<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../page/common/header.jsp"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>后台管理</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="../css/back.css">
<script type="text/javascript">
function addTab(tabId,title,url){//创建选项卡
	//如果当前id的tab不存在则创建一个tab
	if($("#"+tabId).html()==null){
		//var name = 'iframe_'+tabId;
		$('#tt').tabs('add',{
			title: title,         
			closable:true,
			cache : false,
			//注：使用iframe即可防止同一个页面出现js和css冲突的问题
			content : '<iframe name="'+name+'"id="'+tabId+'"src="'+url+'" width="100%" height="100%" frameborder="0" scrolling="auto" ></iframe>'
		});
	}
}
</script>
</script>
</head>
<body class="easyui-layout">
	<div region="north" border="true" split="true"
		style="overflow: hidden; height: 40px;">
		<div class="top-bg"></div>
	</div>
	<div region="south" border="true" split="true"
		style="overflow: hidden; height: 40px;">
		<div class="footer">版权所有：长春理工大学</div>
	</div>
	<div region="west" split="true" title="导航菜单" style="width: 200px;">
		<div id="aa" class="easyui-accordion"
			style="position: absolute; top: 27px; left: 0px; right: 0px; bottom: 0px;">
			<div id="theme" title="话题管理" icon="icon-edit"
				style="overflow: auto; padding: 10px;" selected="true">
				<a href="#" class="easyui-linkbutton" icon="icon-add" plain="true" onclick="javascript:addTab('tabId_loginInfo','主题管理','<%=basePath%>/initTheme.action')">查看主题</a>
			</div>
			<div title="投票情况" icon="icon-edit" style="padding: 10px;">
               <a href="#" class="easyui-linkbutton" icon="icon-remove" plain="true" onclick="javascript:addTab('tabId_loginInfo1','投票情况查看','<%=basePath%>/initcharts.action')">查看投票情况</a>
            </div>
		</div>
	</div>
	<div id="mainPanle" region="center" style="overflow: hidden;">
	   <div id="tt"  class="easyui-tabs" style="width:auto;height:700px;">
		<div title="Home">
		欢迎您，管理员
		</div>
	</div>
	</div>
</body>
</html>
