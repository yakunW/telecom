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
import cn.edu.bupt.anm.po.Staff;

/**
 * Servlet implementation class StaffServlet
 */
@WebServlet("/AdminStaffServlet")
public class AdminStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStaffServlet() {
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

		//privacy用于区分管理员操作的权限区别
		int privacy = Integer.parseInt(session.getAttribute("Privacy").toString());
		if("list".equals(action) && privacy == 3){
    		new DaoFactory();
			Dao dao = DaoFactory.getStaffDaoInstance();
			String sql = null;
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM staff WHERE authority=2";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------分页--------------------------------------------
			
			sql = "SELECT id,name,sex,telephone,password FROM staff WHERE authority=2"
					+ " order by id desc"+" LIMIT "+firstCount+","+pageSize;
			List<Staff> staffs = dao.list(sql);
			Iterator<Staff> iter = staffs.iterator();
			request.setAttribute("staffList", staffs);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
//    		if(!iter.hasNext())
//				session.setAttribute("message", "记录不存在！");
			request.getRequestDispatcher("admin_quanxian.jsp").forward(request, response);

		}	
		if("list".equals(action) && privacy == 4){
    		new DaoFactory();
			Dao dao = DaoFactory.getStaffDaoInstance();
			String sql = null;
//			-------------分页--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM staff WHERE authority=3";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------分页--------------------------------------------
			
			sql = "SELECT id,name,sex,telephone,password FROM staff WHERE authority=3"
					+ " order by id desc"+" LIMIT "+firstCount+","+pageSize;
			List<Staff> staffs = dao.list(sql);
			Iterator<Staff> iter = staffs.iterator();
			request.setAttribute("staffList", staffs);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
//    		if(!iter.hasNext())
//				session.setAttribute("message", "记录不存在！");
			request.getRequestDispatcher("admin_quanxian.jsp").forward(request, response);

		}	
//		-------------resetPassword--------------------------------------------
		if("resetPassword".equals(action)){
			int id = Integer.parseInt(request.getParameter("Id").toString());
//			System.out.println("------------------------");
//			System.out.println("id:"+id);
			Dao dao = DaoFactory.getStaffDaoInstance();
			dao.resetPassword(id);
			session.setAttribute("message", "重置密码成功！");
			response.sendRedirect("AdminStaffList?action=list&&pageNum=1");
		}
		
//		-------------del--------------------------------------------
		if("del".equals(action)){
			int id = Integer.parseInt(request.getParameter("Id").toString());
			Dao dao = DaoFactory.getStaffDaoInstance();
			String sql ="DELETE FROM staff WHERE id="+id;
			dao.del(sql,id);;
			session.setAttribute("message", "删除成功！");
			response.sendRedirect("AdminStaffList?action=list&&pageNum=1");
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
		//privacy用于区分管理员操作的权限区别
		int privacy = Integer.parseInt(session.getAttribute("Privacy").toString());
		privacy--;
		
//		-------------add--------------------------------------------
		if("add".equals(action)){
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String telephone = request.getParameter("telephone");
			Staff staff = new Staff();
			staff.setName(name);
			staff.setSex(sex);
			staff.setTelephone(telephone);
			staff.setPassword("111111");
			staff.setAuthority(privacy);
			Dao dao = DaoFactory.getStaffDaoInstance();
			dao.add(staff);
//			被屏蔽的方法不行
//			request.getRequestDispatcher("StaffList?action=list&&pageNum=1").forward(request, response);
			response.sendRedirect("AdminStaffList?action=list&&pageNum=1");
		}
		
//		-------------modify--------------------------------------------
		if("modify".equals(action)){
			int id = Integer.parseInt(request.getParameter("id").toString());
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String telephone = request.getParameter("telephone");
			Staff staff = new Staff();
			staff.setId(id);
			staff.setName(name);
			staff.setSex(sex);
			staff.setTelephone(telephone);
			Dao dao = DaoFactory.getStaffDaoInstance();
			dao.modify(staff);
			session.setAttribute("message", "修改成功！");
			response.sendRedirect("AdminStaffList?action=list&&pageNum=1");

		}
	}
}
