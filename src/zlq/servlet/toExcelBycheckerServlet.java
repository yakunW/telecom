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

import zlq.bean.ElecDao;

import zlq.bean.ElecDaoFactory;

import zlq.bean.Elec;

public class toExcelBycheckerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public toExcelBycheckerServlet() {
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
		String basename = (String)session.getAttribute("baseName");
		String checkername   =  (String)session.getAttribute("checkerName");
		String starttime  = (String)session.getAttribute("startTime");
		String endtime  = (String)session.getAttribute("endTime");				
		
		ElecDao elecDao = ElecDaoFactory.getElecDaoInstance();	
		List<Elec> eleclist = elecDao.elecSearchBychecker(basename,checkername,starttime,endtime);
		
		//System.out.println(eleclist.size());
		String exportFileName = "电量统计表_"+System.currentTimeMillis()+".xls";//导出文件名
		//创建工作薄
		XSSFWorkbook workbook = new XSSFWorkbook(); // 创建一个excel
		XSSFSheet sheet = workbook.createSheet("电量统计表");
		//创建sheet
		//创建第一行，标题
		XSSFRow row = sheet.createRow(0);
		String[] cellTitle = {"基站编号","基站名称", "基站等级", "检测人员","检测时间","上次检测度数","本次检测度数","检测间隔天数","该时间段用电量","平均日用电量","图片名称"};
		
		for (int i = 0; i < cellTitle.length; i++) {
			sheet.setColumnWidth(i,3500);
			XSSFCell createCell = row.createCell(i);
			createCell.setCellValue(cellTitle[i]);
		}
		 for(int i=1;i<=eleclist.size();i++)
		 {
			 Elec e = eleclist.get(i-1);
			 XSSFRow dataRow = sheet.createRow((short) i);
			 for (int j = 0; j < cellTitle.length; j++) 
			 {
				 XSSFCell dataCell = dataRow.createCell(j);
				 switch (j) {
				case 0:
					dataCell.setCellValue(e.getBaseid());
					break;
				case 1:
					dataCell.setCellValue(e.getBasename());
					break;
				case 2:
					dataCell.setCellValue(e.getBaserank());
					break;
				case 3:
					dataCell.setCellValue(e.getCheckername());
					break;					
				case 4:
					dataCell.setCellValue(e.getPresentchecktime());
					break;
				case 5:
					dataCell.setCellValue(e.getLastchecknum());
					break;
				case 6:
					dataCell.setCellValue(e.getPresentchecknum());
					break;
				case 7:
					dataCell.setCellValue(e.getDaysBetween());
					break;
				case 8:
					dataCell.setCellValue(e.getPower());
					break;
				case 9:
					dataCell.setCellValue(e.getAvgStr());
					break;
				case 10:
					dataCell.setCellValue(e.getPicname());
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

