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
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
<script type="text/javascript">
function check()
{//String mc="";String zz="";String lx=""; String sj=""; String ym=""; String zy=""; String pic=""; String bz=""; 
	 
	  if(document.form1.ksj.value.replace(/\s+$|^\s+/g,"").length<=0||document.form1.esj.value.replace(/\s+$|^\s+/g,"").length<=0)
	{
		alert("请输入起止时间！");
	//	document.form1.title.focus();
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
<form action="<%=basePath%>admin/js/sinfo1.jsp" name="form1" method="post" >
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody> 
    
    
    <tr>
      <td class="td_bg" width="25%" height="23" align=right>部门名称：</td>
      <td class="td_bg" align=left><select name=bmmc> 
      <option value="">全部</option>
    <%List list1=cb.getCom("select * from nj order by id desc",2);if(!list1.isEmpty()){for(int i=0;i<list1.size();i++){List list2 =(List)list1.get(i); %>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select> 统计时间段：<input type=text size=20 maxlength=50 name=ksj  readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";> - 
			<input type=text size=20 maxlength=50 name=esj   readonly onclick="SelectDate(this,'yyyy-MM-dd')"  this.Txt_Date.Attributes["onclick"] = "SelectDate(this,'yyyy-MM-dd')";>  <input type="button" value="确定" onClick="check()"> </td>
    </tr>
    
    
  </tbody>
</table>
</form>
</body>
<%} %>
