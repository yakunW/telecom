package admin;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*; // For Date class

/** Simple filter that prints a report on the standard output
* each time an associated servlet or JSP page is accessed.
*/

public class AdminFilter implements Filter {
  public void doFilter(ServletRequest request,
                  ServletResponse response,
                  FilterChain chain)
      throws ServletException, IOException {
    HttpServletRequest req = (HttpServletRequest)request;
    HttpSession session=req.getSession(false);
    
    if(Integer.parseInt(session.getAttribute("Privacy").toString()) < 3)
    {
    	String url = req.getScheme()+"://"+req.getServerName()+":"+req.getServerPort()+req.getContextPath()+"/front/index.jsp";
    	((HttpServletResponse)response).sendRedirect(url);
    	return;
    }
    chain.doFilter(request,response);
  }

  public void init(FilterConfig config)
      throws ServletException {
  }

  public void destroy() {}
}