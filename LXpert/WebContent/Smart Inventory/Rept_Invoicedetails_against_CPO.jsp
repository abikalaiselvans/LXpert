<%@ page import="java.sql.*,java.io.*,java.util.*,com.my.org.erp.ServiceLogin.*"%>
<%@ page import="com.my.org.erp.common.CommonFunctions"%>
<%@ taglib uri="/WEB-INF/displaytag.tld" prefix="display" %>
<%@ page import="java.util.*"%>
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
 <title>:: INVENTORY ::</title>

<style type="text/css" media="all">
      @import url("../JavaScript/css/maven-base.css");
      @import url("../JavaScript/css/maven-theme.css");
      @import url("../JavaScript/css/site.css");
      @import url("../JavaScript/css/screen.css");
  </style> 
  
   
</head>
<body >

<%
try
{
 		String reportheader="INVOICES AGAINST CUSTOMER PURCHASE ORDER"; 
		String cponumber = request.getParameter("cponumber");
		String sql ="";
		sql = " SELECT CHR_SALESNO,FIND_A_CUSTOMER_NAME(INT_CUSTOMERID),DATE_FORMAT(DAT_SALESDATE,'%d-%b-%Y'), ";
		sql = sql +" DOU_TOTALAMOUNT, IF(CHR_CANCEL='Y','CANCELLED','') ";
 		sql = sql +" FROM inv_t_directsales WHERE CHR_ROOT='C' AND CHR_CPONUMBER='"+cponumber+"' ";
 		sql = sql +" ORDER BY DAT_SALESDATE ";
 
		Vector mn = new Vector();
	 	Vector child= null;
		String data[][] =  CommonFunctions.QueryExecute(sql);
				
		if(data.length>0)
		{
			for(int u=0;u<data.length;u++)
			{
				child = new Vector();
				child.addElement((u+1));
				child.addElement(data[u][0]);
				child.addElement("<a target='_blank' href='SwapSaleSerialView.jsp?salno="+data[u][0]+"'>Details</a>");
				child.addElement(data[u][1]);
				child.addElement(data[u][2]);
				child.addElement(data[u][3]);
				child.addElement(data[u][4]);
				 mn.add(child); 
			}
		} 
		
		request.setAttribute("table",mn);
%>
<display:table   id="_table" name="table"   export="true" pagesize="25">
 
	 				<display:caption><%=reportheader.toUpperCase()%></display:caption>
	 				<display:setProperty name="basic.empty.showtable" value="true"/><%Vector temp= (Vector)_table;%>
					<display:column title="S.NO" sortable="true"><%=temp.elementAt(0)%></display:column>
					<display:column title="INVOICE"   sortable="true"><%=temp.elementAt(1)%></display:column>
					<display:column title="Details" media='html'   sortable="true"><%=temp.elementAt(2)%></display:column>
					<display:column title="CUSTOMER"   sortable="true"><%=temp.elementAt(3)%></display:column>
					<display:column title="DATE"   sortable="true"><%=temp.elementAt(4)%></display:column>
					<display:column title="AMOUNT"   sortable="true"><%=temp.elementAt(5)%></display:column>
					<display:column title="STATUS"   sortable="true"><%=temp.elementAt(6)%></display:column>
					 
					<display:setProperty name="export.excel.filename" value="Rept_Invoicedetails_against_CPO.xls"/>
					<display:setProperty name="export.pdf.filename" value="Rept_Invoicedetails_against_CPO.pdf"/>
					<display:setProperty name="export.csv.filename" value="Rept_Invoicedetails_against_CPO.csv"/>
					<display:setProperty name="export.pdf"  value="true" />
					 
					 
</display:table> 
    
<br />	<center>	<a href='javascript:window.close()'> CLOSE</a>
</center>
 <%
}
catch(Exception e)
{
}
%>		 
</body>
</html>

