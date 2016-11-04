package cn.edu.bupt.anm.serv;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DatabaseServlet
 */
@WebServlet("/DatabaseServlet")
public class DatabaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatabaseServlet() {
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
		
		if("backup".equals(action)){
			File dirname = new File("D:\\database");
			if (!dirname.exists()) { 
				dirname.mkdirs();
			}
			
			SimpleDateFormat date=new SimpleDateFormat("yyyy-MM-dd_HH.mm.ss");
			String filename = date.format(new Date())+"_jizhan.sql";
			String filepath = "d:\\database\\"+filename;
			
			
			
			String cmd="mysqldump " + "-hlocalhost -uroot -p2008 jizhan ";
//			System.out.println(cmd);
			try { 
				Runtime rt = Runtime.getRuntime();  
				Process child =rt.exec("cmd /c " + cmd);  
				InputStream in = child.getInputStream();// 控制台的输出信息作为输入流  
			    InputStreamReader xx = new InputStreamReader(in, "utf8");// 设置输出流编码为utf8。这里必须是utf8，否则从流中读入的是乱码  
		        String inStr;  
		        StringBuffer sb = new StringBuffer("");  
		        String outStr;  
		        // 组合控制台输出信息字符串  
		        BufferedReader br = new BufferedReader(xx);  
		        while ((inStr = br.readLine()) != null) {  
		            sb.append(inStr + "\r\n");  
		        }  
		        outStr = sb.toString();  
		  
		        // 要用来做导入用的sql目标文件：  
		        FileOutputStream fout = new FileOutputStream(filepath);  
		        OutputStreamWriter writer = new OutputStreamWriter(fout, "utf8");  
		        writer.write(outStr);  
		        // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免  
		        writer.flush();  
		        // 别忘记关闭输入输出流  
		        in.close();  
		        xx.close();  
		        br.close();  
		        writer.close();  
		        fout.close();  
		        
//		        try {
		            // path是指欲下载的文件的路径。
		            File file = new File(filepath);
		            // 取得文件名。
		            String filename_d = file.getName();
		            // 取得文件的后缀名。
		            //String ext = filename.substring(filename.lastIndexOf(".") + 1).toUpperCase();

		            // 以流的形式下载文件。
		            InputStream fis = new BufferedInputStream(new FileInputStream(file));
		            byte[] buffer = new byte[fis.available()];
		            fis.read(buffer);
		            fis.close();
		            // 清空response
		            response.reset();
		            // 设置response的Header
		            response.addHeader("Content-Disposition", "attachment;filename=" + new String(filename_d.getBytes("utf-8"),"ISO-8859-1"));
		            response.addHeader("Content-Length", "" + file.length());
		            OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
		            response.setContentType("application/octet-stream");
		            toClient.write(buffer);
		            toClient.flush();
		            toClient.close();
//		        } catch (IOException ex) {
////		            ex.printStackTrace();
//		        }
		                      
		   } catch (Exception e) {  
//		        System.out.println("/* 备份失败! */");  
		   }   
//			request.setAttribute("message", "数据库成功备份到D盘的database文件夹下。");
//    		request.getRequestDispatcher("database.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		if("recovery".equals(action)){
			String name = request.getParameter("path");
//			System.out.println(name);
			String filepath = "d:\\database\\" + name; 
			String cmd="mysql -uroot -p2008 jizhan ";
//			System.out.println("-----------------------"+ cmd);
			try { 
				Runtime rt = Runtime.getRuntime();  			
			    Process child = rt.exec("cmd /c " + cmd);  
		        OutputStream out = child.getOutputStream();//控制台的输入信息作为输出流  
		        String inStr;  
		        StringBuffer sb = new StringBuffer("");  
		        String outStr;  
		        BufferedReader br = new BufferedReader(new InputStreamReader(new FileInputStream(filepath), "utf8"));  
		        while ((inStr = br.readLine()) != null) {  
		            sb.append(inStr + "\r\n");  
		        }  
		        outStr = sb.toString();  
		  
		        OutputStreamWriter writer = new OutputStreamWriter(out, "utf8");  
		        writer.write(outStr);  
		        // 注：这里如果用缓冲方式写入文件的话，会导致中文乱码，用flush()方法则可以避免  
		        writer.flush();  
		        // 别忘记关闭输入输出流  
		        out.close();  
		        br.close();  
		        writer.close();  
		    } catch (Exception e) {  
//		        System.out.println("/* 恢复失败! */");  
		    } 
			
			request.setAttribute("message", "数据库恢复成功。");
    		request.getRequestDispatcher("database.jsp").forward(request, response);
		}
	}

}
