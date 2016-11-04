package front;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dbc.DBConn;

public class EditPswd extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public EditPswd() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		Object oPrivacy=request.getSession(true).getAttribute("Privacy");
//		if(Integer.parseInt(oPrivacy.toString())==1){
			if(request.getParameter("password").equals("00000000000000000000")){
				response.sendRedirect("welcome.jsp");
				return;
			}
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			PrintWriter out=response.getWriter();
			Connection conn=DBConn.getConnection();
			int rs=0;
			PreparedStatement pstmt=null;
			try {
				pstmt=conn.prepareStatement("update staff set password=? where id=?;");
				pstmt.setString(1, request.getParameter("password"));
				pstmt.setString(2, request.getSession().getAttribute("UserID").toString());
//				System.out.println("--------------------");
//				System.out.println("id="+request.getSession().getAttribute("UserID").toString());
				rs=pstmt.executeUpdate();
				if(rs==0){
					response.sendRedirect("edit_pswd.jsp?flag=1");
				}
				else{
					response.sendRedirect("edit_pswd.jsp?flag=0");
				}
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally{
				DBConn.closePreparedStatement(pstmt);
			}
		}
//	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
