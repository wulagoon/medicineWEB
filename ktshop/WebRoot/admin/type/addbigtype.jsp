<%@page pageEncoding="GB2312" contentType="text/html; charset=GB2312" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>增加大类</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./css/style.css" rel="stylesheet" type="text/css">

  </head>
  
  <body>
  <p>增加大类</p>
    <s:form method="POST" action="addBigtype!save">
    <s:textfield  name="bigtypename" label="大类"/>
    <s:submit value="增加"  style="width:60px;height:30px;" />
    </s:form>
  </body>
</html>
