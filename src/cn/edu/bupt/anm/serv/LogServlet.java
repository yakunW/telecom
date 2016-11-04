package cn.edu.bupt.anm.serv;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.bupt.anm.dao.Dao;
import cn.edu.bupt.anm.factory.DaoFactory;
import cn.edu.bupt.anm.po.Log;

/**
 * Servlet implementation class logServlet
 */
@WebServlet("/logServlet")
public class LogServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LogServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

//		//privacy用于区分管理员操作的权限区别
//		int privacy = Integer.parseInt(session.getAttribute("Privacy").toString());
//		privacy--;
		if("list".equals(action)){
    		new DaoFactory();
			Dao dao = DaoFactory.getLogsDaoInstance();
			String sql = null;
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM log";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------分页--------------------------------------------
			
			sql = "SELECT date,message FROM log " + " order by date desc"+" LIMIT "+firstCount+","+pageSize;
			List<Log> logs = dao.list(sql);
			Iterator<Log> iter = logs.iterator();
			
			for(int i=1;iter.hasNext();i++) {
				Log log = iter.next();
//				System.out.println(log.getDate());
			}
			
			request.setAttribute("logList", logs);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
//    		if(!iter.hasNext())
//				session.setAttribute("message", "记录不存在！");
	    	request.getRequestDispatcher("log.jsp").forward(request, response);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
