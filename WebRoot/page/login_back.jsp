<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../page/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>用户登录</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	$(function() {
		initDialog();
	});
	//登录dialog
	function initDialog() {
		$("#loginAndRegDialog").dialog({
			closable : false,
			title : "后台登录",
			modal : true, //模式化
			width : 300,
			height : 200,
			buttons : [//dialog右下角的按钮，以Json数组形式添加
			{
				text : "登录", //按钮名称
				iconCls : "icon-save", //按钮左侧显示的图片
				handler : function() {//按钮点击之后出发的方法
				$('#loginForm').form('submit', {
					url : '../login.action',
					data:$(this).serialize(),
					onSubmit : function(data) {
					   return data;//对数据进行格式化
					},
					datatype:'JSON',
					success : function(result) {
					    var obj=eval("("+result+")");
						if(obj.name=="success"){//登录判断
							location.href = "init.action";
						}else{
							$.messager.show({
								title : "提示",
								width:250,
								height:120,
								msg : "用户名或密码错误，请联系管理员!",
								timeout:2000,
							});
						}
					},
					error:function(){
						alert("error");
					}
			  });
			}
			}, {
				text : "联系管理员", //按钮名称
				iconCls : "icon-save", //按钮左侧显示的图片
				handler : function() {//按钮点击之后出发的方法
					contactAdmin();
				}

			} ]
		});
	};
	function contactAdmin() {
		alert("已经收到您的消息!");
	}
</script>
<style type="text/css">
th {
	text-align: right;
	font-size: 12px;
}
</style>
</head>

<body>
	<div id="loginAndRegDialog"
		style="width:250px;height:150px;text-align: center;">
		<form id="loginForm" method="post">
			<table align="center" style="margin-top: 30px;">
				<tr>
					<th>用户名</th>
					<td><input class="esyui-validatebox" name="loginName" type="text" /></td>
				</tr>
				<tr>
					<th>密码</th>
					<td><input name="password" class="esyui-validatebox" type="password" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
