package zlq.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import zlq.bean.XunjianDaoFactory;
import zlq.bean.XunjianDao;
import zlq.bean.Xunjian;

public class xunjianMXServlet extends HttpServlet{

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public xunjianMXServlet() {
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
		String stationName = session.getAttribute("stationName").toString();
		String level = session.getAttribute("level").toString();
		String xjName   = session.getAttribute("xjName").toString();
		String period1  = session.getAttribute("period1").toString();
		String period2  = session.getAttribute("period2").toString();
		XunjianDao xunjianDao = XunjianDaoFactory.getXunjianDao();
		List<Xunjian> xjList = xunjianDao.MxxjSearch(period1, period2,xjName,stationName,level);
    	 
    	if(!xjList.isEmpty()){
    		request.setAttribute("xjList", xjList);
    		request.getRequestDispatcher("xunjianSearchedResult.jsp").forward(request, response);
    		//response.sendRedirect("resultByDay.jsp");//这种方法貌似传不过去值
    	}else{
			response.sendRedirect("notFoundPage.jsp");
		}
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
