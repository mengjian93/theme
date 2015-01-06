<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ include file="../../page/common/header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>投票专区</title>
<link rel="shortcut icon" href="images/myVote.ico" type="image/x-icon" />
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
	<div class="container" style="border: 1px solid #bbb;border-top:none;width: 80%;">
		<br>
		<ul class="myul" style="list-style: none;margin-left: 5rem;">
			<s:iterator value="list" id="t">
				<li><a class="button" href="#"
					onclick="javascript:openDialog(<s:property value="#t.id"/>);">投票</a>
					<span><s:property value="#t.theme_name" /></span></li>
			</s:iterator>
		</ul>
		<div class="page" style="margin-left:4rem;">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
				class="last">下一页</a>
		</div>
		<br><br>
	</div>
	<!-- <div class="container" style="height:6rem;border: 1px solid #bbb;border-top:none;">
		<div class="page" style="margin-left: 10px;">
			<a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#"
				class="last">下一页</a>
		</div>
	</div> -->
	<div id="theme_get"></div>
</body>
</html>
