package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;

public class ComServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ComServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addnj")){//登记部门  
			 String zchm = request.getParameter("zchm");  
			 String sfxm = request.getParameter("sfxm");   
			 String sfje = request.getParameter("sfje"); 
			 String str=cBean.getString("select id from nj where zchm='"+zchm+"'");
			 if(str==null){
				 int flag=cBean.comUp("insert into nj(zchm,sfxm,sfje,sj) " +
					 		"values('"+zchm+"','"+sfxm+"','"+sfje+"','"+date+"')");
						if(flag == Constant.SUCCESS){ 
							request.setAttribute("message", "操作成功！");
							request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
						}
						else { 
							request.setAttribute("message", "操作失败！");
							request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
						}
			 }
			 else{ 
				request.setAttribute("message", "部门名称重复！");
				request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response);  
			 } 
		 }
		 //修改部门
		 else if(method.equals("upnj")){ 
			 String id = request.getParameter("id");  
			 String zchm = request.getParameter("zchm");  
			 String sfxm = request.getParameter("sfxm");   
			 String sfje = request.getParameter("sfje"); 
			 String str=cBean.getString("select id from nj where zchm='"+zchm+"' and id!='"+id+"'");
			 if(str==null){
			 int flag=cBean.comUp("update nj set zchm='"+zchm+"',sfxm='"+sfxm+"', sfje='"+sfje+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
				}
			 }
			 else{ 
				request.setAttribute("message", "部门名称重复！");
				request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response);  
			 }
		 }
		 
		 //删除部门
		 else if(method.equals("delnj")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from nj  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/nj/index.jsp").forward(request, response); 
				}
		 }
		
		 else if(method.equals("addbmyh")){//部门用户 
			 //String bmmc="";String usernam="";String password="";String realname="";String sex="";String age="";String address="";String tel="";
			 	String bmmc = request.getParameter("bmmc"); 
			 	String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel");
				String str=cBean.getString("select id from bmyh where  username='"+username+"'");
				if(str==null){
					int flag=cBean.comUp("insert into bmyh(bmmc,username,password,realname,sex,age,address,tel,addtime) " +
							"values('"+bmmc+"','"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+tel+"','"+date+"')");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
					}
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
				} 
		 }
		 //修改部门用户
		 else if(method.equals("upbmyh")){ 
			 String id = request.getParameter("id");  
			 String bmmc = request.getParameter("bmmc"); 
			 	String username = request.getParameter("username"); 
				String password = request.getParameter("password"); 
				String realname = request.getParameter("realname"); 
				String sex = request.getParameter("sex"); 
				String age = request.getParameter("age"); 
				String address = request.getParameter("address"); 
				String tel = request.getParameter("tel");
				String str=cBean.getString("select bmmc from bmyh where username='"+username+"' and id!='"+id+"'");
				if(str==null){
					int flag=cBean.comUp("update bmyh set bmmc='"+bmmc+"',username='"+username+"',password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
							"address='"+address+"',tel='"+tel+"' where id='"+id+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
					}
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
				} 
		 }
		 
		 //删除部门用户
		 else if(method.equals("delbmyh")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from bmyh  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/bmyh/index.jsp").forward(request, response); 
				}
		 }
		
		 else if(method.equals("uppwd")){//修改密码
				String username=(String)session.getAttribute("user"); 
				String oldpwd = request.getParameter("oldpwd"); 
				String newpwd = request.getParameter("newpwd"); 
				String str=cBean.getString("select id from bmyh where username='"+username+"' and  password='"+oldpwd+"'");
				if(str==null){
					request.setAttribute("message", "原始密码信息错误！");
					request.getRequestDispatcher("admin/bmyh/editpwd.jsp").forward(request, response); 
				}
				else{
					int flag=cBean.comUp("update bmyh set password='"+newpwd+"' where username='"+username+"'");
					if(flag == Constant.SUCCESS){ 
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/bmyh/editpwd.jsp").forward(request, response); 
					}
					else { 
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/bmyh/editpwd.jsp").forward(request, response); 
					}
				}
			}
		/////////////////////////////////////////////////////////////////////////////////////////////////////////////
		 
		///////////////////////////////////////////////////////////////////////////////////////
		else if(method.equals("addndys")){//年度预算
			 //String ysmc="";String ysnd="";String ysje=""; String xx="";  
			 String ysmc = request.getParameter("ysmc");  
			 String ysnd = request.getParameter("ysnd");   
			 String ysje = request.getParameter("ysje");   
			 String xx = request.getParameter("xx");    
			 
			 String username=(String)session.getAttribute("user"); 
			 String bmmc=(String)session.getAttribute("bmmc"); 
			 int flag=cBean.comUp("insert into ndys(ysmc,ysnd,ysje,xx,sj,bmyh,bmmc,spjg,spsj,spr) " +
			 		"values('"+ysmc+"','"+ysnd+"','"+ysje+"','"+xx+"','"+date2+"','"+username+"','"+bmmc+"','未审批','暂无','暂无' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
		 }
		 //修改年度预算
		 else if(method.equals("upndys")){ 
			 String id = request.getParameter("id");  
			 String ysmc = request.getParameter("ysmc");  
			 String ysnd = request.getParameter("ysnd");   
			 String ysje = request.getParameter("ysje");   
			 String xx = request.getParameter("xx");    
			 int flag=cBean.comUp("update ndys set ysmc='"+ysmc+"',ysnd='"+ysnd+"', ysje='"+ysje+"', xx='"+xx+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
		 }
		 
		 //删除年度预算
		 else if(method.equals("delndys")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from ndys  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ndys/index.jsp").forward(request, response); 
				}
		 }
		
		  
		
		 else if(method.equals("addhdys")){//活动预算
			 //String ysmc="";String ysnd="";String ysje=""; String xx="";  
			 String ysmc = request.getParameter("ysmc");  
			 String ysnd = request.getParameter("ysnd");   
			 String ysje = request.getParameter("ysje");   
			 String xx = request.getParameter("xx");    
			 
			 String username=(String)session.getAttribute("user"); 
			 String bmmc=(String)session.getAttribute("bmmc"); 
			 int flag=cBean.comUp("insert into hdys(ysmc,ysnd,ysje,xx,sj,bmyh,bmmc,spjg,spsj,spr) " +
			 		"values('"+ysmc+"','"+ysnd+"','"+ysje+"','"+xx+"','"+date2+"','"+username+"','"+bmmc+"','未审批','暂无','暂无' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
		 }
		 //修改活动预算
		 else if(method.equals("uphdys")){ 
			 String id = request.getParameter("id");  
			 String ysmc = request.getParameter("ysmc");  
			 String ysnd = request.getParameter("ysnd");   
			 String ysje = request.getParameter("ysje");   
			 String xx = request.getParameter("xx");    
			 int flag=cBean.comUp("update hdys set ysmc='"+ysmc+"',ysnd='"+ysnd+"', ysje='"+ysje+"', xx='"+xx+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
		 }
		 
		 //删除活动预算
		 else if(method.equals("delhdys")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from hdys  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hdys/index.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("delhdys2")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from hdys  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hdys/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hdys/index2.jsp").forward(request, response); 
				}
		 } 
		///审批
		 else if(method.equals("spjg")){ 
			 String id = request.getParameter("id");   
			 String spjg = request.getParameter("spjg");  
			 String username=(String)session.getAttribute("user");
			 int flag=cBean.comUp("update hdys set spjg='"+spjg+"',spsj='"+date2+"',spr='"+username+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hdys/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hdys/index2.jsp").forward(request, response); 
				}
		 } 
		//////////////////----------------------
		 else if(method.equals("delndys2")){ //删除年度预算 管理员
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from ndys  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ndys/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ndys/index2.jsp").forward(request, response); 
				}
		 } 
		///审批
		 else if(method.equals("spjg2")){ //审批年度预算 管理员
			 String id = request.getParameter("id");   
			 String spjg = request.getParameter("spjg");  
			 String username=(String)session.getAttribute("user");
			 int flag=cBean.comUp("update ndys set spjg='"+spjg+"',spsj='"+date2+"',spr='"+username+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/ndys/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/ndys/index2.jsp").forward(request, response); 
				}
		 } 
		
		
		
		
		
		
		
		
		
		/////////////////////////////借款信息
		 else if(method.equals("addjk")){//借款
			 //String jklx="";String jkxm="";String jkje="";   
			 String jklx = request.getParameter("jklx");  
			 String jkxm = request.getParameter("jkxm");   
			 String jkje = request.getParameter("jkje");    
			 
			 String username=(String)session.getAttribute("user"); 
			 String bmmc=(String)session.getAttribute("bmmc"); 
			 int flag=cBean.comUp("insert into jk(jklx,jkxm,jkje ,sj,bmyh,bmmc,spjg,spsj,spr) " +
			 		"values('"+jklx+"','"+jkxm+"','"+jkje+"' ,'"+date2+"','"+username+"','"+bmmc+"','未审批','暂无','暂无' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
		 }
		 //修改借款
		 else if(method.equals("upjk")){ 
			 String id = request.getParameter("id");  
			 String jklx = request.getParameter("jklx");  
			 String jkxm = request.getParameter("jkxm");   
			 String jkje = request.getParameter("jkje");    
			 int flag=cBean.comUp("update jk set jklx='"+jklx+"',jkxm='"+jkxm+"', jkje='"+jkje+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
		 }
		 
		 //删除借款
		 else if(method.equals("deljk")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from jk  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jk/index.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("deljk2")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from jk  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jk/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jk/index2.jsp").forward(request, response); 
				}
		 } 
		///审批
		 else if(method.equals("spjk")){ 
			 String id = request.getParameter("id");   
			 String spjg = request.getParameter("spjg");  
			 String username=(String)session.getAttribute("user");
			 int flag=cBean.comUp("update jk set spjg='"+spjg+"',spsj='"+date2+"',spr='"+username+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/jk/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/jk/index2.jsp").forward(request, response); 
				}
		 } 
		
		
		/////////////////
/////////////////////////////还款信息
		 else if(method.equals("addhk")){//还款
			 //String hklx="";String hkxm="";String hkje="";   
			 String hklx = request.getParameter("hklx");  
			 String hkxm = request.getParameter("hkxm");   
			 String hkje = request.getParameter("hkje");    
			 
			 String username=(String)session.getAttribute("user"); 
			 String bmmc=(String)session.getAttribute("bmmc"); 
			 int flag=cBean.comUp("insert into hk(hklx,hkxm,hkje ,sj,bmyh,bmmc,spjg,spsj,spr) " +
			 		"values('"+hklx+"','"+hkxm+"','"+hkje+"' ,'"+date2+"','"+username+"','"+bmmc+"','未审批','暂无','暂无' )");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
		 }
		 //修改还款
		 else if(method.equals("uphk")){ 
			 String id = request.getParameter("id");  
			 String hklx = request.getParameter("hklx");  
			 String hkxm = request.getParameter("hkxm");   
			 String hkje = request.getParameter("hkje");    
			 int flag=cBean.comUp("update hk set hklx='"+hklx+"',hkxm='"+hkxm+"', hkje='"+hkje+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
		 }
		 
		 //删除还款
		 else if(method.equals("delhk")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from hk  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hk/index.jsp").forward(request, response); 
				}
		 }
		 else if(method.equals("delhk2")){ 
			 String id = request.getParameter("id");   
			 int flag=cBean.comUp("delete from hk  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hk/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hk/index2.jsp").forward(request, response); 
				}
		 } 
		///审批
		 else if(method.equals("sphk")){ 
			 String id = request.getParameter("id");   
			 String spjg = request.getParameter("spjg");  
			 String username=(String)session.getAttribute("user");
			 int flag=cBean.comUp("update hk set spjg='"+spjg+"',spsj='"+date2+"',spr='"+username+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){ 
					request.setAttribute("message", "操作成功！");
					request.getRequestDispatcher("admin/hk/index2.jsp").forward(request, response); 
				}
				else { 
					request.setAttribute("message", "操作失败！");
					request.getRequestDispatcher("admin/hk/index2.jsp").forward(request, response); 
				}
		 } 
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
