<%@page pageEncoding="GB2312" contentType="text/html; charset=GB2312" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>增加广告</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content- Type" content="text/html; charset=GB2312"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <s:head theme="xhtml"/>   
  <sx:head parseContent="true"/>   
  </head>
  
  <body>
<s:form name="form" id="form" method="POST" action="addAd!save">  
  <table cellspacing="0" cellpadding="0" border="1" align="center" >
  <tr><td>
<table cellspacing="0" cellpadding="0" border="0" border="0">
  <tr> 
    <td colspan="3"><s:textfield  name="title" label="标题" size="50"/></td>
  </tr>
  <tr> 
    <td colspan="3">
     <iframe name=upload src="./upload/upload.jsp" width="800" height="220" scrolling=no frameborder=0></iframe>   
    <s:textfield
label="图片" 
name="pic" 
size="100"/> </td>
  </tr>
    <tr> 
    <td colspan="3"><s:textfield  name="url" label="网址" size="50"/></td>
  </tr>
  <tr> 
    <td>备注:</td>
    <td height="20">
   <sx:textarea name="remark"></sx:textarea>
   </td>
  </tr>
  <tr>
  <td colspan="3"><s:submit value="增加" align="center" style="width:90px;height:40px;"/>
  </td></tr>
</table></td></tr></table>
 </s:form> 
</body>
  
</html>
