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
import cn.edu.bupt.anm.po.News;
import cn.edu.bupt.anm.po.Staff;

/**
 * Servlet implementation class NewsServlet
 */
@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsServlet() {
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
//		=----------------------list-------------------------------------------------------
		if("list".equals(action)){
    		new DaoFactory();
			String sql = null;
			Dao dao = DaoFactory.getNewsDaoInstance();
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 8;
			sql = "SELECT COUNT(*) FROM news ";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			System.out.println(recordCount);
//			-------------分页--------------------------------------------
	
			sql = "SELECT * from news order by date desc"+" LIMIT "+firstCount+","+pageSize;
			List<News> news = dao.list(sql);
			Iterator<News> iter = news.iterator();
			request.setAttribute("newsList", news);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
    		if(!iter.hasNext())
				session.setAttribute("message", "记录不存在！");
			request.getRequestDispatcher("newsList.jsp").forward(request, response);
		}	
		//		------------------------del--------------------------------
		if("del".equals(action)){
			int i = Integer.valueOf(request.getParameter("Id"));
			Dao dao = DaoFactory.getNewsDaoInstance();
			String sql = "delete from news where Id="+i;
			if(dao.del(sql,i) == 0)
				session.setAttribute("message", "删除失败！");
			else
				session.setAttribute("message", "删除成功！");
			response.sendRedirect("NewsList?action=list&&pageNum=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
//		------------------------add--------------------------------
		if("add".equals(action)){
			News news =new News();
			news.setTitle(request.getParameter("newstitle"));
			news.setContext(request.getParameter("newscontext"));
			
			Dao dao = DaoFactory.getNewsDaoInstance();
			if(dao.add(news) == 0)
				session.setAttribute("message", "添加失败！");
			else
				session.setAttribute("message", "添加成功！");
			response.sendRedirect("NewsList?action=list&&pageNum=1");
		}
//		------------------------modify--------------------------------
		if("modify".equals(action)){
			News news =new News();
			news.setId(Integer.valueOf(request.getParameter("newsid")));
			news.setTitle(request.getParameter("newstitle"));
			news.setContext(request.getParameter("newscontext"));
			
			Dao dao = DaoFactory.getNewsDaoInstance();
			if(dao.modify(news) == 0)
				session.setAttribute("message", "修改失败！");
			else
				session.setAttribute("message", "修改成功！");
			response.sendRedirect("NewsList?action=list&&pageNum=1");
		}

	}

}
