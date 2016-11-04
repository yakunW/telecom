package website;
import dbc.DBConn;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheck extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginCheck() {
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

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out=response.getWriter();
		Connection conn=DBConn.getConnection();
		ResultSet rs=null;
		PreparedStatement pstmt=null;
		try {
			pstmt=conn.prepareStatement("select id,authority from staff where name=? and password=? and authority>1;");
			pstmt.setString(1, request.getParameter("username"));
			pstmt.setString(2, request.getParameter("password"));
			rs=pstmt.executeQuery();
			if(!rs.next()){
				response.sendRedirect("login.jsp?info=error");
			}
			else{

				HttpSession session=request.getSession(true);
				session.setAttribute("UserID", rs.getString("id"));
				session.setAttribute("UserName", request.getParameter("username"));
				session.setAttribute("Privacy", "2");
				response.sendRedirect("front/index.jsp");
				
				try {
					pstmt = conn.prepareStatement("INSERT INTO log(date,message) VALUES(?,?)");
					Date now = new Date(); 
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					pstmt.setString(1, dateFormat.format(now));
//					System.out.println(dateFormat.format(now));
				    pstmt.setString(2,request.getParameter("username")+"µÇÂ¼³É¹¦£¡");
					
					pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			DBConn.closeResultSet(rs);
			DBConn.closePreparedStatement(pstmt);
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
