<%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.util.*"%>
 <script language="javascript" src="../JavaScript/comfunction.js"></script>
   
<%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*,com.my.org.erp.common.*"%>
<head>
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>



<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />
 <script language="javascript" src="../JavaScript/comfunction.js"></script>
<title> :: PAYROLL ::</title>


 
  


  
 
<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style> 
</head>

<%
try
{
%>

<%@ page contentType="text/html; charset=iso-8859-1" language="java"	import="java.sql.*" errorPage=""%>
<html>
<head>
<link rel="icon" type="image/ico" href="../images/ERP.ico"></link>
<link rel="shortcut icon" href="../images/ERP.ico"></link>



<meta name="resource-type" content="document" />
<meta http-equiv="content-type" content="text/html; charset=US-ASCII" />
<meta http-equiv="content-language" content="en-us" />
<meta name="author" content="KALAISELVAN K" />
<meta name="contact" content="abikalaiselvan@yahoo.co.in" />
<meta name="copyright" content="Copyright (c)2006-2011 KALAISELVAN K. All Rights Reserved." />
<meta name="description" content="Office Automation ERP Products." />
<meta name="keywords" content="HRM, Human Resource Management, HR Planning, Job Design, Job Analysing, Applicant, Company, Branch, Division,Model,Color,Office, Qualification, Attendance, Biometric, Finger Print, Forms, Leave, Holiday, Common Holiday, Shift Master, Shift Allocation. Proximity, Smart Card, Manual attendance, personal inforamtion , Basic, Allowance, Payroll, Salary Slab, Allowance, Recovery, Professional Tax, Employee attendance, Promotion, Trainning, Ressigner, Email, Jonners, PF, ESI, CTC, CTC, Take Home, Admin charge, Attendance, Payroll, Inventory, Product, Item, Customer, Vendor, vendor group, customer group, Purchase, sales, purchase paymeny, vendor payment, Sales return, purchase return, Quotation , Po, Purchase report, sales report, Tax, service tax, vat, c-form, taxes, user, employee id, payslip, consolidation, Attendance, stock, stock book , stock view, stock transfer, consumables, Serial number tracking, " />


<title> :: PAYROLL ::</title>


 
<script language="javascript" src="../JavaScript/comfunction.js"></script>

<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
  
<style type="text/css">
<!--
.style3 {COLOR: #000000; LINE-HEIGHT: 15px; FONT-FAMILY: Verdana, Arial, Helvetica, Sans-Serif; TEXT-DECORATION: none; font-size: 10px;}
-->
</style>
</head>

<body  onpaste='return false;'>
 
		<%
		 
	String frmdate = request.getParameter("frmdate");
	String todate =  request.getParameter("todate");
	frmdate=com.my.org.erp.ServiceLogin.DateUtil.FormateDateSQL(frmdate);
	todate=com.my.org.erp.ServiceLogin.DateUtil.FormateDateSQL(todate);
	String sql ="";
	sql = " select b.CHR_PFNO PFNumber,a.CHR_EMPID empid,b.CHR_STAFFNAME Name,b.CHR_STAFFFNAME Father, ";
 	sql = sql + " DATE_FORMAT(b.DAT_RESIGNDATE,'%d-%m-%Y') DOR,a.CHR_TER_TYPE, "; 
 	sql = sql + " DATE_FORMAT(b.DAT_PFRESIGNDATE,'%d-%m-%Y') PFLeaving from pay_m_emp_termination a,com_m_staff b ";
 	sql = sql + " where  b.CHR_ESI !='N' AND  b.CHR_PF !='N'  "; 
 	sql = sql + " AND  a.CHR_EMPID=b.CHR_EMPID ";
 	sql = sql + " AND  b.DAT_RESIGNDATE >= '"+frmdate+"' ";
	sql = sql + " AND  b.DAT_RESIGNDATE <= '"+todate+"' ";
	sql = sql + " order by b.CHR_PFNO ";
	//out.println(sql);

	  
	 String data[][] = CommonFunctions.QueryExecute(sql);
	 Vector mn = new Vector();
	 Vector child= null;
     for(int u=0; u<data.length;u++)
	 {
	     	child = new Vector();
			child.addElement((u+1));
			child.addElement(data[u][0]);
			child.addElement(data[u][1]);
			child.addElement(data[u][2]);
			child.addElement(data[u][3]);
			child.addElement(data[u][4]);
			child.addElement(data[u][5]);
		 	child.addElement(data[u][6]);
			mn.add(child);
     } 
 
	 
	request.setAttribute("table",mn);
	 
	%>
	
	 			
			
	<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 				<display:caption><%="STAFF PF INFORMATIONS"%></display:caption>
					<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.No" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="PF Number" sortable="true"><%=temp.elementAt(1)%></display:column>
                    <display:column title="Empid" sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="Name" sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="Father Name" sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="DOR" sortable="true"><%=temp.elementAt(5)%></display:column>
					<display:column title="Resigned Type" sortable="true"><%=temp.elementAt(6)%></display:column>
					<display:column title="PF Leaving " sortable="true"><%=temp.elementAt(7)%></display:column>
					   
					<display:setProperty name="export.csv.filename" value="Form10-Datewise.csv"/>
					<display:setProperty name="export.excel.filename" value="Form10-Datewise.xls"/>
					<display:setProperty name="export.xml.filename" value="Form10-Datewise.xml"/>
					<display:setProperty name="export.pdf.filename" value="Form10-Datewise.pdf"/>
					<display:setProperty name="export.pdf" value="true" />
				</display:table> 
			
	 
	  
	  
	 
<br />
 
									 
 									
 <%
 }
 catch(Exception e)
 {
 	System.out.println(e.getMessage());
 }
 %>									
 