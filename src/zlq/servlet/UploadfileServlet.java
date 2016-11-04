package zlq.servlet;

import java.io.*;
import java.math.*;
import java.util.*;
import java.text.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;

import zlq.bean.ElecDao;
import zlq.bean.ElecImpl;
import zlq.bean.ElecDaoFactory;
import wyk.bean.BaseStation;
import zlq.bean.findlast;

public class UploadfileServlet extends HttpServlet{
	
	/**
	 * Constructor of the object.
	 */
	public UploadfileServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
	
	@SuppressWarnings("unchecked")
	@Override  
    public void doPost(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {
		HttpSession session = request.getSession();
		String name=session.getAttribute("xjry").toString();		
		BaseStation bs=(BaseStation) session.getAttribute("baseInfo");	
		ElecDao elecDao = ElecDaoFactory.getElecDaoInstance();
		
        request.setCharacterEncoding("utf-8");  
        PrintWriter out1 = response.getWriter();
        response.setContentType("text/plain; charset=utf-8");
        
        findlast fl=new findlast();
        double elecnum=0;//电表度数        
        String picname="";//图片名称
        String baseid=bs.baseId;
        String basename=bs.baseName;
        String baserank=bs.level;
        //System.out.println("hel;lo11");
        String lastchecktime=fl.searchlasttime(basename);
        double lastchecknum=fl.searchlastnum(basename);
        
        
      //获取当前时间
        Calendar ca=Calendar.getInstance();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
        String nowdate=format.format(ca.getTime());
        
      //获得磁盘文件条目工厂。  
        DiskFileItemFactory factory = new DiskFileItemFactory(); 
        
        
      //获取文件上传需要保存的路径，uploadImg文件夹需存在。  
        String path = request.getSession().getServletContext().getRealPath("/uploadImg");
        //String path =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/uploadImg";      
        //ServletContext context=getServletConfig().getServletContext();//获取上下文
        //String uploadpath=context.getInitParameter("upload folder");//获取参数
        //String path=context.getRealPath(uploadpath);//得到文件夹upload的实际路径        
        
        
      //设置暂时存放文件的存储室，这个存储室可以和最终存储文件的文件夹不同。因为当文件很大的话会占用过多内存所以设置存储室。 
        factory.setRepository(new File(path));  
      //设置缓存的大小，当上传文件的容量超过缓存时，就放到暂时存储室。 
        factory.setSizeThreshold(1024*1024*100);  
        ServletFileUpload upload = new ServletFileUpload(factory);
        try{  
        	//调用 parseRequest（request）方法  获得上传文件 FileItem 的集合list 可实现多文件上传。
            List<FileItem> list = (List<FileItem>)upload.parseRequest(request); 
             
            for(FileItem item:list){  
            	//获取表单属性名字。  
                String namef = item.getFieldName();  
                //如果获取的表单信息是普通的文本信息。即通过页面表单形式传递来的字符串。  
                if(item.isFormField()){
                    //获取用户具体输入的字符串， 
                    String value = item.getString();                
                    elecnum=Double.parseDouble(value);
                    request.setAttribute(namef, value);
                }
              //如果传入的是非简单字符串，而是图片，音频，视频等二进制文件.
                else{   
                    //获取路径名  
                    picname = item.getName();
                    String picpath=path+picname.substring(0, 6)+"\\";
                    File outfile = new File(picpath);
                    //如果文件不存在，则创建一个新文件
                    if(!outfile.isFile()){
                        outfile.createNewFile();
                    }
                  //取到最后一个反斜杠。  
                    int start = picname.lastIndexOf("\\");  
                    //截取上传文件的 字符串名字。+1是去掉反斜杠。  
                    String filename = picname.substring(start+1);  
                    request.setAttribute(namef, filename);  
                      
                    /*第三方提供的方法直接写到文件中。 
                     * item.write(new File(path,filename));*/  
                    //收到写到接收的文件中。  
                    OutputStream out = new FileOutputStream(new File(path,filename));  
                    InputStream in = item.getInputStream();  
                      
                    int length = 0;  
                    byte[] buf = new byte[1024];  
                    if(item.getSize()==0){
                    	try{
                        	out1.print("failed");
        					out1.flush();
        					out1.close();
        				}
        				catch(Exception e){
        					e.printStackTrace();
        				}
                     }
                     while((length = in.read(buf))!=-1){  
                        out.write(buf,0,length);  
                        try{
                        	out1.print("success");
        					out1.flush();
        					out1.close();
        				}
        				catch(Exception e){
        					e.printStackTrace();
        				}

                    }  
                    in.close();  
                    out.close();  
                }  
            } 
            
            //向电力检测表dljc插入信息
            elecDao.elecInsert(baseid, basename, baserank, name, lastchecktime, lastchecknum, nowdate, elecnum, picname);
        }catch(Exception e){  
        	out1.print("failed");
			out1.flush();
			out1.close();
            e.printStackTrace();  
        }  
          
    }  
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}
	public void init() throws ServletException {
		// Put your code here
	}
}
