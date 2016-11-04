package zlq.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import zlq.bean.ElecDao;

import zlq.bean.ElecDaoFactory;

import zlq.bean.Elec;

public class BaseMXServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public BaseMXServlet() {
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

		doPost(request, response);
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

		HttpSession session=request.getSession(); 
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		String basename = (String)session.getAttribute("baseName");
		String checkername   =  (String)session.getAttribute("checkerName");
		String starttime  = (String)session.getAttribute("startTime");
		String endtime  = (String)session.getAttribute("endTime");
		ElecDao elecDao = ElecDaoFactory.getElecDaoInstance();							
		List<Elec> eleclist = elecDao.elecSearch(basename,checkername,starttime,endtime);
	    if(!eleclist.isEmpty()){
	    	request.setAttribute("eleclist", eleclist);
			request.getRequestDispatcher("BaseMX.jsp").forward(request, response);			    
	    }else{
			response.sendRedirect("notFoundPage.jsp");    		
	    }
    		//response.sendRedirect("resultByDay.jsp");//这种方法貌似传不过去值
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
