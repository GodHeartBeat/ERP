<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String method=request.getParameter("method");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>��Ա��������</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<SCRIPT language=JavaScript src="<%=basePath %>member/images/calendar.js"></SCRIPT>
<script type="text/javascript">
function check()
{//String mc="";String zz="";String lx=""; String sj=""; String ym=""; String zy=""; String pic=""; String bz=""; 
	 
	 if(document.form1.mc.value=="")
	 {
		alert("����дԤ�����ƹؼ��֣�");
		document.form1.mc.focus();
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
	
	String user=(String)session.getAttribute("user"); 
	if(user==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
	 
%>
<body>
<form action="<%=basePath%>admin/ndys/sinfo.jsp" name="form1" method="post" >
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
    
    
    <tr>
      <td class="td_bg" width="35%" height="23" align=right>Ԥ�����ƹؼ��֣�</td>
      <td class="td_bg" align=left><input type="text" name="mc" size="50" maxlength="30" ></td>
    </tr>
    
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center>
      <input type="button" value="ȷ��" onClick="check()"></td>
    </tr> 
  </tbody>
</table>
</form>
</body>
<%} %>
