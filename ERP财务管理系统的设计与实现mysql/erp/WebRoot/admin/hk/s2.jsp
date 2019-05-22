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
{//String mc="";String zz="";String lx=""; String sj=""; String ym=""; String zy=""; String pic=""; String bz=""; 
	 
	  
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
<form action="<%=basePath%>admin/hk/sinfo2.jsp" name="form1" method="post" >
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
    
    
    <tr>
      <td class="td_bg" width="35%" height="23" align=right>信息主题关键字：</td>
      <td class="td_bg" align=left><select name=bmmc> 
    <%List list1=cb.getCom("select * from nj order by id desc",2);if(!list1.isEmpty()){for(int i=0;i<list1.size();i++){List list2 =(List)list1.get(i); %>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select> <input type="text" name="mc" size="50" maxlength="30" > <input type="button" value="确定" onClick="check()"> </td>
    </tr>
    
    <tr>
      <td class="td_bg" colspan="2" height="23" align=center>
      不填写信息主题则默认查询该部门全部</td>
    </tr> 
  </tbody>
</table>
</form>
</body>
<%} %>
