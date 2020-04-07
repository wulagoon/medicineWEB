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
    <title>新闻列表</title>  
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./css/style.css" rel="stylesheet" type="text/css">
	 <script language="JavaScript"> function doSearch(){ if(document.all.searchValue.value=="") { alert("请输入查询关键字!"); }else{ window.location.href="newsAction!list?queryName="+document.all.searchName.value+"&&queryValue="+document.all.searchValue.value; } } </script>  
	
     <style type="text/css">
<!--
.STYLE1 {color: #000000}
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
     </style>
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
  
  <body>
  <table align="center" width="1224"><tr><td nowrap align="center" width="200"><s:a href="index.jsp"><h1>首页</s:a></td><td height="100"><div align="center"><img src="./images/banner2.jpg" alt="广告2" width="468" height="80"></div></td>
  </tr>
  <tr><td valign="top" align="center" bgColor="blue"><b>新闻类别</b><br>
  行业新闻<br>
  公司新闻</td><td> 搜索:<select name="searchName">  <option value="title">标题</option>  <option value="newstype">新闻类别</option> <option value="author">作者</option> </select>   <input type="text" name="searchValue" value="" size="10"/>      <input name="image" type="image" src="./images/newssearch.gif"  onClick="doSearch();">
 <br/>
   <b> 新闻列表:</b><br>
    <table width="100%" cellspacing="0" cellpadding="0" border="0" bgColor="#8080ff" align="center">
  <tr>
  <td>
  <table width="100%" cellspacing="1" cellpadding="0" border="0" height="1">
  <tr bgcolor="#ffffff" align="center">
  <td background="./images/newstablebg.jpg"><strong>编号</strong></td><td background="./images/newstablebg.jpg"><strong>图片</strong></td><td background="./images/newstablebg.jpg"><strong>标题 </strong></td><td background="./images/newstablebg.jpg"><strong>作者</strong></td> <td background="./images/newstablebg.jpg"><strong>类别</strong></td><td background="./images/newstablebg.jpg"><strong>出处</strong></td><td background="./images/newstablebg.jpg"><strong>详细新闻</strong></td></tr>       
      
       <s:iterator value="pageBean.list4" status="news">         
          <tr bgcolor="#ffffff" align="center">
          <td><s:property value="id"/></td>
            <td>
             <s:set name="pic" value="pic" />
            <s:if test="#pic==''">           
 <img src="./images/nopic_small.jpg" width="100" height="100" border="0"/>
        </s:if>
         <s:else>
             <a href="<s:property value="pic"/>"> <img src="<s:property value="pic"/>" width="100" height="100" border="0"/></a> </s:else>
            </td>
          <td>
            <s:property value="title"/>
            </td>
               <td>
            <s:property value="author"/>
            </td>
               <td>
            <s:property value="newstype"/>
            </td>
   <td>
            <s:property value="cc"/>
            </td>
            <td><a href="viewNews!get?id=<s:property value="id"/>"><img src="./images/viewdetail.gif" width="100" height="36" border="0"></a></td>
            </tr>  
        </s:iterator>
        </table>
        </td>
        </tr>
      </table>
         共<s:property value="pageBean.totalRows"/> 条记录
        共<s:property value="pageBean.totalPages"/> 页
        当前第<s:property value="pageBean.currentPage"/>页
        
        <s:if test="%{pageBean.currentPage == 1}">
            第一页 上一页
        </s:if>
        <s:else>
            <a href="newsAction!list?page=1">第一页</a>
            <a href="newsAction!list?page=<s:property value="%{pageBean.currentPage-1}"/>">上一页</a>
        </s:else>
        <s:if test="%{pageBean.currentPage != pageBean.totalPages}">
            <a href="newsAction!list?page=<s:property value="%{pageBean.currentPage+1}"/>">下一页</a>
            <a href="newsAction!list?page=<s:property value="pageBean.totalPages"/>">最后一页</a>
        </s:if>
        <s:else>
            下一页 最后一页
        </s:else>   </td></tr></table><div align="center">  
   
  </div>
  </body>
</html>
