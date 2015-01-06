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
<link rel="stylesheet" href="css/pgwmodal.min.css">
<script type="text/javascript" src="js/pgwmodal.min.js"></script>
<script type="text/javascript">
	function openDialog(id) {
		 $.pgwModal({
			url:'count.action?id='+id,
			target: '#theme_get',
			titleBar:false,
			maxWidth:400,
		}); 
	}
</script>
</head>

<body>
	<div class="container">
		<div class="navbar-spacer"></div>
		<nav class="navbar">
			<div class="container">
				<ul class="navbar-list">
					<!-- <li class="navbar-item"><a href="allTheme.action"
						class="mybut">投票专区</a></li> -->
					<li class="navbar-item"><span class="mybut">投票专区</span></li>
					<!-- <li class="navbar-item"><a href="index.jsp" class="mybut">首页</a></li> -->
				</ul>
			</div>
		</nav>
	</div>
	<div class="container">
		<ul style="list-style: none;margin-left: 20px;">
			<s:iterator value="list" id="t">
				<li><a href="#"
					onclick="javascript:openDialog(<s:property value="#t.id"/>);">投票</a>
					<s:property value="#t.theme_name" /></li>
			</s:iterator>
		</ul>
	</div>
	<div class="container">
		<div class="page" style="margin-left: 10px;">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
				class="last">下一页</a>
		</div>
	</div>
	<div id="theme_get"></div>
</body>
</html>
