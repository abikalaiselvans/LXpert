
<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="urn:jsptld:http://java.sun.com/jstl/core"
	xmlns:display="urn:jsptld:http://displaytag.sf.net">
	<jsp:directive.page import="java.io.BufferedReader" />
	<jsp:directive.page import="java.io.FileReader" />
	<jsp:directive.page import="com.my.org.erp.bean.payroll.AllowanceReportBean" />
	<jsp:directive.page contentType="text/html; charset=UTF-8" />
	<jsp:directive.page import="java.sql.*" />
	<jsp:directive.page import="java.util.*" />
	<jsp:declaration>
  	String reportHeader="";
  	String repHeader ="";
  	//String repHead[] ;
  </jsp:declaration>
	<jsp:text>
		<![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">]]>
	</jsp:text>

	<jsp:text>
		<![CDATA[<html xmlns="http://www.w3.org/1999/xhtml" lang="en">]]>
	</jsp:text>
	<head>

	
<title> :: PAYROLL ::</title>


 
	<meta http-equiv="Expires" content="-1" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Cache-Control" content="no-cache" />
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style>
	<link rel="stylesheet" href="../JavaScript/css/print.css"
		type="text/css" media="print" />
	</head>
	<jsp:text>
		<![CDATA[<body  onpaste="return false;" background="../Image/Smart%20Attendance/background1.jpg">
    <embed src="../Image/General/college.swf" width="1000" height="110"/>
    <br><br>
    ]]>
	</jsp:text>
	<jsp:text>
		<![CDATA[<center><br/><br/><br/><br/>]]>
	</jsp:text>

	<jsp:scriptlet>
  	String caption="Allowance Report";
  	ArrayList arrList =new ArrayList();	
	FileReader fr = new FileReader("Report.sys");
	BufferedReader br  = new BufferedReader(fr);
	String strfline ="";
	
	StringTokenizer filecontents;
	String sline="";	
	int fline=1;
	while((strfline=br.readLine())!= null )	
	{	
		if(fline==1) reportHeader=strfline;
		if(fline==2)repHeader=strfline;
		if(fline>=3)
		{
			filecontents = new StringTokenizer(strfline,"^");
			if (! strfline.equalsIgnoreCase("Record not found..."))
			{		
				AllowanceReportBean allRep=new AllowanceReportBean();
				while(filecontents.hasMoreElements())
				{
					String empId=""+filecontents.nextElement();
					if (empId.equalsIgnoreCase("Record not found..."))	break;
					allRep.setEmpId(empId);					
					if(filecontents.hasMoreElements())
						allRep.setEmpName(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setEmpDepartment(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setEmpDesignation(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setHead1(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setHead2(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setHead3(""+filecontents.nextElement());					
					if(filecontents.hasMoreElements())
						allRep.setHead4(""+filecontents.nextElement());					
					arrList.add(allRep);
				}
			}
		}
		fline = fline + 1;
	}	
	br.close();
	fr.close();
	pageContext.setAttribute("tableclass", "");
    request.setAttribute("results", arrList);
    
  </jsp:scriptlet>
	<display:table name="results" pagesize="10" export="true"
		id="currentRowObject">
		<display:caption>
			<jsp:scriptlet>	out.println(reportHeader);  </jsp:scriptlet>
		</display:caption>
		<display:setProperty name="export.pdf.filename" value="example.pdf" />
		<display:setProperty name="export.rtf.filename" value="example.rtf" />

		<display:column property="empId" title="Emp ID" sortable="true"
			headerClass="sortable" />
		<display:column property="empName" title="Emp Name" sortable="true"
			headerClass="sortable" />
		<display:column property="empDepartment" title="Department" />
		<display:column property="empDesignation" title="Designation" />
		<display:column property="head1" title="Adv Open Date"></display:column>
		<display:column property="head2" title="Total Adv" />
		<display:column property="head3" title="Recov Adv" />
		<display:column property="head5" title="Balance Amt" />
		<display:setProperty name="export.pdf" value="true" />
	</display:table>

	<jsp:text>
		<![CDATA[
      		<a href='ReportPrint.jsp' target='_blank'> HTML Print </a>
      		<br/>
      		<a href="PayBill Advance.jsp"> Back </a>
      		</center>
      	]]>
	</jsp:text>
</jsp:root>
