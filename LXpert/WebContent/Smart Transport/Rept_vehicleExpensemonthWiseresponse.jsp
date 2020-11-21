<%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.util.*"%>
 <script language="javascript" src="../JavaScript/comfunction.js"></script>
 <%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
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
<title> :: TRANSPORT ::</title>

<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>


<%@ include file="../JavaScript/dynamicStylesheet.jsp" %>
 
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
 
<script language="javascript" src="../JavaScript/comfunction.js"> </script><body  onpaste='return false;'><br><br><br><br>
<%
				 
				
				 String Month=request.getParameter("Month");
    	 		 String Year=request.getParameter("Year");
    	 		 String startLetter=request.getParameter("startLetter");
    	 		 String sql="";
				 String reportheader="VEHICLE TRANSACTION";
    	 		 sql =" ";
    	 		 sql = " SELECT INT_EXPENSEID,DATE_FORMAT(DAT_EXPENSEDATE,'%d-%m-%Y'),DOU_NETAMOUNT  FROM veh_t_expense   WHERE INT_EXPENSEID >0";
    	 		 sql = sql +" AND MONTH(DAT_EXPENSEDATE)= "+Month;
	 			 sql = sql +" AND YEAR(DAT_EXPENSEDATE)= "+Year;
	 			 sql = sql +" ORDER BY DAT_EXPENSEDATE";
				 String data[][] =com.my.org.erp.common.CommonFunctions.QueryExecute(sql);
				 Vector mn = new Vector();
				 Vector child= null;
				 for(int u=0; u<data.length;u++)
				 {
						child = new Vector();
						child.addElement((u+1));
						child.addElement(data[u][1]);
						child.addElement(data[u][2]);
						mn.add(child);
				 } 
			   
				 
				request.setAttribute("table",mn);
				out.println("<br><center><h3> "+reportheader+" </h3></center><br>");
			 
 				 
	%>
	
	
 		
	<display:table   id="_table" name="table"   export="true" pagesize="25">
	 
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="Date" sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="Amount" sortable="true"><%=temp.elementAt(2)%></display:column>
					 
					 <display:setProperty name="export.csv.filename" value="Rept_vehicletransaction.csv"/>
					<display:setProperty name="export.excel.filename" value="Rept_vehicletransaction.xls"/>
					<display:setProperty name="export.xml.filename" value="Rept_vehicletransaction.xml"/>
					<display:setProperty name="export.pdf.filename" value="Rept_vehicletransaction.pdf"/>
					<display:setProperty name="export.pdf" value="true" />
					 
</display:table>     
<br />	<center>	<a href='Transportmain.jsp'> CLOSE</a></center>
 
	 		
			
			
 
 
<%
}
catch(Exception e)
{
}
%>

