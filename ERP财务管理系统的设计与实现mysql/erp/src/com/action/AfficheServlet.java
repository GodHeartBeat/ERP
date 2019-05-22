package com.action;

/**
 * 网站公告
 * @author Administrator
 *
 */

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant; 

public class AfficheServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AfficheServlet() {
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
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
				ComBean cBean = new ComBean();
				String method = request.getParameter("method");
				if(method.equals("addaff")){//增加公告
					String title = request.getParameter("title");
					String content = request.getParameter("content");
					String username2 = (String)session.getAttribute("user"); 
					int flag = cBean.comUp("insert into affiche(title,content,addtime,adder) " +
							"values('"+title+"','"+content+"','"+date+"','"+username2+"')");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
					}
					else{
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
					}
				}
				else if(method.equals("upaff")){//修改公告
					String id=request.getParameter("id");
					String title = request.getParameter("title");
					String content = request.getParameter("content"); 
					int flag = cBean.comUp("update affiche set title='"+title+"',content='"+content+"' where id='"+id+"'");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
					}
					else{
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
					}
				}
				else if(method.equals("delaff")){
					String id = request.getParameter("id");
					int flag = cBean.comUp("delete from affiche where id='"+id+"'");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
					}
					else{
						request.setAttribute("message", "系统维护中，请稍后再试！");
						request.getRequestDispatcher("admin/affiche/index.jsp").forward(request, response);
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
