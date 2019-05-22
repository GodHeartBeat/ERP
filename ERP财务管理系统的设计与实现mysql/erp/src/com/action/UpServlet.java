package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.ComBean;
import com.util.Constant;
import com.util.SmartFile;
import com.util.SmartUpload;

public class UpServlet extends HttpServlet {

	private ServletConfig config;
	/**
	 * Constructor of the object.
	 */
	public UpServlet() {
		super();
	}

	final public void init(ServletConfig config) throws ServletException
    {
        this.config = config;  
    }

    final public ServletConfig getServletConfig()
    {
        return config;
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

		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		response.setContentType(Constant.CONTENTTYPE);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		String method = "";;
		 ComBean cb = new ComBean(); 
		 SmartUpload mySmartUpload = new SmartUpload();//init
		 int count = 0;
		 HttpSession session = request.getSession();
		 try{
			 mySmartUpload.initialize(config,request,response);
            mySmartUpload.upload(); 
            method = mySmartUpload.getRequest().getParameter("method").trim();
           if(method.equals("addwx")){// 
        	  
//        	 String mc="";String zz="";String lx=""; String sj=""; String ym=""; String zy=""; String pic=""; String bz=""; 
        	   String mc = mySmartUpload.getRequest().getParameter("mc");
				String zz = mySmartUpload.getRequest().getParameter("zz"); 
				String lx = mySmartUpload.getRequest().getParameter("lx"); 
				String sj = mySmartUpload.getRequest().getParameter("sj"); 
				String ym = mySmartUpload.getRequest().getParameter("ym"); 
				String zy = mySmartUpload.getRequest().getParameter("zy"); 
				String bz = mySmartUpload.getRequest().getParameter("bz"); 
				String member=(String)session.getAttribute("member");  
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                 
                		int ff = cb.comUp("insert into wx(mc, zz,lx,sj,ym,zy,url,bz,member,drsj)" +
    	                		" values('"+mc+"','"+zz+"','"+lx+"','"+sj+"','"+ym+"','"+zy+"','"+path+"/"+file.getFileName()+"','"+bz+"','"+member+"','"+date2+"')");
    						if(ff == Constant.SUCCESS){
    							request.setAttribute("message", "操作成功！");
    							request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
    						}
    						else{
    							request.setAttribute("message", "系统维护中，请稍后再试！");
    							request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
    						}
                 
                   
                   }
				 							
           else if(method.equals("upwx")){//修改  
        	   String id = mySmartUpload.getRequest().getParameter("id");
        	   String mc = mySmartUpload.getRequest().getParameter("mc");
				String zz = mySmartUpload.getRequest().getParameter("zz"); 
				String lx = mySmartUpload.getRequest().getParameter("lx"); 
				String sj = mySmartUpload.getRequest().getParameter("sj"); 
				String ym = mySmartUpload.getRequest().getParameter("ym"); 
				String zy = mySmartUpload.getRequest().getParameter("zy"); 
				String bz = mySmartUpload.getRequest().getParameter("bz"); 
				 
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                   
                	   if(count==0){
                    	   int ff = cb.comUp("update wx set mc='"+mc+"',zz='"+zz+"',lx='"+lx+"',sj='"+sj+"',ym='"+ym+"',zy='"+zy+"',bz='"+bz+"'  where id='"+id+"' ");
                         	if(ff == Constant.SUCCESS){
      						request.setAttribute("message", "操作成功！");
      						request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
      					}
      					else{
      						request.setAttribute("message", "系统维护中，请稍后再试！");
      						request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
      					}
                
                       }
                       else{
    	                	 //  int ff = cb.comUp("update wj set title='"+title+"',sm='"+sm+"',url='"+path+"/"+file.getFileName()+"' where id='"+id+"' ");
    	                	   int ff = cb.comUp("update wx set mc='"+mc+"',zz='"+zz+"',lx='"+lx+"',sj='"+sj+"',ym='"+ym+"',zy='"+zy+"',url='"+path+"/"+file.getFileName()+"',bz='"+bz+"'  where id='"+id+"' ");
    	                      	if(ff == Constant.SUCCESS){
    	   						request.setAttribute("message", "操作成功！");
    	   						request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
    	   					}
    	   					else{
    	   						request.setAttribute("message", "系统维护中，请稍后再试！");
    	   						request.getRequestDispatcher("member/wx/index.jsp").forward(request, response);
    	   					}
    	                   }
                    
                   }
          
           else if(method.equals("upwx2")){//修改  
        	   String id = mySmartUpload.getRequest().getParameter("id");
        	   String mc = mySmartUpload.getRequest().getParameter("mc");
				String zz = mySmartUpload.getRequest().getParameter("zz"); 
				String lx = mySmartUpload.getRequest().getParameter("lx"); 
				String sj = mySmartUpload.getRequest().getParameter("sj"); 
				String ym = mySmartUpload.getRequest().getParameter("ym"); 
				String zy = mySmartUpload.getRequest().getParameter("zy"); 
				String bz = mySmartUpload.getRequest().getParameter("bz"); 
				 
					SmartFile file = mySmartUpload.getFiles().getFile(0);
	            	String fileExt=file.getFileExt();	            
	            	String path="upfile";
                   count = mySmartUpload.save(path);
                   
                	   if(count==0){
                    	   int ff = cb.comUp("update wx set mc='"+mc+"',zz='"+zz+"',lx='"+lx+"',sj='"+sj+"',ym='"+ym+"',zy='"+zy+"',bz='"+bz+"'  where id='"+id+"' ");
                         	if(ff == Constant.SUCCESS){
      						request.setAttribute("message", "操作成功！");
      						request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
      					}
      					else{
      						request.setAttribute("message", "系统维护中，请稍后再试！");
      						request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
      					}
                
                       }
                       else{
    	                	 //  int ff = cb.comUp("update wj set title='"+title+"',sm='"+sm+"',url='"+path+"/"+file.getFileName()+"' where id='"+id+"' ");
    	                	   int ff = cb.comUp("update wx set mc='"+mc+"',zz='"+zz+"',lx='"+lx+"',sj='"+sj+"',ym='"+ym+"',zy='"+zy+"',url='"+path+"/"+file.getFileName()+"',bz='"+bz+"'  where id='"+id+"' ");
    	                      	if(ff == Constant.SUCCESS){
    	   						request.setAttribute("message", "操作成功！");
    	   						request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
    	   					}
    	   					else{
    	   						request.setAttribute("message", "系统维护中，请稍后再试！");
    	   						request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
    	   					}
    	                   }
                    
                   }
           else if(method.equals("addwx2")){// 
         	  
//          	 String mc="";String zz="";String lx=""; String sj=""; String ym=""; String zy=""; String pic=""; String bz=""; 
          	   String mc = mySmartUpload.getRequest().getParameter("mc");
  				String zz = mySmartUpload.getRequest().getParameter("zz"); 
  				String lx = mySmartUpload.getRequest().getParameter("lx"); 
  				String sj = mySmartUpload.getRequest().getParameter("sj"); 
  				String ym = mySmartUpload.getRequest().getParameter("ym"); 
  				String zy = mySmartUpload.getRequest().getParameter("zy"); 
  				String bz = mySmartUpload.getRequest().getParameter("bz"); 
  				String user=(String)session.getAttribute("user");  
  					SmartFile file = mySmartUpload.getFiles().getFile(0);
  	            	String fileExt=file.getFileExt();	            
  	            	String path="upfile";
                     count = mySmartUpload.save(path);
                   
                  		int ff = cb.comUp("insert into wx(mc, zz,lx,sj,ym,zy,url,bz,member,drsj)" +
      	                		" values('"+mc+"','"+zz+"','"+lx+"','"+sj+"','"+ym+"','"+zy+"','"+path+"/"+file.getFileName()+"','"+bz+"','"+user+"','"+date2+"')");
      						if(ff == Constant.SUCCESS){
      							request.setAttribute("message", "操作成功！");
      							request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
      						}
      						else{
      							request.setAttribute("message", "系统维护中，请稍后再试！");
      							request.getRequestDispatcher("admin/wx/index.jsp").forward(request, response);
      						}
                   
                     
                     }
  				 					
                      
		 }catch(Exception e){
				e.printStackTrace();
				request.getRequestDispatcher("error.jsp").forward(request, response);
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
