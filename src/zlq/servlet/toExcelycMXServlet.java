package zlq.servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import zlq.bean.YichangDao;

import zlq.bean.YichangDaoFactory;

import zlq.bean.Yichang;

public class toExcelycMXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toExcelycMXServlet() {
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		HttpSession session=request.getSession(); 
		response.setContentType("text/html");
		request.setCharacterEncoding("GBK");
		String stationName = session.getAttribute("stationName").toString();
		String ycName   =  session.getAttribute("ycName").toString();
		String level  = session.getAttribute("level").toString();
		String period1  = session.getAttribute("period1").toString();
		String period2  = session.getAttribute("period2").toString();				
		
		YichangDao yichangDao = YichangDaoFactory.getYichangDao();
		List<Yichang> ycList = yichangDao.ycSearchMX(stationName,ycName,level,period1,period2);
		
		//System.out.println(eleclist.size());
		String exportFileName = "异常检测统计表_"+System.currentTimeMillis()+".xls";//导出文件名
		//创建工作薄
		XSSFWorkbook workbook = new XSSFWorkbook(); // 创建一个excel
		XSSFSheet sheet = workbook.createSheet("异常检测统计表");
		//创建sheet
		//创建第一行，标题
		XSSFRow row = sheet.createRow(0);
		String[] cellTitle = {"基站编号","基站等级", "基站名称", "巡检人员","异常类型","异常参数","异常值","异常时间","所属表"};
		
		for (int i = 0; i < cellTitle.length; i++) {
			sheet.setColumnWidth(i,3500);
			XSSFCell createCell = row.createCell(i);
			createCell.setCellValue(cellTitle[i]);
		}
		int sum=0;
		 for(int i=1;i<=ycList.size();i++)
		 {			 
			 int div=i-sum;
			 Yichang e = ycList.get(i-1);
			 if(e.getBaseId()!=null&&e.getBaseId()!="")
			 {
				 XSSFRow dataRow = sheet.createRow((short) div);
				 for (int j = 0; j < cellTitle.length; j++) 
				 {
				    XSSFCell dataCell = dataRow.createCell(j);				  
				    switch (j) {
						case 0:
							dataCell.setCellValue(e.getBaseId());
							break;
						case 1:
							dataCell.setCellValue(e.getCategory());
							break;
						case 2:
							dataCell.setCellValue(e.getBaseName());
							break;
						case 3:
							dataCell.setCellValue(e.getStaffName());
							break;					
						case 4:
							dataCell.setCellValue(e.getYclxName());
							break;
						case 5:
							dataCell.setCellValue(e.getYccsName());
							break;
						case 6:
							dataCell.setCellValue(e.getYczName());
							break;
						case 7:
							dataCell.setCellValue(e.getDate());
							break;
						case 8:
							dataCell.setCellValue(e.getTable());
							break;
					}						
				}				 
			 }		
			 else{
				 sum++;
			 }
		 }	    		
		
		response.setHeader("Content-Disposition", "attachment;filename=" + new String((exportFileName).getBytes(), "ISO8859-1"));//设定输出文件头
		response.setContentType("application/vnd.ms-excel;charset=UTF-8");// 定义输出类型

		OutputStream out = response.getOutputStream();
		workbook.write(out);
		out.flush();
		out.close();

	}

}


