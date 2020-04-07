<%@ page language="java" import="java.util.*" pageEncoding="GB2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>  

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
    <base href="<%=basePath%>">   
    <title>小类产品列表</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	<style type="text/css">
	body {
	margin-top: 0px;
}
    </style>
	<script language="JavaScript"> function doSearch(){ if(document.all.searchValue.value=="") { alert("请输入查询关键字!"); }else{ window.location.href="productsAction!list?queryName="+document.all.searchName.value+"&&queryValue="+document.all.searchValue.value; } } </script>  
	
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
  <table width="1024" border="0" align="center">
    <tr>
      <td width="236"><a href="./index.jsp"><h1>首页</h1></a></td>
      <td width="778"><div align="center"><img src="./images/banner.jpg" width="468" height="80"></div></td>
    </tr>
    <tr>
      <td colspan="2"><s:action name="listMenu" executeResult="true"></s:action></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
      <td valign="top">搜索:
  <select name="searchName">  <option value="productname">产品名称</option></select><input type="text" name="searchValue" value="" size="10"/>  <input name="image" type="image" src="./images/20080520150627399.gif" width="59" height="18"  onClick="doSearch();"> <br/>
   <b> 产品列表:</b><br>
  <table width="900" cellspacing="0" cellpadding="0" border="0" bgColor="#c0c0c0">
  <tr>
  <td>
  <table width="900" cellspacing="1" cellpadding="0" border="0" height="1" align="center">
  <tr bgcolor="#ffffff" align="center">
  <td background="./images/tablebg.jpg"><strong>编号</strong></td><td background="./images/tablebg.jpg"><strong>产品名称 </strong></td> <td background="./images/tablebg.jpg"><strong>图片</strong></td><td background="./images/tablebg.jpg"><strong>大类</strong></td><td background="./images/tablebg.jpg"><strong>小类</strong></td> <td background="./images/tablebg.jpg"><strong>价格</strong></td><td background="./images/tablebg.jpg"><strong>详细介绍</strong></td><td background="./images/tablebg.jpg"><strong>购物车</strong></td></tr>       
       <s:iterator value="pageBean.list5">         
          <tr bgcolor="#ffffff" align="center">
          <td><s:property value="id"/></td>
          <td>
            <s:property value="productname"/>            </td><td>
             <a href="<s:property value="pic"/>"><img src="<s:property value="pic"/>" width="100" height="100" border="0"/></a> 
            </td>
            <td>
            <s:property value="bigcategory"/>            </td>
            <td>
            <s:property value="smallcategory"/>            </td>
            <td>       
            <font color="red" ><s:property value="price"/></font>元            </td>
            <td><a href="showProduct!get?id=<s:property value="id"/>"><img src="./images/20080521140854537.gif" width="60" height="21" border="0"></a></td>
            <td>
            <a href="addCart!add?id=<s:property value="id"/>"><img src="./images/20080521140854960.gif" width="60" height="21" border="0"></a>            </td> 
          </tr>  
        </s:iterator>
      </table>    </td>
    </tr>
  </table>
         共<s:property value="pageBean.totalRows"/> 条记录
        共<s:property value="pageBean.totalPages"/> 页
        当前第<s:property value="pageBean.currentPage"/>页
        
        <s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页        </s:if>
        <s:else>
            <a href="listProducts!show?page=1">第一页</a>
            <a href="listProducts!show?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPages}">
            <a href="listProducts!show?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="listProducts!show?page=<s:property value="pageBean.totalPages"/>">最后一页</a>        </s:if>
        <s:else>
      下一页 最后一页        </s:else></td>
    </tr>

  </table>
     
  </body>
</html>
