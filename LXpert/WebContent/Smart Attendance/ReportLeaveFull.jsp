<jsp:root version="1.2" xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="urn:jsptld:http://java.sun.com/jstl/core"
	xmlns:display="urn:jsptld:http://displaytag.sf.net">
	<jsp:directive.page import="java.io.BufferedReader" />
	<jsp:directive.page import="java.io.FileReader" />
	<jsp:directive.page import="com.my.org.erp.bean.Attendance.AttendanceReport" />
	<jsp:directive.page contentType="text/html; charset=UTF-8" />
	<jsp:directive.page import="java.sql.*" />
	<jsp:directive.page import="java.util.*" />
	<jsp:declaration>
  	String reportHeader="";
  </jsp:declaration>
	<jsp:text>
		<![CDATA[<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">]]>
	</jsp:text>

	<jsp:text>
		<![CDATA[<html xmlns="http://www.w3.org/1999/xhtml" lang="en">]]>
	</jsp:text>
	<head>

	
<title> :: ATTENDANCE ::</title>


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
		<![CDATA[
     		<center>
  			<a href='../Mainscreen.jsp' target='_self'> Home </a>
  			&nbsp;&nbsp;
      		<a href="LeaveTypeReport.jsp"> Back </a>
      		&nbsp;&nbsp;
      		<a href="../Logout.jsp"> Logout </a>
    ]]>
	</jsp:text>
	<jsp:scriptlet>
  	String caption="Attendance Report";
  	ArrayList arrList =new ArrayList();	
	FileReader fr = new FileReader("LeaveReport.txt");
	BufferedReader br  = new BufferedReader(fr);
	String strfline ="";
	StringTokenizer filecontents;
	String sline="";	
	int fline=1;
	while((strfline=br.readLine())!= null )	
	{	
		if(fline==1) reportHeader=strfline;
		if(fline>=3)
		{
			filecontents = new StringTokenizer(strfline,"^");
			if (! strfline.equalsIgnoreCase("Record not found..."))
			{		
				AttendanceReport attenRep=new AttendanceReport();
				while(filecontents.hasMoreElements())
				{
					String empId=""+filecontents.nextElement();
					if (empId.equalsIgnoreCase("Record not found..."))	break;
					attenRep.setEmpId(empId);
					if(filecontents.hasMoreElements())
						attenRep.setEmpName(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						attenRep.setEmpDepart(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						attenRep.setEmplType(""+filecontents.nextElement());
					if(filecontents.hasMoreElements())
						attenRep.setEmplDate(""+filecontents.nextElement());
					arrList.add(attenRep);
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
	<display:table name="results" export="true" id="currentRowObject">
		<display:caption>
			<jsp:scriptlet>	out.println(reportHeader);  </jsp:scriptlet>
		</display:caption>
		<display:setProperty name="export.pdf.filename" value="example.pdf" />
		<display:setProperty name="export.rtf.filename" value="example.rtf" />
		<display:column property="empId" title="ID" sortable="true"
			headerClass="sortable" />
		<display:column property="empName" title="Name" sortable="true"
			headerClass="sortable" />
		<display:column property="empDepart" title="Dept" />
		<display:column property="emplType" title="Leave Type" />
		<display:column property="emplDate" title="Leave Date" />
	</display:table>
	<jsp:text>
		<![CDATA[
      		<a href='../Mainscreen.jsp' target='_self'> Home </a>
  		
  			&nbsp;&nbsp;
     		<a href='ReportPrint.jsp' target='_self'> HTML Print </a>
  			&nbsp;&nbsp;    
      		<a href="LeaveTypeReport.jsp"> Back </a>
      		</center>
      	]]>
	</jsp:text>
</jsp:root>
