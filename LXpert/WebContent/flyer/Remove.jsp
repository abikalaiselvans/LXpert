 <%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
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

<title>:: MAIL CAMPAIGN ::</title>
<style type="text/css">
<!--
body {
	background-color: #D4D0C8;
}
-->
</style></head>
<SCRIPT language='javascript'>  
 
	
function redirects(URLStr ,message)  
{  
	var rs=confirm(message); 
	if (rs==true) 
		location = "http://connect.careind.net/SmartCampus/SmartLoginAuth?filename=HTMLMail&actionS=UTIHTMLMailRemove&Username=MKS&id="+URLStr 
	else
		window.close();	
}	  
</SCRIPT>	  
<%
	String id=request.getParameter("id");
	
%>

<body  onpaste="return false;" onLoad="redirects(<%=id%> ,'Are You Sure  you wish to unsubcribe our future commincations... ') ">

<%
%>
</body>
</html>
 