<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>�޸��û���Ϣ</title>  
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
  <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
  </head>
  
  <body>
  <table align="center">
  <tr><td><s:a href="index.jsp"><img src="images/logo.jpg" border="0"/></s:a></td><td align="center"><img src="images/banner.jpg" align="middle"/></td></tr>
  <tr><td valign="top" align="center">
          <s:set name="username" value="#session['username']" />
          <s:if test="#username==null">
              <b>��Ա��¼</b>
              <s:form method="POST" action="loginAction!login">
                <s:textfield  name="user.username" label="�û���"/>
                <s:password  name="user.password"  label="����"/>
                <s:submit value="��¼"  align="center"/> <s:reset value="����" align="center"/></s:form>
              
      </s:if>
          <s:else>
          
              ��ӭ��<s:property value="#session.username"/>��<br>
              <s:a href="cart/viewcart.jsp">�鿴���ﳵ</s:a>
              <s:form action="logoutAction!logout">
                <s:submit value="ע��"></s:submit>
                </s:form>    
               <a href="getUser!getUser1?username=<s:property value="#session.username"/>">�޸��û����� </a>        
      </s:else> 
  </td><td> <s:iterator  value="#request.user"  id="user"/>
  <s:form name="form" id="form" method="POST" action="modifyUser!modify.action?id=%{#user.id}">
 <table cellpadding="0" cellspacing="0" border="1" align="center">
  <tr><td> 
<table border="0" cellpadding="0" cellspacing="0">
  <tr><td>
<s:textfield  name="username" label="�û���" value="%{#user.username}"/>
</td>
</tr>
  <tr><td>
<s:password   name="password" maxlength="20" label="����" value="%{#user.password}" showPassword ="true"/>  
</td>
</tr>
  <tr><td>
<s:radio  
tooltip="Choose your Sex" 
label="�Ա�" 
list="#{'1':'����','0':'Ů��'}"   
name="sex" 
value="%{#user.sex}"
/>
</td>
</tr>
  <tr><td height="18"> 
          <div align="right">
            <s:select 
  tooltip="��ѡ������ѧ����"
  label="ѧ��" 
  list="{'Сѧ','����','����','��ר','����','˶ʿ','��ʿ'}"
  name="education"
  value="%{#user.education}"/> 
          </div></td></tr>  
                 <tr><td height="18"> 
          <div align="right">
            <s:select 
  tooltip="��ѡ�����Ĺ�����"
  label="����" 
  list="{'ũ��','����','��ʦ','У��','�����ɲ�','��˾/��ҵ�쵼','����','����������','ҵ��Ա','��е����ʦ','web����Ա','��������ʦ','����','���繤��ʦ','ҽ��','��ʿ','�곤','����ְҵ'}"
  name="job"
  value="%{#user.job}"/> 
          </div></td></tr>  
<tr><td>
<s:select    
tooltip="��ѡ�����İ��ã�" 
label="����" 
list="#{'����':'����','����':'����','����':'����','�����˶�':'�����˶�','����':'����'}" 
name="hobby" 
emptyOption="None" 
headerKey="��ѡ��" 
headerValue="��ѡ��"
value="%{#user.hobby}"
/>
</td>
</tr>
<tr><td>
<s:checkboxlist 
tooltip="��ѡ���������ѣ�" 
label="����" 
list="{'С��','Сǿ','С��','С��','��','С��','����','С��','���'}"
name="friends"
value="%{#user.friends}"
/> 
</td>
</tr>
  <tr> 
    <td colspan="3">
         <iframe name=upload src="./upload/upload.jsp" width="800" height="220" scrolling=no frameborder=0></iframe>   
    <s:textfield
label="ͼƬ" 
name="pic" 
size="100" 
value="%{#user.pic}"/> </td>
  </tr>
<tr><td valign="top">
����:
</td><td><s:textarea name="message" value="%{#user.message}" cols="50" rows="10"></s:textarea>
</td>
</tr>
 <tr><td>
      <s:set name="area"
   value="#{'��ѡ��ʡ�ݣ�':{'��ѡ����У�'},
                    '����':{'����'},
                     '���':{'���'},
                     '�ӱ�':{'ʯ��ׯ','��ɽ','�ػʵ�','����','��̨','����','�żҿ�','�е�','����','�ȷ�','��ˮ'},
                     'ɽ��':{'̫ԭ','��ͬ','��Ȫ','����','����','˷��','����','�˳�','����','�ٷ�','����'},
                     '���ɹ�������':{'���ͺ���','��ͷ','�ں�','���','ͨ��','������˹','���ױ���','�����׶�','�����첼','�˰���','���ֹ�����','��������'},
                     '����':{'����','����','��ɽ','��˳','��Ϫ','����','����','Ӫ��','����','����','�̽�','����','����','��«��'},
                     '����':{'����','����','��ƽ','��Դ','ͨ��','��ɽ','��ԭ','�׳�','�ӱ߳�����������'},
                     '������':{'������','�������','����','�׸�','˫Ѽɽ','����','����','��ľ˹','��̨��','ĵ����','�ں�','�绯','���˰������'},
                     '�Ϻ�':{'�Ϻ�'},
                     '����':{'�Ͼ�','����','����','����','����','��ͨ','���Ƹ�','����','�γ�','����','��','̩��','��Ǩ'},
                     '�㽭':{'����','����','����','����','����','����','��','����','��ɽ','̨��','��ˮ'},
                     '����':{'�Ϸ�','�ߺ�','����','����','����ɽ','����','ͭ��','����','��ɽ','����','����','����','����','����','����','����','����'},
                     '����':{'����','����','����','����','Ȫ��','����','��ƽ','����','����'},
                     '����':{'�ϲ�','������','Ƽ��','�Ž�','����','ӥ̶','����','����','�˴�','����','����'},
                     'ɽ��':{'����','�ൺ','�Ͳ�','��ׯ','��Ӫ','��̨','Ϋ��','����','̩��','����','����','����','����','����','�ĳ�','����','����'},
                     '����':{'֣��','����','����','ƽ��ɽ','����','�ױ�','����','����','���','����','���','����Ͽ','����','����','����','�ܿ�','פ����','��Դ'},
                     '����':{'�人','��ʯ','ʮ��','�˲�','�差','����','����','Т��','����','�Ƹ�','����','����','��ʩ����������������','ʡֱϽ�ؼ�������λ'},
                     '����':{'��ɳ','����','��̶','����','����','����','����','�żҽ�','����','����','����','����','¦��','��������������������'},
                     '�㶫':{'����','�ع�','����','�麣','��ͷ','��ɽ','����','տ��','ï��','����','����','÷��','��β',' ��Դ','����','��Զ','��ݸ','��ɽ','����','����','�Ƹ�'},
                     '����׳��������':{'����','����','����','����','����','���Ǹ�','����','���','����','��ɫ','����','�ӳ�','����','����'},
                     '����':{'����','����','ʡֱϽ�ؼ�������λ'},
                     '����':{'����'},
                     '�Ĵ�':{'�ɶ�','�Թ�','��֦��','����','����','��Ԫ','����','�ڽ�','��ɽ','�ϳ�','üɽ','�˱�','�㰲 ','����','�Ű�','����','����','���Ӳ���Ǽ��������','���β���������','��ɽ����������'},
                     '����':{'����','����ˮ','����','��˳','ͭ�ʵ���','ǭ���ϲ���������������','�Ͻڵ���','ǭ�������嶱��������','ǭ�ϲ���������������'},
                     '����':{'����','����','��Ϫ','��ɽ','��ͨ','����','�ն�','�ٲ�','��������������','��ӹ���������������','��ɽ׳������������','��˫���ɴ���������','��������������','�º���徰����������','ŭ��������������','�������������'},
                    '����������':{'������','��������','ɽ�ϵ���','�տ������','��������','�������','��֥����'},
                     '����':{'����','ͭ��','����','����','μ��','�Ӱ�','����','����','����','����'},
                     '����':{'����','������','���','����','��ˮ','����','��Ҵ','ƽ��','��Ȫ','����','����','¤��','���Ļ���������','���ϲ���������'},
                     '�ຣ':{'������','��������','��������������','���ϲ���������','���ϲ���������','�������������','��������������','�����ɹ������������'},
                     '���Ļ���������':{'����','ʯ��ɽ','����','��ԭ','����'},
                     '�½�ά���������':{'��³ľ��','��������','��³������','���ܵ���','��������������','���������ɹ�������','���������ɹ�������','�����յ���','�������տ¶�����������','��ʲ����','�������','���������������','���ǵ���','����̩����','������ֱϽ�ؼ���������'},
                     '̨��':{'̨��','����','��¡','̨��','̨��','����','����'},
                     '����ر�������':{'���'},
                     '�����ر�������':{'����'}
                 }" />
                  <s:doubleselect label="ʡ��/����" list="#area.keySet()" name="province"
   doubleName="city" formName="form" doubleList="#area[top]" />
    </td></tr>
 <tr><td>
          <div align="right">
            <s:textfield  name="address" label="��ַ" align="left" size="100" value="%{#user.address}"/>
          </div></td></tr>
            <tr><td>
          <div align="right">
            <s:textfield  name="post" label="�ʱ�" align="left" value="%{#user.post}"/>
          </div></td></tr>
            <tr><td>
          <div align="right">
            <s:textfield  name="telphone" label="�绰" align="left" value="%{#user.telphone}"/>
          </div></td></tr>
            <tr><td>
          <div align="right">
            <s:textfield  name="mobilephone" label="�ֻ�" align="left" value="%{#user.mobilephone}"/>
          </div></td></tr>
<tr><td align="center">
<div align="center">
<s:submit value="�޸�" align="center"/></div>
</td>
</tr>
</table>
</td>
</tr>
</table>
</s:form></td></tr>
  </table>
</body>
     <p align="center" class="STYLE1"></p>  
</html>