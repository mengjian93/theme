<%  
    String path = request.getContextPath();  
    String basePath = request.getScheme() + "://"  
            + request.getServerName() + ":" + request.getServerPort()  
            + path;  
%> 

<link rel="stylesheet" type="text/css"href="<%=basePath%>/js/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/js/themes/icon.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.easyui.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/locale/easyui-lang-zh_CN.js"> </script>
<script type="text/javascript" src="<%=basePath%>/js/jquery.easyui.min.js"> </script>
<script type="text/javascript" src="<%=basePath%>/js/echarts/echarts-all.js"></script>