<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>后台操作区</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>admin/images/style.css" rel="stylesheet" type="text/css"> 
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>
<script type="text/javascript">
function sub()
{
	if(document.form1.title.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入消息标题！");
		document.form1.title.focus();
		return false;
	}
	if(document.form1.content.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.content.value.replace(/\s+$|^\s+/g,"").length>1000)
   	{
   		alert("请输入消息内容，字数在1000个字符以内！");
       	document.form1.content.focus();
      	return false;  
   	}
	form1.submit();
}
</script>
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
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/error.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id=""; 
		String title="";
		String content="";
		if(method.equals("upaff")){
			id=request.getParameter("id");
			List afficheList = cb.get1Com("select * from affiche where id='"+id+"'",5);
			title=afficheList.get(1).toString();
			content=afficheList.get(2).toString(); 
		} 
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
		  <td>
<form name="form1" action="<%=basePath %>AfficheServlet" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> 
    <TR bgColor=#ffffff><input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>">
      <TD class="font1" height="26" width="45%" align=right>标&nbsp;&nbsp;&nbsp;&nbsp;题：</td>
      <TD class="font1" align=left><input name="title" type="text" id="title" size="60" maxlength="100" value="<%=title %>"></td>
    </tr> 
    <tr bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">消息内容：</td>
      <td class="font1" align=left><textarea name="content" cols="50" rows="8" ><%=content %></textarea></td>
    </tr>
    <tr bgColor=#ffffff>
      <td class="font1" colspan="2" height="26" align=center>
      <input type="button" value="确定" onclick='sub()'></td>
    </tr> 
  </tbody>
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
