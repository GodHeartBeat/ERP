<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="com.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
 
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>会员管理中心</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="<%=basePath %>member/images/css1/css.css" rel="stylesheet" type="text/css"> 
<SCRIPT language=JavaScript src="<%=basePath %>admin/images/calendar.js"></SCRIPT>
<SCRIPT language=javascript>
//检验表单的合法性
function check() {
if (document.form1.bmmc.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请选择部门！");
		document.form1.bmmc.focus();
		return false;
	}
	if (document.form1.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写登录帐号名！");
		document.form1.username.focus();
		return false;
	}
	if (document.form1.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写登录密码！");
		document.form1.password.focus();
		return false;
	} 
	if (document.form1.realname.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写真实姓名！");
		document.form1.realname.focus();
		return false;
	} 
	if (document.form1.age.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写年龄！");
		document.form1.age.focus();
		return false;
	} 
	if (document.form1.address.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写联系地址！");
		document.form1.address.focus();
		return false;
	} 
	if (document.form1.tel.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请填写联系电话！");
		document.form1.tel.focus();
		return false;
	} 
}
</SCRIPT>

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
	String method=request.getParameter("method");
		String id="";
		String bmmc="";String usernam="";String password="";String realname="";String sex="";String age="";String address="";String tel="";
		if(method.equals("upbmyh")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from bmyh where id='"+id+"'",9);
			bmmc=alist.get(1).toString();
			usernam=alist.get(2).toString();
			password=alist.get(3).toString();
			realname=alist.get(4).toString();
			sex=alist.get(5).toString();
			age=alist.get(6).toString();
			address=alist.get(7).toString();
			tel=alist.get(8).toString();
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
<form action="<%=basePath%>ComServlet" name="form1" method="post" onsubmit="return check()">
<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#BBD3EB">
  <tbody><input type="hidden" name="method" value="<%=method %>" /> 
    <input type="hidden" name="id" value="<%=id %>" /> 
     
     <tr bgColor=#ffffff>
      <td class="font1" width="45%" height="23" align=right>所属部门：</td>
      <td class="font1" align=left><select name=bmmc>
<%if(method.equals("upwz")){ %><option value=<%=bmmc %>><%=bmmc %></option><%} %>	
    <%List list1=cb.getCom("select * from nj order by id desc",2);if(!list1.isEmpty()){for(int i=0;i<list1.size();i++){List list2 =(List)list1.get(i); %>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td>
    </tr> 
    <TR bgColor=#ffffff>
      <TD class="font1" height="26" width="45%" align=right>登录帐号：</td>
      <TD class="font1" align=left><input type="text" size="30" name="username" value="<%=usernam %>"></td>
    </tr>
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">初始密码：</td>
      <TD class="font1" align=left><input type="password" size="30" name="password" value="<%=password %>"></td>
    </tr>
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">真实姓名：</td>
      <TD class="font1" align=left><input type="text" size="30" name="realname" value="<%=realname %>"></td>
    </tr>
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">用户性别：</td>
      <TD class="font1" align=left><input type="radio" name="sex" value="男" checked="checked"> 男 <input type="radio" name="sex" value="女"> 女</td>
    </tr>
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">用户年龄：</td>
      <TD class="font1" align=left><input type="text" size="30" name="age" value="<%=age %>"></TD>
    </tr>
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">联系地址：</td>
      <TD class="font1" align=left><input type="text" size="30" name="address" value="<%=address %>"></TD>
    </tr> 
    <TR bgColor=#ffffff>
      <TD class="font1" width="45%" align=right height="26">联系电话：</td>
      <TD class="font1" align=left><input type="text" size="30" name="tel" value="<%=tel %>"></TD>
    </tr>  
    <TR bgColor=#ffffff>
      <td class="font1" colspan="2" align=center height="26">
      <input type="submit" value="确定"></td>
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
