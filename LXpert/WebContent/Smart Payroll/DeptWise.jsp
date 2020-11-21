<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="index.jsp"%>
<%!

	Connection con ;
	Statement st ;
	ResultSet rs;
	String sql;
	String driver;
	String url;
	
%>

<%
	try
	{
		InputStream input  = new FileInputStream("c:/Tomcat 5.0/bin/JDBC.properties");	
		Properties jdbc = new Properties();
		jdbc.load(input);
		driver = jdbc.getProperty("Driver");
		url =jdbc.getProperty("UrlCol");
		String struser =jdbc.getProperty("User");
		String strpass =jdbc.getProperty("Passw");
		Class.forName(driver);
		con = DriverManager.getConnection(url,struser,strpass);
	}
	catch(Exception e)
	{
		//System.out.println(e);
	}
		
	try
	{
	   	st=con.createStatement();
		rs = st.executeQuery("select  * from m_depart");
	}
	
	catch(Exception npe)
	{
		//System.out.println(npe);
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title> :: PAYROLL ::</title>


 
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

<style type="text/css">
<!--
.style8 {
	font-family: Verdana;
	font-size: 12px;
}
a:visited {
	color: #663366;
}
a:hover {
	color: #FF0000;
}
a:active {
	color: #0000FF;
}
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   method="post" action="DeptOfficalInfo.jsp">
<body  onpaste="return false;" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<br>
<br>
<br>
<br>
<table width="1002">
	<!--DWLayoutTable-->
	<tr>
		<td width="299" height="91">&nbsp;
		<td width="418" valign="top">
		<table width="392" border="1" align="center">
			<!--DWLayoutTable-->
			<tr align="center" valign="middle">
				<td height="23" colspan="3">Official Information Department
				View</td>
			</tr>
			<tr>
				<td width="161" height="28">Select the Departemt</td>
				<td width="24" colspan="2" valign="top"><select
					name="Department">
					<%
	while(rs.next())
	{
	%>
					<option value="<%= rs.getString("int_DepartID") %>">
					<% out.println(rs.getString("chr_DepartName")); %>
					</option>
					<%
	}
	 %>
				</select></td>
			</tr>
			<tr>
				<td height="28" colspan="2" align="right" valign="top"><input
					type="submit" value="Submit"   accesskey="s"   ></td>
				<td width="185" valign="top"><input type="reset" value="Clear"></td>
			</tr>
		</table>
		<td width="263">&nbsp;
	</tr>
	<tr>
		<td height="28">&nbsp;
		<td>&nbsp;
		<td>&nbsp;
	</tr>
</table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<table width="1002" height="67">
	<!--DWLayoutTable-->
	<tr>
		<td width="328" height="72">&nbsp;</td>
		<td width="91" valign="top"><a href="../Home.jsp"><img
			src="../Image/General/Home.gif" width="93" height="70" border="0"></a></td>
		<td width="146">&nbsp;</td>
		<td width="90" valign="top"><a href="Payrollmain.jsp"><img
			src="../Image/General/Back.gif" width="92" height="69" border="0"></a></td>
		<td width="312">&nbsp;</td>
	</tr>
</table>
         
<br>
<br>
<br>
                                                                      
<%@ include file="../footer.jsp"%>
</body>
</form>
</html>
