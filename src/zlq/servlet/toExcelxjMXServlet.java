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

import zlq.bean.XunjianDao;
import zlq.bean.XunjianDaoFactory;
import zlq.bean.Xunjian;

public class toExcelxjMXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toExcelxjMXServlet() {
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
		String level = session.getAttribute("level").toString();
		String xjName   = session.getAttribute("xjName").toString();
		String period1  = session.getAttribute("period1").toString();
		String period2  = session.getAttribute("period2").toString();				
		
		XunjianDao xunjianDao = XunjianDaoFactory.getXunjianDao();
		List<Xunjian> xjList = xunjianDao.MxxjSearch(period1, period2,xjName,stationName,level);
		//System.out.println(eleclist.size());
		String exportFileName = "巡检统计表_"+System.currentTimeMillis()+".xls";//导出文件名
		//创建工作薄
		XSSFWorkbook workbook = new XSSFWorkbook(); // 创建一个excel
		XSSFSheet sheet = workbook.createSheet("已巡检基站统计表");
		//创建sheet
		//创建第一行，标题
		XSSFRow row = sheet.createRow(0);
		String[] cellTitle = {"基站编号","基站名称", "基站等级", "巡检人员","巡检日期"};
		
		for (int i = 0; i < cellTitle.length; i++) {
			sheet.setColumnWidth(i,3500);
			XSSFCell createCell = row.createCell(i);
			createCell.setCellValue(cellTitle[i]);
		}
		 for(int i=1;i<=xjList.size();i++)
		 {
			 Xunjian e = xjList.get(i-1);
			 XSSFRow dataRow = sheet.createRow((short) i);
			 for (int j = 0; j < cellTitle.length; j++) 
			 {
				XSSFCell dataCell = dataRow.createCell(j);
				switch (j) {
				case 0:
					dataCell.setCellValue(e.getBaseId());
					break;
				case 1:
					dataCell.setCellValue(e.getBaseName());
					break;
				case 2:
					dataCell.setCellValue(e.getBaserank());
					break;
				case 3:
					dataCell.setCellValue(e.getXjName());
					break;
				case 4:
					dataCell.setCellValue(e.getXjDate());
					break;
				}
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


