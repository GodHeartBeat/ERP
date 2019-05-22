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
	font-family: "宋体";
	font-size: 12px;
	color: #333333;
	background-color: #2286C2;
}
-->
</style>
</head>
<script  language="javascript" >
function del()
{
	pageform.submit();
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
				<td class="font1" height="27" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>序号</strong></td>
				<td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>标题</strong></td>
      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>发布时间</strong></td>
      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>发布人</strong></td> 
      <td class="font1" align="center" background="<%=basePath %>admin/images/index1_72.gif" bgcolor="#FFFFFF"><strong>查看</strong></td> 
    </tr>
    <%
			List pagelist3=cb.getCom("select * from affiche order by id desc",5);
			if(!pagelist3.isEmpty()){
			for(int i=0;i<pagelist3.size();i++){
				List pagelist2 =(ArrayList)pagelist3.get(i);
	%> 
	<tr bgColor=#ffffff align=center>
      <td height="26" class="font1" align=center><%=i+1 %></td>
      <td class="font1" align=center><%=pagelist2.get(1).toString() %></td> 
      <td class="font1" align=center><%=pagelist2.get(3).toString() %></td>
      <td class="font1" align=center><%=pagelist2.get(4).toString() %></td>
      <td class="font1" align=center><a href="<%=basePath%>admin/affiche/add2.jsp?method=upaff&id=<%=pagelist2.get(0).toString()%>" >查看</a></td> 
    </tr>
<% }} %>  
	  </table> 
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
