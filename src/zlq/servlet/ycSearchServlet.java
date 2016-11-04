package zlq.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




import zlq.bean.YichangDao;
import zlq.bean.YichangDaoFactory;
import zlq.bean.Yichang;

public class ycSearchServlet extends HttpServlet{

	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public ycSearchServlet() {
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
		String stationName = request.getParameter("stationName");
		session.setAttribute("stationName", stationName);
		String ycName   = request.getParameter("ycName");
		session.setAttribute("ycName", ycName);
		String level   = request.getParameter("typeName");
		session.setAttribute("level", level);
		String period1  = request.getParameter("period1");
		session.setAttribute("period1", period1);
		String period2  = request.getParameter("period2");
		session.setAttribute("period2", period2);
		long startTime=System.nanoTime();   //获取开始时间
		YichangDao yichangDao = YichangDaoFactory.getYichangDao();
		List<Yichang> ycList = yichangDao.ycSearch(stationName,ycName,level,period1,period2);
    	 
    	
    	if(!ycList.isEmpty()){
    		request.setAttribute("ycList", ycList);
    		request.getRequestDispatcher("yichangSearchResult.jsp").forward(request, response);
    		//response.sendRedirect("resultByDay.jsp");//这种方法貌似传不过去值
    	}else{
			response.sendRedirect("notFoundPage.jsp");
		}
    	long endTime=System.nanoTime(); //获取结束时间

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
