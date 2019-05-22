<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="iframe/head.jsp" %>  
<SCRIPT language=javascript>
//检验表单的合法性
function checklogin() {
	if (document.loginform.username.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的登陆账号！");
		document.loginform.username.focus();
		return false;
	}
	if (document.loginform.password.value.replace(/\s+$|^\s+/g,"").length<=0) {
		alert("\请输入您的密码！");
		document.loginform.password.focus();
		return false;
	} 
}
</SCRIPT>
  <FORM name="loginform" method="post" action="<%=basePath %>AdminServlet" onSubmit="return checklogin();"> 
  <TABLE align=center height="180">
    <TBODY>
    <TR>
	  <TD width="20%" align="right">登陆账号：</TD>
	  <TD align="left"><input type="text" size="30" name="username"></TD>
	</TR>
	<TR>
	  <TD width="20%" align="right">登录密码：</TD><input type=hidden name=method value=one />
	  <TD align="left"><input type="password" size="33" name="password"></TD>
	</TR> 
	<TR>
	  <TD width="20%" align="right">用户身份：</TD>
	  <TD align="left"><select name="sf">
	  <option value="部门用户">部门用户</option>
	  <option value="系统管理员">系统管理员</option>
	  </select></TD>
	</TR> 
    <TR>
      <TD align="center" colspan="2"><INPUT value="提交登录" type=submit> </TD>
	</TR>
	</TBODY>
  </TABLE>
  </FORM>
<%@ include file="iframe/foot.jsp"%>
