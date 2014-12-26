<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../page/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>投票专区</title>
<link rel="stylesheet" href="css/normalize.css">
<link rel="stylesheet" href="css/skeleton.css">
<link rel="stylesheet" href="css/web_index.css">
<link rel="stylesheet" href="css/list_theme.css">
<link rel="stylesheet" href="css/list_theme.css">
<script type="text/javascript">
	function openDialog() {
		
	}
</script>
</head>

<body>
	<div class="container">
		<div class="navbar-spacer"></div>
		<nav class="navbar">
			<div class="container">
				<ul class="navbar-list">
					<li class="navbar-item"><a href="about_US.jsp" class="mybut">关于我们</a></li>
					<li class="navbar-item"><a href="allTheme.action"
						class="mybut">投票专区</a></li>
					<li class="navbar-item"><a href="index.jsp" class="mybut">首页</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<ul style="list-style: none;">
			<s:iterator value="list" id="t">
				<li><s:property value="#t.theme_name" /><a href="#"
					onclick="javascript:openDialog();">投票</a></li>
			</s:iterator>
		</ul>
	</div>
	<div class="container">
		<div class="page">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
				class="last">下一页></a>
		</div>
	</div>
	<div id="theme_get"></div>
</body>
</html>
