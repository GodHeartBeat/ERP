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
{//String zchm="";String qymc="";String zcrq="";String sxrq="";String yyqx="";String fr="";String zczj="";
//	String gsdh="";
//	String jyfs="";String qylx="";String jyfw="";String dz="";String dh="";String dlmc="";String lc="";String fjh="";String bs="";String dah=""; 
	if(document.form1.hklx.value==""||document.form1.hkxm.value==""||document.form1.hkje.value=="" )
	{
		alert("全部内容都要填写！");
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
	String id="";
	String hklx="";String hkxm="";String hkje="";  
		if(method.equals("uphk")){
			id=request.getParameter("id");
			List wzlist=cb.get1Com("select * from hk where id='"+id+"'",5);
			hklx=wzlist.get(1).toString();
			hkxm=wzlist.get(2).toString();
			hkje=wzlist.get(3).toString(); 
		}
%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
   
  <tr>
	<td background="<%=basePath %>admin/images/index1_45.gif"></td>
	<td bgcolor="#FFFFFF" style="height:490px; vertical-align:top;">
	  <table width="100%" border="0" cellspacing="10" cellpadding="0"> 
		<tr>
		  <td>
<form action="<%=basePath%>ComServlet" name="form1" method="post" >
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody><input type="hidden" name="method" value="<%=method %>" /> 
    <input type="hidden" name="id" value="<%=id %>" /> 
     
     <tr bgColor=#ffffff>
      <td class="font1" width="45%" height="23" align=right>还款类型：</td>
      <td class="font1" align=left><select name=hklx>
<%if(method.equals("uphk")){ %><option value=<%=hklx %>><%=hklx %></option><%} %> 
    <option value=预算余额还款>预算余额还款</option>
    <option value=部门收益资金上缴>部门收益资金上缴</option> 
    </select></td>
    </tr> 
     <tr bgColor=#ffffff>
      <td class="font1" width="45%" height="23" align=right>信息主题：</td>
      <td class="font1" align=left><input type="text" name="hkxm" size="50" maxlength="50" value="<%=hkxm %>" size=50></td>
    </tr> 
    <tr bgColor=#ffffff>
      <td class="font1" width="45%" height="23" align=right>还款金额：</td>
      <td class="font1" align=left><input type="text" name="hkje" size="20" maxlength="50" value="<%=hkje %>" onKeyUp="if(!(/^[\d]+\.?\d*$/.test(this.value))){alert('您的输入有误');this.value='';this.focus();}"></td>
    </tr>  
    <tr bgColor=#ffffff>
      <td class="font1" colspan="2" height="23" align=center>
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
