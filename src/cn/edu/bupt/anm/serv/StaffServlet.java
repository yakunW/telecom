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
@WebServlet("/StaffServlet")
public class StaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffServlet() {
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

//		//privacy�������ֹ���Ա������Ȩ������
//		int privacy = Integer.parseInt(session.getAttribute("Privacy").toString());
//		privacy--;
		if("list".equals(action)){
    		new DaoFactory();
			Dao dao = DaoFactory.getStaffDaoInstance();
			String sql = null;
//			-------------��ҳ--------------------------------------------
			int pageNum = Integer.valueOf(request.getParameter("pageNum"));
			int recordCount = 0;
			int pageSize = 10;
			sql = "SELECT COUNT(*) FROM staff WHERE authority=1";
			recordCount = dao.recordCount(sql);
			int pageCount = (recordCount + pageSize - 1)/ pageSize;
			int firstCount = (pageNum - 1) * pageSize ;
//			-------------��ҳ--------------------------------------------
			
			sql = "SELECT id,name,sex,telephone,password FROM staff WHERE authority=1"
					 + " order by id desc"+" LIMIT "+firstCount+","+pageSize;
			List<Staff> staffs = dao.list(sql);
			Iterator<Staff> iter = staffs.iterator();
			request.setAttribute("staffList", staffs);
    		request.setAttribute("pageCount", pageCount);
    		request.setAttribute("pageNum", pageNum);
    		request.setAttribute("recordCount", recordCount);
    		if(!iter.hasNext())
				session.setAttribute("message", "��¼�����ڣ�");
	    	request.getRequestDispatcher("quanxian.jsp").forward(request, response);
		}	
//		-------------resetPassword--------------------------------------------
		if("resetPassword".equals(action)){
			int id = Integer.parseInt(request.getParameter("Id").toString());
//			System.out.println("------------------------");
//			System.out.println("id:"+id);
			Dao dao = DaoFactory.getStaffDaoInstance();
			dao.resetPassword(id);
			session.setAttribute("message", "��������ɹ���");
			response.sendRedirect("StaffList?action=list&&pageNum=1");
		}
		
//		-------------del--------------------------------------------
		if("del".equals(action)){
//			Staff staff = (Staff)session.getAttribute("staff");
			int id = Integer.valueOf(request.getParameter("Id"));
			Dao dao = DaoFactory.getStaffDaoInstance();
			String sql ="DELETE FROM staff WHERE id="+id;
			dao.del(sql,id);
			session.setAttribute("message", "ɾ���ɹ���");
			response.sendRedirect("StaffList?action=list&&pageNum=1");
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
		//privacy�������ֹ���Ա������Ȩ������
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
//			�����εķ�������
//			request.getRequestDispatcher("StaffList?action=list&&pageNum=1").forward(request, response);
			response.sendRedirect("StaffList?action=list&&pageNum=1");
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
			session.setAttribute("message", "�޸ĳɹ���");
			response.sendRedirect("StaffList?action=list&&pageNum=1");

		}
	}
}
