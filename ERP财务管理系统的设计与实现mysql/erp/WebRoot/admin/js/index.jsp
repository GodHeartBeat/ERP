<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "����";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>  
 

<%
String message = (String)request.getAttribute("message");
	if(message == null){
		message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message"); 
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
	float ndys=cb.getFloat("select sum(ysje) from ndys where spjg='��ͬ��'");
	float hdys=cb.getFloat("select sum(ysje) from hdys where spjg='��ͬ��'");
	float jkje=cb.getFloat("select sum(jkje) from jk where spjg='��ͬ��'");
	float hkje=cb.getFloat("select sum(hkje) from hk where spjg='��ͬ��'");
	float yy=hkje-(ndys+hdys+jkje);
%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
	<td height="2">&nbsp;</td>
  </tr>
  <tr>
	<td background="<%=basePath %>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0">
		 
		<tr>
		  <td><form action="" method="post" name="form3">	
			<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
			  <tr> 
				<td class="font1" height="27" align="center"><strong>���Ԥ���ܼƣ�<%=ndys %></strong></td>
      <td class="font1" height="27" align="center"><strong>�Ԥ���ܼƣ�<%=hdys %></strong></td>
      <td class="font1" height="27" align="center"><strong>����ܼƣ�<%=jkje %></strong></td>
      <td class="font1" height="27" align="center"><strong>�����ܼƣ�<%=hkje %></strong></td>
      <td class="font1" height="27" align="center"><strong>�ʲ�ӯ�ࣺ<%=yy %></strong></td> 
    </tr>
 
   
			</table>
			</form>
		  </td>
		</tr> 
	  </table>
	</td>
	<td background="images/index1_47.gif"></td>
  </tr>
  <tr>
	<td width="8" height="8"><img src="images/index1_91.gif" width="8" height="8" /></td>
	<td background="images/index1_92.gif"></td>
	<td width="8" height="8"><img src="images/index1_93.gif" width="8" height="8" /></td>
  </tr>
</table>
</body>
<%} %>
