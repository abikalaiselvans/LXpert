package com.my.org.erp.SmartReport;
import java.awt.Color;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.util.SimpleFileResolver;
import ar.com.fdvs.dj.domain.Style;
import ar.com.fdvs.dj.domain.builders.ColumnBuilder;
import ar.com.fdvs.dj.domain.builders.DynamicReportBuilder;
import ar.com.fdvs.dj.domain.constants.Border;
import ar.com.fdvs.dj.domain.constants.Font;
import ar.com.fdvs.dj.domain.constants.HorizontalAlign;
import ar.com.fdvs.dj.domain.constants.VerticalAlign;
import ar.com.fdvs.dj.domain.entities.columns.AbstractColumn;

import com.my.org.erp.ServiceLogin.AbstractActionHandler;
import com.my.org.erp.common.CommonFunctions;

public class StaffSummaryInfoActionHandler extends AbstractActionHandler 
{
	JasperPrint jasperPrint;
	String hImageExpression="";
	String fImageExpression="";

	public String getSqlQuery(String resigned)
	{

		asql =  " SELECT b.CHR_COMPANYNAME,c.CHR_BRANCHNAME,d.CHR_OFFICENAME,e.CHR_DEPARTNAME,f.CHR_DESIGNAME,a.CHR_GENDER,";
		asql = asql + " COUNT(*) ";
		asql = asql + " FROM  com_m_staff a,com_m_company b,com_m_branch c,com_m_office d,com_m_depart e,com_m_desig f";
		asql = asql + " WHERE a.INT_COMPANYID= b.INT_COMPANYID";
		asql = asql + " AND a.INT_BRANCHID=c.INT_BRANCHID";
		asql = asql + " AND a.INT_OFFICEID=d.INT_OFFICEID";
		asql = asql + " AND a.INT_DEPARTID= e.INT_DEPARTID";
		asql = asql + " AND a.INT_DESIGID = f.INT_DESIGID   ";
		if(!"Y".equals(resigned))
			asql = asql +" AND  a.CHR_TYPE!='T' ";
		asql = asql + " GROUP BY a.INT_COMPANYID,a.INT_BRANCHID,a.INT_OFFICEID,a.INT_DEPARTID,a.INT_DESIGID,a.CHR_GENDER";
		asql = asql + " ORDER BY b.CHR_COMPANYNAME,c.CHR_BRANCHNAME,d.CHR_OFFICENAME,e.CHR_DEPARTNAME,f.CHR_DESIGNAME,a.CHR_GENDER";
		System.out.println("sql:"+asql);
		return asql;
	}
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String action = request.getParameter("actionS");
		if (action.equals("RPTStaffSummaryInfo")) 
		{	
			String reportTile="Staff Count Summary";
			List<HashMap<String,String>> al=new ArrayList<HashMap<String,String>>();
			try 
			{ 
				String rptfilename = request.getParameter("rptfilename");
				String reporttype = request.getParameter("reportType");

				String resigned = request.getParameter("resigned");

				HashMap<Object,Object> map = new HashMap<Object,Object>();

				asql=getSqlQuery(resigned);
				String path=Path + "/report/SmartCommon/" + rptfilename+".jrxml";
				File reportDir = new File(path);

				if (!reportDir.exists()) 
				{
					throw new FileNotFoundException(String.valueOf(reportDir));
				}
				File headerImage = new File(Path + "/images/hImage.jpg");
				File footerImage = new File(Path + "/images/fImage.jpg");

				hImageExpression=(headerImage.exists())?"../../images/hImage.jpg":null;
				fImageExpression=(footerImage.exists())?"../../images/fImage.jpg":null;

				map.put(JRParameter.REPORT_FILE_RESOLVER, new SimpleFileResolver(reportDir));
				map.put("hImageExpression", hImageExpression);
				map.put("fImageExpression", fImageExpression);
				String data1[][] = CommonFunctions.QueryExecute(asql);
				int columnCount=CommonFunctions.intGetColumnCount(asql);
				int grandTot=0;
				if(data1.length>0)
					for(int i=0;i<data1.length;i++)
					{
						HashMap<String,String> h3 = new HashMap<String,String>();

						for(int j=0;j<=columnCount;j++)
						{
							if(j==0)
							{
								h3.put("d"+j,Integer.toString(i+1)+".");
							}

							else if(j==7)
							{
								h3.put("d"+j,data1[i][j-1]);
								//grandTot=grandTot+(Integer.parseInt(data1[i][j-1]));
							}
							else
								h3.put("d"+j,data1[i][j-1]);
						}
						al.add(h3);
					}
				
				/*HashMap<String,String> h3 = new HashMap<String,String>();
				h3.put("d6", "");
				h3.put("d7", "");
				al.add(h3);
				HashMap<String,String> h4 = new HashMap<String,String>();
				h4.put("d6", " Total :");
				h4.put("d7", Integer.toString(grandTot));
				al.add(h4);*/

				DynamicReportBuilder drb = new DynamicReportBuilder();
				Font font = new Font(8,"Times New Roman",true);
				Style headerStyle = new Style();
				headerStyle.setFont(font);
				headerStyle.setHorizontalAlign(HorizontalAlign.CENTER);
				headerStyle.setVerticalAlign(VerticalAlign.MIDDLE);
				headerStyle.setBorder(Border.PEN_1_POINT);
				//Color veryLightGrey = new Color(230, 230, 230);
				headerStyle.setBackgroundColor(Color.LIGHT_GRAY);
				font = new Font(7,"Verdana",false);
				Style detailstyle = new Style();
				detailstyle.setFont(font);
				detailstyle.setHorizontalAlign(HorizontalAlign.LEFT);
				detailstyle.setVerticalAlign(VerticalAlign.MIDDLE);
				detailstyle.setBorder(Border.THIN);
				//detailstyle.setBackgroundColor(veryLightGrey);
				//detailstyle.setTransparent(false);

				Style amountstyle = new Style();
				amountstyle.setFont(font);
				amountstyle.setHorizontalAlign(HorizontalAlign.RIGHT);
				amountstyle.setVerticalAlign(VerticalAlign.MIDDLE);
				amountstyle.setBorder(Border.THIN);

				Style numberstyle = new Style();
				numberstyle.setFont(font);
				numberstyle.setHorizontalAlign(HorizontalAlign.CENTER);
				numberstyle.setVerticalAlign(VerticalAlign.MIDDLE);
				numberstyle.setBorder(Border.THIN);
				if(data1.length>0)
					for(int u=0;u<=columnCount;u++)
					{
						if(u==0)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance()
							.setColumnProperty("d"+u, String.class.getName())
							.setTitle("S.No.").setWidth(25)
							.setStyle(detailstyle).setHeaderStyle(headerStyle)
							.build();
							drb.addColumn(AllowanceCol);
						}
						else if(u==1)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Company").setWidth(100).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}

						else if(u==2)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Branch").setWidth(70).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}
						else if(u==3)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Office").setWidth(70).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}
						else if(u==4)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Department").setWidth(80).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}
						else if(u==5)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Designation").setWidth(90).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}
						else if(u==6)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Gender").setWidth(30).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}

						else if(u==7)
						{
							@SuppressWarnings("deprecation")
							AbstractColumn AllowanceCol = ColumnBuilder.getInstance().setColumnProperty("d"+u, String.class.getName())
							.setTitle("Count of Staffs").setWidth(50).setStyle(detailstyle).setHeaderStyle(headerStyle).build();
							drb.addColumn(AllowanceCol);
						}

					}
				String sresigned="";

				if("Y".equals(resigned))
					sresigned="Yes";
				else if("N".equals(resigned))
					sresigned="No";

				String reportFilter=" Resigners Included :: "+sresigned;
				map.put("reportTitle", reportTile);
				map.put("reportFilters", reportFilter);
				jasperPrint =ReportFunctions.createDynamicJasperReport(drb, path, map, al);
				ReportFunctions.generateJasperReport(jasperPrint, request, response, reporttype, Path, rptfilename, reportTile);
			}
			catch (Exception e) 
			{
				System.out.println(e.getMessage());
				request.setAttribute("error", e.getMessage() );
				RequestDispatcher dispatchers = request.getRequestDispatcher("/error/index.jsp");
				dispatchers.forward(request, response);
			}
			finally
			{
				al=null;
			}
		}
	}
}
