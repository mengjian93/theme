<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>My JSP 'update.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<form id="optionForm" method="post"
		style="margin-left: 10px;margin-top: 5px;">
		<table id="tab1" style="font-size: 12px;">
			<tr>
				
				<td>主题名称:</td>
				<td><input type="text" name="theme_name"
					value='<s:property value="theme_name"/>'></td>
				<td><input type="hidden" name="id" value='<s:property value="id"/>'>是否多选:<select name="tag">
						<option value="1"
							<s:if test="%{tag==1}">selected='selected'</s:if>>是</option>
						<option value="0"
							<s:if test="%{tag==0}">selected='selected'</s:if>>否</option>
				</select>
				</td>
			</tr>
			<s:iterator value="option_name" id="option">
				<tr>
					<td>选&nbsp;&nbsp;&nbsp;项:</td>
					<td><input type="text" name="option_name"
						value='<s:property value="option"/>'></td>
					<td><input type="checkbox" name="opt">删除</td>
				</tr>
			</s:iterator>
		</table>
	</form>
</body>
</html>
