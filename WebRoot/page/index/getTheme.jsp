<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib  prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>投票</title>
<script type="text/javascript">
  function count(){
	  var optid=document.getElementsByName("cheOpt");
	  var optIdn=document.getElementsByName("optId");
	  var opt="";
	  for(var i=0;i<optid.length;i++){
		  if(optid[i].checked){
			  opt+=optIdn[i].value+",";
		  }
	  }
	  var themeid=$("#themeId1").val();
	  var url="getcount.action?id="+opt+"&&themeId="+themeid;
	  $.ajax({
		  url:url,
		  datatype:'json',
		  success:function(data){
			  if(data.result=="success"){
				  alert("投票成功");
				  $.pgwModal('close');
			  }else{
				  alert("您已经投过票了");
				  $.pgwModal('close');
			  }
		  }
	  });
  }
</script>
</head>
<body>
	<form action="">
	  <label><s:property value="theme.theme_name"/></label>
	  <input type="hidden" id="themeId1" value="<s:property value="theme.id"/>">
	   <s:iterator value="optList" id="opt">
	  <s:if test='theme.tag=="1"'>
	     <input type="checkbox" name="cheOpt">
	  </s:if>
	  <s:else>
	    <input type="radio" name="radOpt">
	  </s:else>
	   <s:property value="#opt.option_name"/><br>
	   <input type="hidden" name="optId" value="<s:property value="#opt.id"/>">
	  </s:iterator>
	</form>
	<a href="#" class="button" style="float: right;" onclick="javascript:count();">完成</a>
</body>
</html>
