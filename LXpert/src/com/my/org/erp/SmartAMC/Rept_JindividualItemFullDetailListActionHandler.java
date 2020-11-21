package com.my.org.erp.SmartAMC;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRExporter;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.util.SimpleFileResolver;
import com.my.org.erp.SmartReport.ReportFunctions;
import com.my.org.erp.ServiceLogin.AbstractActionHandler;
import com.my.org.erp.ServiceLogin.DateUtil;

public class Rept_JindividualItemFullDetailListActionHandler extends AbstractActionHandler 
{
	  
	JasperPrint jasperPrint;
	JRExporter exporter;
	String hImageExpression="";
	String fImageExpression="";
	
	
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		System.out.println("insite Rept_JindividualItemFullDetail handle");
		try 
		{ 
			String action = request.getParameter("actionS");
			String rptfilename = request.getParameter("rptfilename");
			String reporttype = request.getParameter("reportType");
			
			 HashMap<Object,Object> map = new HashMap<Object,Object>();
			
			if(action.equals("AMCRept_JindividualItemFullDetailList")) 
			{
				System.out.println("insite AMCRept_JindividualItemFullDetail");
				String fromdate = request.getParameter("fromdate");
				String todate = request.getParameter("todate");
				fromdate=DateUtil.FormateDateSQL(fromdate);
				todate=DateUtil.FormateDateSQL(todate);
				System.out.println("fromdate:"+fromdate);
				
				
				asql="SELECT b.CHR_CUSTOMERNAME,b.CHR_PHONE,b.CHR_MOBILE,b.CHR_EMAIL,c.CHR_CENTERNAME,a.CHR_SERIALNO,DATE_FORMAT(a.DT_STARTDATE,'%d-%M-%Y %H:%i:%s'),DATE_FORMAT(a.DAT_UPDATION,'%d-%M-%Y %H:%i:%s'),DATE_FORMAT(a.DT_ENDDATE,'%d-%M-%Y %H:%i:%s'),if(a.CHR_CATEGORY ='W','Warranty',if(a.CHR_CATEGORY='A','AMC','On Call' )  ) FROM inv_m_serviceamc  a ,inv_m_servicecustomerinfo b,inv_m_servicecenter c WHERE a.INT_CUSTOMERID =b.INT_CUSTOMERID AND b.INT_SERVICECENTERID=c.INT_SERVICECENTERID AND DATE(a.DT_STARTDATE) >='"+fromdate+"' AND DATE(a.DT_STARTDATE) <='"+todate+"' ORDER BY b.CHR_CUSTOMERNAME";
				System.out.println("asql:"+asql);
				
				String data[][]=com.my.org.erp.common.CommonFunctions.QueryExecute(asql);
				
				if(data.length>0)
				{
			
				File headerImage = new File(Path + "/images/hImage.jpg");
				File footerImage = new File(Path + "/images/fImage.jpg");
				
				hImageExpression=(headerImage.exists())?"../../images/hImage.jpg":null;
				fImageExpression=(footerImage.exists())?"../../images/fImage.jpg":null;

				File reportDir = new File(Path + "/report/CRM/" + rptfilename+".jrxml");
								
				map.put(JRParameter.REPORT_FILE_RESOLVER, new SimpleFileResolver(reportDir));
				map.put("hImageExpression", hImageExpression);
				map.put("fImageExpression", fImageExpression);
				
				jasperPrint=ReportFunctions.createReport(jasperPrint, request, response, reportDir, rptfilename, asql, con, Path,map);
				ReportFunctions.generateAllReport(exporter, jasperPrint, request, response, reporttype, Path, rptfilename);
				}
				else
				{
					request.setAttribute("error", "Data does not exist for the given input" );
					RequestDispatcher dispatchers = request.getRequestDispatcher("/error/index.jsp");
		    		dispatchers.forward(request, response);
				}
	 		}
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
			request.setAttribute("error", e.getMessage() );
			RequestDispatcher dispatchers = request.getRequestDispatcher("/error/index.jsp");
    		dispatchers.forward(request, response);
		}
	}



	

}
