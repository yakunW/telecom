	package zlq.servlet;

	import java.io.IOException;
	import java.util.List;

	import javax.servlet.ServletException;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
    import javax.servlet.http.HttpSession;


    import zlq.bean.XunjianDao;

    import zlq.bean.XunjianDaoFactory;

    import zlq.bean.Xunjian;

	public class XjSearchServlet extends HttpServlet{

		

		/**
		 * 
		 */
		private static final long serialVersionUID = 1L;

		/**
		 * Constructor of the object.
		 */
		public XjSearchServlet() {
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
			String xjName   = request.getParameter("xjName");
			session.setAttribute("xjName", xjName);
			String level=request.getParameter("typeName");
			session.setAttribute("level", level);
			String period1  = request.getParameter("period1");
			session.setAttribute("period1", period1);
			String period2  = request.getParameter("period2");
			session.setAttribute("period2", period2);
			XunjianDao xunjianDao = XunjianDaoFactory.getXunjianDao();
			
			int count=xunjianDao.Getcount(period1, period2,xjName,stationName,level);				
	    	request.setAttribute("count", count);
	    	request.getRequestDispatcher("xunjianNum.jsp").forward(request, response);  	
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

