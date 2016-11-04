package cn.edu.bupt.anm.serv;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
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
import cn.edu.bupt.anm.po.Task;

/**
 * Servlet implementation class TaskServlet
 */
@WebServlet("/TaskServlet")
public class TaskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TaskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		HttpSession session = request.getSession();

		if("list".equals(action)){
    		new DaoFactory();
			Dao dao = DaoFactory.getTaskDaoInstance();
			String sql = null;
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM task ";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------分页--------------------------------------------
			
			sql = "SELECT * FROM task order by stationName desc"+" LIMIT "+firstCount+","+pageSize;
			List<Task> tasks = dao.list(sql);
			Iterator<Task> iter = tasks.iterator();
			request.setAttribute("taskList", tasks);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
			if(!iter.hasNext())
				session.setAttribute("message", "记录不存在！");
    		request.getRequestDispatcher("task.jsp").forward(request, response);

		}	
//		-------------del--------------------------------------------
		if("del".equals(action)){
			int stationId = Integer.valueOf(request.getParameter("stationId"));
			Dao dao = DaoFactory.getTaskDaoInstance();
			String sql = "DELETE FROM task WHERE stationId="+stationId;	
			System.out.println("stationId="+stationId);
			if(dao.del(sql,stationId) == 0)
				session.setAttribute("message", "要删除的记录不存在！！");
			else
				session.setAttribute("message", "删除成功！");
			response.sendRedirect("TaskList?action=list&&pageNum=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
//		------------------------add------------------------------------------------------------------
		if("add".equals(action)){
			String stationName = request.getParameter("stationName");
			String names = request.getParameter("names");
			String leader = request.getParameter("leader");
			String areas = request.getParameter("areas");
			Task task = new Task();
			task.setStationName(stationName);
			task.setNames(names);
			task.setLeader(leader);
			task.setAreas(areas);
			Dao dao = DaoFactory.getTaskDaoInstance();
			if(dao.add(task) == 0)
				session.setAttribute("message", "添加失败！");
			else
				session.setAttribute("message", "添加成功！");
			response.sendRedirect("TaskList?action=list&&pageNum=1");
		}
//		------------------------save------------------------------------------------------------------
		if("modify".equals(action)){
			String stationName = request.getParameter("stationName");
			String names = request.getParameter("names");
			String leader = request.getParameter("leader");
			String areas = request.getParameter("areas");
//			System.out.println(stationName);
			Task task = new Task();
			task.setStationName(stationName);
			task.setNames(names);
			task.setLeader(leader);
			task.setAreas(areas);
			Dao dao = DaoFactory.getTaskDaoInstance();
			dao.modify(task);;
			session.setAttribute("message", "修改成功");
			response.sendRedirect("TaskList?action=list&&pageNum=1");
		}

	}

}
