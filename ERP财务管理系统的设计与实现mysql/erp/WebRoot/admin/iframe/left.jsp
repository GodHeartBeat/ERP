<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<LINK href="<%=basePath %>admin/images/admin.css" type="text/css" rel="stylesheet">
<SCRIPT language=javascript>
	function expand(el)
	{
		childObj = document.getElementById("child" + el);

		if (childObj.style.display == 'none')
		{
			childObj.style.display = 'block';
		}
		else
		{
			childObj.style.display = 'none';
		}
		return;
	}
</SCRIPT>
</HEAD>
<%
	String username=(String)session.getAttribute("user"); String sf=(String)session.getAttribute("sf"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>
<body>
<TABLE height="100%" cellSpacing=0 cellPadding=0 width=170 background=<%=basePath %>admin/images/menu_bg.jpg border=0>
  <TR>
    <TD vAlign=top align=middle>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0><TR><TD height=10></TD></TR></TABLE> 
      <%if(sf.equals("ϵͳ����Ա")){ %> 
      <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">�û��������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">�޸ĵ�½����</A></TD></TR>
    
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(6) href="javascript:void(0);">ϵͳ�û�����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child6 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/index.jsp" target="MainFrame">ϵͳ�û�����</A></TD>
		</TR>
		 <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">����ϵͳ�û�</A></TD>
		</TR>  
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(7) href="javascript:void(0);">ϵͳ��Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/affiche/index.jsp" target="MainFrame">ϵͳ��Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/affiche/add.jsp?method=addaff" target="MainFrame">����ϵͳ��Ϣ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(184) href="javascript:void(0);">������Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child184 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/nj/index.jsp" target="MainFrame">������Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/nj/add.jsp?method=addnj" target="MainFrame">������Ϣ�Ǽ�</A></TD>
		</TR> <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/nj/s.jsp" target="MainFrame">������Ϣ��ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1174) href="javascript:void(0);">�����û�����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1174 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bmyh/index.jsp" target="MainFrame">�����û�����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bmyh/add.jsp?method=addbmyh" target="MainFrame">�����û��Ǽ�</A></TD>
		</TR> <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bmyh/s.jsp" target="MainFrame">�����û���ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(154) href="javascript:void(0);">�Ԥ������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child154 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hdys/index2.jsp" target="MainFrame">�Ԥ��������Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hdys/s2.jsp" target="MainFrame">�Ԥ�������ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(124) href="javascript:void(0);">���Ԥ������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child124 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/ndys/index2.jsp" target="MainFrame">���Ԥ��������Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/ndys/s2.jsp" target="MainFrame">���Ԥ�������ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(134) href="javascript:void(0);">�����Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child134 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jk/index2.jsp" target="MainFrame">�����Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jk/s2.jsp" target="MainFrame">�����Ϣ��ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(144) href="javascript:void(0);">������Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child144 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hk/index2.jsp" target="MainFrame">������Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hk/s2.jsp" target="MainFrame">������Ϣ��ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(84) href="javascript:void(0);">������Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child84 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/index.jsp" target="MainFrame">������Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s.jsp" target="MainFrame">�������Ԥ��ͳ��</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s1.jsp" target="MainFrame">���ŻԤ��ͳ��</A></TD>
		</TR>
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s2.jsp" target="MainFrame">���Ž��ͳ��</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s3.jsp" target="MainFrame">��������ͳ��</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s4.jsp" target="MainFrame">�������Ԥ��Ա�</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s5.jsp" target="MainFrame">���ŻԤ��Ա�</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s6.jsp" target="MainFrame">���Ž��Ա�</A></TD>
		</TR>  
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/js/s7.jsp" target="MainFrame">��������Ա�</A></TD>
		</TR>   
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  
	  <%}else { %>  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(1) href="javascript:void(0);">�û��������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child1 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/bmyh/editpwd.jsp" target="MainFrame">�޸ĵ�½����</A></TD></TR>
    
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(7) href="javascript:void(0);">ϵͳ��Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child7 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/affiche/index2.jsp" target="MainFrame">ϵͳ��Ϣ����</A></TD>
		</TR>  
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
       
        <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(174) href="javascript:void(0);">���Ԥ������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child174 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/ndys/index.jsp" target="MainFrame">���Ԥ��������Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/ndys/add.jsp?method=addndys" target="MainFrame">¼�����Ԥ������</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/ndys/s.jsp" target="MainFrame">���Ԥ�������ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
       
        
	   
	  
	   
	   
	  
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(114) href="javascript:void(0);">�Ԥ������</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child114 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hdys/index.jsp" target="MainFrame">�Ԥ��������Ϣ</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hdys/add.jsp?method=addhdys" target="MainFrame">¼��Ԥ������</A></TD>
		</TR> <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hdys/s.jsp" target="MainFrame">�Ԥ�������ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	   
	  
	  
	  <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(194) href="javascript:void(0);">�����Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child194 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0> 
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jk/index.jsp" target="MainFrame">�����Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jk/add.jsp?method=addjk" target="MainFrame">�����Ϣ�Ǽ�</A></TD>
		</TR> <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/jk/s.jsp" target="MainFrame">�����Ϣ��ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE> 
	  
	  
	   <TABLE cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=22>
          <TD style="PADDING-LEFT: 30px" background=<%=basePath %>admin/images/menu_bt.jpg>
          <A class=menuParent onclick=expand(34) href="javascript:void(0);">������Ϣ����</A></TD>
		</TR>
        <TR height=4><TD></TD></TR>
	  </TABLE>
      <TABLE id=child34 style="DISPLAY: none" cellSpacing=0 cellPadding=0 width=150 border=0>
        <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hk/index.jsp" target="MainFrame">������Ϣ����</A></TD>
		</TR> 
		<TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hk/add.jsp?method=addhk" target="MainFrame">������Ϣ�Ǽ�</A></TD>
		</TR> <TR height=20>
          <TD align=middle width=30><IMG height=9 src="<%=basePath %>admin/images/menu_icon.gif" width=9></TD>
          <TD><A class=menuChild href="<%=basePath %>admin/hk/s.jsp" target="MainFrame">������Ϣ��ѯ</A></TD>
		</TR> 
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
        <TR height=4>
          <TD colSpan=2></TD>
		</TR>
	  </TABLE>
	  <%} %>
       </TD>
     </TR> 
</TABLE>
</body>
<%} %>
</HTML>
