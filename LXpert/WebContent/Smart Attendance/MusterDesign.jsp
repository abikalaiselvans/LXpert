<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="index.jsp"%>
<jsp:useBean id="conbean" class="DBConnection.DBCon" />
<%!
	Connection con ;
	Statement st ;
	ResultSet rs;
	String sql;
	String driver;
	String url;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title> :: ATTENDANCE ::</title>


 
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

<script language="JavaScript" src="../JavaScript/comfunction.js"></script>
<style type="text/css">
<!--
.style8 {
	font-family: Verdana;
	font-size: 12px;
}
.style11 {font-size: 12px}
a:visited {
	color: #663366;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0000FF;
}
.style13 {font-family: Verdana; font-size: 12px; font-weight: bold; }
-->
</style>
<script language="JavaScript">
function Validate()
  {
  	if(checkNullSelect("Designation","Select Designation","select")&& checkNullSelect("Month","Select Month","select")&&(checkNullSelect("Year","Select Year","select"))){
		document.a.submit();
		return true;
	}
	return false;
  }
  </script>
</head>
<form  AUTOCOMPLETE = "off"   name="a" method="post" action="MusterView.jsp"
	onsubmit="return Validate()">
<body  onpaste='return false;'>
<p class="style8">&nbsp;</p>
<p class="style8"><u> </u></p>
<br>
<table width="1002">
	<!--DWLayoutTable-->
	<tr>
		<td width="259" height="129">
		<td colspan="3" valign="top">
		<table width="100%" height="127" border="1" align="center"
			 >
			<!--DWLayoutTable-->
			<tr align="center" valign="top">
				<td height="25" colspan="2" valign="top" 
					class="tablehead"><b>Muster Designation Wise</b></td>
			</tr>
			<tr>
				<td width="132" height="29" valign="middle" class="tabledata">
				Designation</td>
				<td width="283" valign="middle"><span class="style11"> <select
					name="Designation">
					<option value="select">Select</option>
					<%
			try
				{
				con=conbean.getConnection();
	   			st=con.createStatement();
				rs = st.executeQuery("SELECT *  FROM  com_m_desig ");
				while(rs.next())
				{
			%>
					<option value="<%= rs.getString("INT_desigid") %>">
					<% out.println(rs.getString("chr_DesigName"));%>
					</option>
					<%
				}
					rs.close();
					st.close();
					 
				}
		catch(Exception npe)
	{
		//System.out.println(npe);
	}
%>
				</select> </span></td>
			</tr>
			<tr>
				<td height="28" valign="middle" class="tabledata">Month</td>
				<td valign="middle" class="tabledata"><span class="style11">
				<select name="Month">
					<option value="select">Select</option>
					<option value="01">January</option>
					<option value="02">February</option>
					<option value="03">March</option>
					<option value="04">April</option>
					<option value="05">May</option>
					<option value="06">June</option>
					<option value="07">July</option>
					<option value="08">August</option>
					<option value="09">September</option>
					<option value="10">October</option>
					<option value="11">November</option>
					<option value="12">December</option>
				</select> </span></td>
			</tr>
			<tr>
				<td height="29" valign="middle" class="tabledata">Year</td>
				<td valign="middle" class="tabledata"><span class="style11">
				<select name="Year">
					<option value="select">Select</option>
					<option>2000</option>
					<option>2001</option>
					<option>2002</option>
					<option>2003</option>
					<option>2004</option>
					<option>2005</option>
					<option>2006</option>
					<option>2007</option>
					<option>2008</option>
					<option>2009</option>
					<option>2010</option>
					<option>2011</option>
					<option>2012</option>
					<option>2013</option>
					<option>2014</option>
					<option>2015</option>
					<option>2016</option>
					<option>2017</option>
					<option>2018</option>
					<option>2019</option>
					<option>2020</option>
				</select> </span></td>
			</tr>
			<tr>
				<td height="2"></td>
				<td></td>
			</tr>
		</table>
		<td width="281">
	<tr>
		<td height="35">
		<td width="180">
		<td width="54">
		<td width="194">
		<td>
	<tr>
		<td height="26">
		<td>
		<td valign="top"><input type="hidden" name="muster"
			value="Designation"> <input type="submit" name="Submit"
			value="Submit">
		<td>
		<td>
</table>
</td>
</tr>
</table>
<br>
<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</td>
<%@ include file="../footer.jsp"%>
</body>
</form>
</html>