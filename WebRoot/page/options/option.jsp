<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../../page/common/header.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>sda</title>
<style type="text/css">
.test {
	margin-top: 10px;
}

.test1 {
	margin-left: 20px;
}
</style>
<script type="text/javascript">
	$(function() {//初始化主题datagrid
		$("#themeInfoTable").datagrid({
			url : 'getTheme.action',
			datatype : 'json',
			fitColumns : 'true',
			height : 350,
			nowrap : false,
			striped : true,
			modal : true,
			toolbar : [ {
				text : '新增主题',
				iconCls : 'icon-edit',
				handler : function() {
					add();
				}
			}, '-', {
				text : '删除主题',
				iconCls : 'icon-cancel',
				handler : function() {
					var obj = $("input[type='checkbox']:checked");
					if(obj.size()==0){
						jQuery.messager.alert('提示:', '请选择需要删除的数据！', 'error');
					}else{
						jQuery.messager.confirm("确认", "确认删除？！", function (r) {  
					        if (r) {  
					        	var row = $('#themeInfoTable').datagrid('getSelected');
								var url="delete.action?id="+row.id+"";
								del(url);
					            return true;  
					        }  
					        return false; 
					    });  
					}
				}
			}, '-', {
				text : '修改主题',
				iconCls : 'icon-remove',
				handler : function() {
					var row = $('#themeInfoTable').datagrid('getSelected');
					var url="updateOp.action?id="+row.id+"";
					update(url);
				}
			} ],
			pagination : true,
			rownumbers : true,
			columns : [ [ {
				field : "ck",
				title:"cheID",
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
	function add() {//增加主题，弹出对话框
		$('#add').dialog({
			title : '新增',
			href : 'addTheme.action',
			width : 400,
			height : 300,
			closable : false,
			modal : true,//屏幕不能编辑
			toolbar : [ {
				text : '新增投票选项',
				iconCls : 'icon-add',
				handler : function() {
					addText();
				}
			}, '-', {
				text : '删除投票选项',
				iconCls : 'icon-cancel',
				handler : function() {
					removeText();
				}
			} ],
			buttons : [ {
				text : '提交',
				iconCls : 'icon-ok',
				handler : function() {
					$('#optionForm').form('submit', {
						url : 'save.action',
						data : $(this).serialize(),
						onSubmit : function(data) {
							return data;//对数据进行格式化
						},
						datatype : 'JSON',
						success : function(result) {
							var obj = eval("(" + result + ")");
							if (obj.name == "success") {//登录判断
								alert("保存成功！");
								location.href = "initTheme.action";
							} else {
								alert("保存出错！！");
						   }
						}
					});
				}
			}, {
				text : '取消',
				handler : function() {
					location.href = "initTheme.action";
				}
			} ]
		});
	}
	function addText() {//增加选项
		var trHTML = "<tr><td>选&nbsp;&nbsp;&nbsp;项:</td><td><input type='text' name='option_name'></td><td><input type='checkbox' name='opt'>删除</td></tr>";
		$(trHTML).appendTo("#tab1").end();
	}
	function removeText() {//删除选项
		var obj = $("input[name='opt']:checked");
		var obj1 = $("input[name='opt']");
		//操作判断
		if (obj.size() == 0) {
			alert("请选择要删除的行！");
		} else if ((obj1.size() - obj.size()) < 2) {
			alert("至少保留两个选项！");
		} else {
			obj.each(function() {
				$(this).parent().parent().remove();
			});
		}
	}
	function update(url) {//更新主题
		$('#update').dialog({
			title : '修改主题',
			href : url,
			closable : false,
			modal : true,//屏幕不能编辑
			width : 400,
			height : 300,
			toolbar : [ {
				text : '新增投票选项',
				iconCls : 'icon-add',
				handler : function() {
					addText();
				}
			}, '-', {
				text : '删除投票选项',
				iconCls : 'icon-cancel',
				handler : function() {
					removeText();
				}
			} ],
			buttons : [ {
				text : '提交',
				iconCls : 'icon-ok',
				handler : function() {
					$('#optionForm').form('submit', {
						url : 'update.action',
						data : $(this).serialize(),
						onSubmit : function(data) {
							return data;//对数据进行格式化
						},
						datatype : 'JSON',
						success : function(result) {
							var obj = eval("(" + result + ")");
							if (obj.name == "success") {//登录判断
								alert("更新成功！");
								location.href = "initTheme.action";
							} else {
								alert("更新出错！！");
						   }
						}
					});
				}
			}, {
				text : '取消',
				handler : function() {
					location.href = "initTheme.action";
				}
			} ]
		});
	}
	function del(url){//删除主题
		$.ajax({
			url:url,
			datatype:'json',
			success:function(){
				jQuery.messager.alert("操作提示", "操作成功！");
				location.href = "initTheme.action";
				
			}
		});
	}
</script>
</head>
<body>
	<table id="themeInfoTable">
	</table>
	<div id="add" style="margin:0px;padding:0px;width:600px;height:300px;"></div>
	<div id="update"></div>
</body>
</html>
