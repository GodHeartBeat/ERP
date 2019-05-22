<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String method=request.getParameter("method");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<SCRIPT language=JavaScript src="<%=basePath %>member/images/calendar.js"></SCRIPT>
<script type="text/javascript">
function check()
{//String ysmc="";String ysnd="";String ysje=""; String xx="";   
	if(document.form1.ysmc.value==""||document.form1.ysnd.value==""||document.form1.ysje.value==""||document.form1.xx.value=="" )
	{
		alert("全部内容都要填写！");
	//	document.form1.title.focus();
		return false;
	} 
	form1.submit();
}
</script>
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
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
	
	String user=(String)session.getAttribute("user"); 
	if(user==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
	String id="";
		String ysmc="";String ysnd="";String ysje=""; String xx="";  
		if(method.equals("uphdys")){
			id=request.getParameter("id");
			List wzlist=cb.get1Com("select * from hdys where id='"+id+"'",5);
			ysmc=wzlist.get(1).toString();
			ysnd=wzlist.get(2).toString();
			ysje=wzlist.get(3).toString(); 
			xx=wzlist.get(4).toString();  
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
<form name="form1" action="<%=basePath%>ComServlet" method="post">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody> 
    <TR bgColor=#ffffff><input type="hidden" name="method" value="<%=method %>"> <input type="hidden" name="id" value="<%=id %>"> 
      <td  class="font1"  width="35%" height="23" align=right>预算名称：</td>
      <td  class="font1"  align=left><input type="text" name="ysmc" size="50" maxlength="30" value="<%=ysmc %>"></td>
    </tr>
    <tr bgColor=#ffffff>
      <td  class="font1"  width="35%" height="23" align=right>活动名称：</td>
      <td  class="font1"  align=left><input type="text" name="ysnd" size="50" maxlength="30" value="<%=ysnd %>"></td>
    </tr>
    <tr bgColor=#ffffff>
      <td  class="font1"  width="35%" height="23" align=right>预算金额：</td>
      <td  class="font1"  align=left><input type="text" name="ysje" size="20" maxlength="30" value="<%=ysje %>" onKeyUp="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"> </td>
    </tr>
    <tr bgColor=#ffffff>
      <td  class="font1"  width="35%" height="23" align=right>预算详细：</td>
      <td  class="font1"  align=left><textarea name="xx" cols=50 rows=8><%=xx %></textarea></td>
    </tr> 
    <tr bgColor=#ffffff>
      <td  class="font1"  colspan="2" height="23" align=center>
      <input type="button" value="确定" onClick="check()"></td>
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
