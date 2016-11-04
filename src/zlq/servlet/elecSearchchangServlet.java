package zlq.servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import zlq.bean.ElecDao;

import zlq.bean.ElecDaoFactory;

import zlq.bean.Elec;

public class elecSearchchangServlet extends HttpServlet{
	
	
	
	private static final long serialVersionUID = 1L;

	/**
	 * Constructor of the object.
	 */
	public elecSearchchangServlet() {
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
		String basename = (String)session.getAttribute("baseName");
		String checkername   =  (String)session.getAttribute("checkerName");
		String starttime  = (String)session.getAttribute("startTime");
		String endtime  = (String)session.getAttribute("endTime");
		ElecDao elecDao = ElecDaoFactory.getElecDaoInstance();				
		try {
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
			Date st=sdf.parse(starttime);
            Date et= sdf.parse(endtime);
			@SuppressWarnings("deprecation")
			int m1=st.getMonth();
            @SuppressWarnings("deprecation")
			int m2=et.getMonth();
            long daysBetween=(et.getTime()-st.getTime()+1000000)/(3600*24*1000);
            if(basename==""&&checkername=="")
            {
            	if(daysBetween<=30&&m1==m2){//当时间为同一个月时
        			
        			List<Elec> eleclist = elecDao.elecSearch(basename,checkername,starttime,endtime);
        	    	if(!eleclist.isEmpty()){
        	    		request.setAttribute("eleclist", eleclist);
        			    request.getRequestDispatcher("elecSearchResult.jsp").forward(request, response);			    
        	    	}else{
        					response.sendRedirect("notFoundPage.jsp");    		
        	    	}
        		}
    		    else{
    			    	List<Elec> eleclist = elecDao.elecSearchBytime(basename,checkername,starttime,endtime);
    	    	    	if(!eleclist.isEmpty()){
    	    	    		request.setAttribute("eleclist", eleclist);
    	    	    		request.getRequestDispatcher("elecSearchByTimeResult.jsp").forward(request, response);
    	    	    	}else{
    	    					response.sendRedirect("notFoundPage.jsp");    		
    	    	    	}	    				    			
    	    		}
            }
            else if(basename!="")//按基站查询
            {
            	List<Elec> eleclist = elecDao.elecSearchByBase(basename,checkername,starttime,endtime);
    	    	if(!eleclist.isEmpty()){
    	    		request.setAttribute("eleclist", eleclist);
    	    		request.getRequestDispatcher("elecSearchByBaseResult.jsp").forward(request, response);
    	    	}else{
    					response.sendRedirect("notFoundPage.jsp");    		
    	    	}	    				    			
    		}
            else if(checkername!="")//按检测人员查询
            {
            	List<Elec> eleclist = elecDao.elecSearchBychecker(basename,checkername,starttime,endtime);
    	    	if(!eleclist.isEmpty()){
    	    		request.setAttribute("eleclist", eleclist);
    	    		request.getRequestDispatcher("elecSearchByCheckerResult.jsp").forward(request, response);
    	    	}else{
    					response.sendRedirect("notFoundPage.jsp");    		
    	    	}	
            }
		} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  		
    		//response.sendRedirect("resultByDay.jsp");//这种方法貌似传不过去值
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
