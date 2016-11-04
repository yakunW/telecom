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
import cn.edu.bupt.anm.po.Base;
import cn.edu.bupt.anm.po.Staff;
import cn.edu.bupt.anm.po.Task;

/**
 * Servlet implementation class BaseServlet
 */
@WebServlet("/BaseServlet")
public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BaseServlet() {
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
//      ------------------------------list--------------------------------
		if("list".equals(action)){
    		new DaoFactory();
			Dao dao = DaoFactory.getBaseDaoInstance();
			String sql = null;
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM base ";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------分页--------------------------------------------
			
			sql = "SELECT * FROM base order by baseName desc"+" LIMIT "+firstCount+","+pageSize;
			List<Base> bases = dao.list(sql);
			Iterator<Base> iter = bases.iterator();
			request.setAttribute("baseList", bases);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
    		if(!iter.hasNext())
				session.setAttribute("message", "记录不存在！");
    		request.getRequestDispatcher("jtpz.jsp").forward(request, response);
		}
//		-------------del--------------------------------------------
		if("del".equals(action)){
			String baseId = request.getParameter("baseId");
			String sql;
			Dao dao = DaoFactory.getBaseDaoInstance();
			sql = "DELETE FROM base WHERE baseId="+"'"+baseId+"'";	
			if(dao.del(sql,0) == 0)
				session.setAttribute("message", "要删除的记录不存在！！");
			else
				session.setAttribute("message", "删除成功！");
			response.sendRedirect("BaseList?action=list&&pageNum=1");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		HttpSession session = request.getSession();
//		-------------add--------------------------------------------
		if("add".equals(action)){
			String baseId = request.getParameter("baseId");
			int category = Integer.valueOf(request.getParameter("category"));
			String baseName = request.getParameter("baseName");
			String level = request.getParameter("level");
			String longitude = request.getParameter("longitude");
			String latitude = request.getParameter("latitude");
			String address = request.getParameter("address");
			String stationName = request.getParameter("stationName");
			String area = request.getParameter("area");
			String cell_id = request.getParameter("cell_id");
			
			Base base = new Base();
			base.setBaseId(baseId);
			base.setCategory(category);
			base.setBaseName(baseName);
			base.setLevel(level);
			base.setLongitude(longitude);
			base.setLatitude(latitude);
			base.setAddress(address);
			base.setStationName(stationName);
			base.setArea(area);
			base.setCell_id(cell_id);
			Dao dao = DaoFactory.getBaseDaoInstance();
			if(dao.add(base) == 0)
				session.setAttribute("message", "添加失败！");
			else
				session.setAttribute("message", "添加成功！");
			response.sendRedirect("BaseList?action=list&&pageNum=1");
		}

//		-------------modify--------------------------------------------
		if("modify".equals(action)){
//			System.out.println("save---Servlet");
			String baseId = request.getParameter("baseId");
			int category = Integer.valueOf(request.getParameter("category"));
			String baseName = request.getParameter("baseName");
//			System.out.println("save---Servlet:" + baseId + " " + baseName);
			String level = request.getParameter("level");
			String longitude = request.getParameter("longitude");
			String latitude = request.getParameter("latitude");
			String address = request.getParameter("address");
			String stationName = request.getParameter("stationName");
			String area = request.getParameter("area");
			String cell_id = request.getParameter("cell_id");
			
			Base base = new Base();
			base.setBaseId(baseId);
			base.setCategory(category);
			base.setBaseName(baseName);
			base.setLevel(level);
			base.setLongitude(longitude);
			base.setLatitude(latitude);
			base.setAddress(address);
			base.setStationName(stationName);
			base.setArea(area);
			base.setCell_id(cell_id);
			Dao dao = DaoFactory.getBaseDaoInstance();
			dao.modify(base);;
			session.setAttribute("message", "修改成功");
			response.sendRedirect("BaseList?action=list&&pageNum=1");
		}
//		------------------------search------------------------------------------------------------------
		if("search".equals(action)){
			String selFlag = request.getParameter("selFlag");
			String selValue = request.getParameter("selValue");
			String sql,sql0;
			int count;
			Dao dao = DaoFactory.getBaseDaoInstance();
			if("0".equals(selFlag)){
				sql = "SELECT * FROM base WHERE baseName like "+"'%"+selValue+"%' order by baseName ";	
				sql0 = "SELECT count(*) FROM base WHERE baseName like "+"'%"+selValue+"%' order by baseName ";	
			}
			else{
				sql = "SELECT * FROM base WHERE baseId="+"'"+selValue+"'";		
				sql0 = "SELECT count(*) FROM base WHERE baseId="+"'"+selValue+"'";
			}
//			System.out.println(sql);
			List<Base> bases = dao.list(sql);
			Iterator<Base> iter = bases.iterator();
			count = dao.recordCount(sql0);
    		request.setAttribute("baseList", bases);

			if(iter.hasNext())
	    		session.setAttribute("message", "符合查询条件的记录有"+count+"条记录！");
	    	else
	    		session.setAttribute("message", "记录不存在！");
    		request.getRequestDispatcher("jtpz_MD.jsp").forward(request, response);
	    }
	}

}
