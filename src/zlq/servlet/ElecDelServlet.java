//package zlq.servlet;
//
//import java.io.IOException;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import zlq.bean.ElecDao;
//import zlq.bean.ElecDaoFactory;
//import zlq.bean.Elec;
//import zlq.bean.ElecImpl;
//
//
//public class ElecDelServlet extends HttpServlet{
//
//	public ElecDelServlet(){
//		super();
//	}
//	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException,ServletException{
//		response.setContentType("text/html");
//		request.setCharacterEncoding("utf-8");
//		String action=request.getParameter("action");
//		HttpSession session=request.getSession();
//		
//		if("del".equals(action))
//		{
//			int bsid = Integer.valueOf(request.getParameter("Id"));
//			String date=request.getParameter("Date");
//			ElecDao elec=ElecDaoFactory.getElecDaoInstance();
//			elec.elecdel(bsid, date);
//			session.setAttribute("message", "删除成功！");
//			request.getRequestDispatcher("jiance.jsp").forward(request, response);
//		}
//		
//	}
//	
//}
