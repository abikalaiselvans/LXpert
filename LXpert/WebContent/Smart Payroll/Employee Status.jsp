<%@ page import="java.sql.*,java.io.*,java.util.*"%>
<%@ include file="index.jsp"%>

<%!
	Connection con ;
	PreparedStatement pstm;
	ResultSet rst;
	String userid;
	String no,dist;
	
	String sql_Select_Query ="select * from m_staff";

	public void releaseJDBCResource() 	
	{
		try
		{
			rst.close();
			pstm.close();
			 

		}catch(NullPointerException ex)
		{
			//System.out.println(ex);
		}catch(SQLException ex)
		{
			//System.out.println(ex);
		}
	}

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript">
	
				function validate()
	
					{
				
						var Aname=document.getElementById("an").value
						var Acode=document.getElementById("ac").value
						
						
  					    submitOK="true"

						
                                          
							
						    if (Aname=="")

 							 {

								alert(" Enter Allowance Name")

								document.a.aname.focus()

                 					         submitOK="false"

							 }
							
							else if (Acode=="")

 							 {

								alert(" Enter Allowance Code")

								document.a.acode.focus()

                 					         submitOK="false"

							 }
							 
                        
						    if (submitOK=="false")
	
							 {
			
								 return false

 							 }
 	
		
					}	
			</script>

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
.style1 {	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
}
.style12 {color: #FFFFFF}
.style14 {color: #FFFFFF; font-weight: bold; }
-->
</style>
</head>
<form  AUTOCOMPLETE = "off"   name="a" method="post" action="EmpStatusAdd.jsp"
	onSubmit="return validate()">
<body  onpaste='return false;'>


<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Employee
Status</p>
<center>
<table width="1000" border=0 align="center">
	<!--DWLayoutTable-->
	<tr>
		<td width="216" rowspan="3" valign="top" background="../if"></td>
		<td width="274" colspan="3" valign="top" background="../if">
		<table border="1">

			<tr>
				<td width="126">
				<center>Employee Name</center>
				</td>
				<td><select name="OptEmpName">
					<%
				try
	{
		String profilename="c:/Tomcat 5.0/bin/JDBC.properties";
		InputStream input  = new FileInputStream(profilename);	
		Properties jdbc = new Properties();
		jdbc.load(input);
		String driver = jdbc.getProperty("Driver");
		String url =jdbc.getProperty("UrlCol");
		String struser =jdbc.getProperty("User");
		String strpass =jdbc.getProperty("Passw");
		//Database Connectivity
		Class.forName(driver);
		con = DriverManager.getConnection(url,struser,strpass);
		pstm = con.prepareStatement(sql_Select_Query);
		rst = pstm.executeQuery();

		while(rst.next())
		{
			
			%>
					<option value=<%=rst.getString("CHR_EMPID")%>
						/<%=rst.getString("CHR_STAFFNAME")%>><%=rst.getString("CHR_EMPID")%>
					/<%=rst.getString("CHR_STAFFNAME")%></option>
					<%
		}
		releaseJDBCResource();

	}catch(Exception ex)
	{
		//System.out.println(ex);
	}
		releaseJDBCResource();
%>
				
			</tr>
			</select>
		</table>
		</td>
		<td width="10" rowspan="2" valign="top" background="../if">
		<div align="right"></div>
		</td>
		<td width="575"></td>
	</tr>
	<tr>
		<td colspan="3" valign="top" background="../if">&nbsp;</td>
		<td></td>
	</tr>
	<tr>
		<td width="67" valign="top" background="../if">&nbsp;</td>
		<td width="67" valign="top" background="../if"><input
			type="submit" name="Submit" value="Submit"   accesskey="s"   ></td>
		<td width="30" valign="top" background="../if"><input
			type="reset" name="reset" value="Clear"></td>
		<td valign="top" background="../if">&nbsp;</td>
		<td></td>
	</tr>
</table>

<table width="1000" border=0>
	<!--DWLayoutTable-->
	<tr>
		<td width="221" height="72">&nbsp;</td>
		<td width="97" valign="top" background="../if"><a
			href="SmartpayrollImg.htm"><img
			src="../Image/Smart%20Attendance/Home.gif" width="93" height="70"
			border="0"></a></td>
		<td width="370">&nbsp;</td>
		<td width="92" valign="top" background="../if"><a
			href="PMSmain.htm"><img
			src="../Image/Smart%20Attendance/Back.gif" width="92" height="69"
			border="0"></a></td>
		<td width="194">&nbsp;</td>
	</tr>
</table>
<p>&nbsp;</p>
<p><br>
<br>
</p>
<%@ include file="../footer.jsp"%>
</body>
</form>
</html>
